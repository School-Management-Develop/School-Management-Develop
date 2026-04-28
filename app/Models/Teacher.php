<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Teacher extends Model
{
    protected $fillable = [
        'name',
        'gender',
        'phone_number',
        // 'status',
    ];

    // Display phone — shows "Unknown" if null
    public function getDisplayPhoneAttribute(): string
    {
        return $this->phone_number ?? 'Unknown';
    }
}