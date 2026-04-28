<?php

use App\Models\Student;
use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * Adds `student_name_normalized` (lowercase, no spaces) alongside the
     * existing `student_name` display column, then replaces the
     * (student_name, group_id) unique index with
     * (student_name_normalized, group_id) so that names like
     * "Chan Dara", "chandara", and "Chan  Dara" are treated as duplicates.
     */
    public function up(): void
    {
        Schema::table('students', function (Blueprint $table) {
            $table->string('student_name_normalized')->nullable()->after('student_name');
        });

        // Back-fill existing rows
        Student::query()->each(function (Student $student) {
            $student->updateQuietly([
                'student_name_normalized' => strtolower(str_replace(' ', '', $student->student_name)),
            ]);
        });

        Schema::table('students', function (Blueprint $table) {
            // Make the column non-nullable now that every row has a value
            $table->string('student_name_normalized')->nullable(false)->change();

            // Drop the old display-name unique index …
            $table->dropUnique('students_name_group_unique');

            // … and replace it with the normalized one
            $table->unique(['student_name_normalized', 'group_id'], 'students_name_normalized_group_unique');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::table('students', function (Blueprint $table) {
            $table->dropUnique('students_name_normalized_group_unique');
            $table->unique(['student_name', 'group_id'], 'students_name_group_unique');
            $table->dropColumn('student_name_normalized');
        });
    }
};
