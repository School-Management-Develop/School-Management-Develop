<?php

namespace App\Observers;

use App\Models\Borrow;
use App\Models\Item;

class BorrowObserver
{
    protected function syncItem(int $itemId): void
    {
        $item = Item::find($itemId);
        if (!$item) return;

        $borrowed = Borrow::where('item_id', $itemId)
            ->whereIn('status', ['BORROWED', 'OVERDUE'])
            ->sum('qty');

        $item->borrow    = $borrowed;
        $item->available = max(0, ($item->qty ?? 0) - $borrowed);
        $item->saveQuietly(); // saveQuietly prevents infinite observer loop
    }

    public function created(Borrow $borrow): void
    {
        $this->syncItem($borrow->item_id);
    }

    public function updated(Borrow $borrow): void
    {
        $this->syncItem($borrow->item_id);

        // If item changed, sync the old item too
        if ($borrow->wasChanged('item_id')) {
            $this->syncItem($borrow->getOriginal('item_id'));
        }
    }

    public function deleted(Borrow $borrow): void
    {
        $this->syncItem($borrow->item_id);
    }

    public function restored(Borrow $borrow): void
    {
        $this->syncItem($borrow->item_id);
    }
}