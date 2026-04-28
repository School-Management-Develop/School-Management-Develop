<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Models\Item;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class StudentRegisterController extends Controller
{
    public function create()
    {
        $groups   = Group::orderBy('group_name')->get();
        $items    = Item::orderBy('name')->get();
        $students = Student::orderBy('student_name')->get();

        return view('backend.page.registerStudent.index', compact('groups', 'items', 'students'));
    }

    public function store(Request $request)
    {
        $messages = [
            'phone_number.unique'    => 'This phone number already exists.',
            'phone_number.regex'     => 'Phone number must be 9 or 10 digits and start with 0.',
        ];

        $data = $request->validate([
            'student_name' => ['required', 'string', 'max:255'],
            'gender'       => ['required', 'in:Male,Female'],
            'phone_number' => ['nullable', 'regex:/^0[0-9]{8,9}$/', 'unique:students,phone_number'],
            'group_id'     => ['required', 'exists:groups,group_id'],
            'status'       => ['required', 'in:0,1'],
        ], $messages);

        // Manually check normalized name — Rule::unique can't do this because
        // it passes the raw input value, not the normalized one.
        $normalized = strtolower(
            preg_replace('/[\s\x{200B}\x{200C}\x{FEFF}\x{00A0}]+/u', '', $request->student_name)
        );

        $duplicate = Student::where('student_name_normalized', $normalized)
            ->where('group_id', $request->group_id)
            ->exists();

        if ($duplicate) {
            return back()
                ->withErrors(['student_name' => 'A student with this name (or an equivalent spelling) already exists in this group.'])
                ->withInput();
        }

        // The model mutator on student_name auto-populates student_name_normalized.
        Student::create([
            'student_name' => trim($request->student_name),
            'gender'       => $request->gender,
            'phone_number' => $request->phone_number,
            'group_id'     => $request->group_id,
            'status'       => $request->status,
        ]);

        return redirect()->route('student.register')->with('success', 'Student registered successfully.');
    }

    public function checkPhone(Request $request)
    {
        $student = Student::where('phone_number', $request->phone_number)->first();

        if ($student) {
            return response()->json([
                'exists'       => true,
                'student_name' => $student->student_name,
                'gender'       => $student->gender,
                'group_id'     => $student->group_id,
            ]);
        }

        return response()->json(['exists' => false]);
    }

    public function checkStudentName(Request $request)
    {
        // Normalize the incoming name so the lookup is style-insensitive
        $normalized = strtolower(
            preg_replace('/[\s\x{200B}\x{200C}\x{FEFF}\x{00A0}]+/u', '', $request->student_name ?? '')
        );
        $student = Student::with('group')
            ->where('student_name_normalized', $normalized)
            ->first();

        if ($student) {
            return response()->json([
                'exists'       => true,
                'student_name' => $student->student_name,   // return the stored display name
                'gender'       => $student->gender,
                'phone_number' => $student->phone_number,
                'group_name'   => $student->group->group_name ?? '',
            ]);
        }

        return response()->json(['exists' => false]);
    }
}