<?php

namespace App\Http\Controllers\Backend;

use App\Http\Controllers\Controller;
use App\Models\Group;
use App\Models\Student;
use Illuminate\Http\Request;
use Illuminate\Validation\Rule;

class StudentController extends Controller
{

public function index(Request $request)
{
    // Get Teacher group ID to exclude from student list
    $teacherGroup = Group::where('group_name', 'Teacher')->first();
    $teacherGroupId = $teacherGroup?->group_id;

    $query = Student::with(['group'])
        // Exclude teachers from student page
        ->when($teacherGroupId, fn($q) => $q->where('group_id', '!=', $teacherGroupId));

    // ... rest of your existing filters unchanged ...
    $search = $request->input('q');
    if ($search) {
        $query->where('student_name', 'like', "%{$search}%");
    }

    $students = $query->orderBy('student_name')->paginate(10)->withQueryString();

    $groups = Group::where('group_name', '!=', 'Teacher')
        ->orderBy('group_name')
        ->get();

    $statTotal    = Student::when($teacherGroupId, fn($q) => $q->where('group_id', '!=', $teacherGroupId))->count();
    $statActive   = Student::when($teacherGroupId, fn($q) => $q->where('group_id', '!=', $teacherGroupId))->where('status', 1)->count();
    $statInactive = Student::when($teacherGroupId, fn($q) => $q->where('group_id', '!=', $teacherGroupId))->where('status', 0)->count();

    return view('backend.page.students.index', compact(
        'students',
        'groups',
        'statTotal',
        'statActive',
        'statInactive'
    ));
}

    public function store(Request $request)
    {
        $messages = [
            'student_name.unique' => 'This student name already exists',
            'phone_number.unique' => 'This phone number already exists.',
        ];

        $data = $request->validate([
            'student_name' => [
                'required',
                'string',
                'max:255',
                Rule::unique('students')->where(function ($q) use ($request) {
                    return $q->where('group_id', $request->group_id);
                }),
            ],
            'gender' => ['required', 'in:Male,Female'],
            'phone_number' => ['nullable', 'string', 'max:50', 'unique:students,phone_number'],
            'group_id' => ['required', 'exists:groups,group_id'],
            'status' => ['required', 'in:0,1'],
        ], $messages);

        Student::create($data);

        return redirect()->route('students.index')->with('success', __('app.Student added.'));
    }

    public function show($studentid)
    {
        $student = Student::with('group')->where('student_id', $studentid)->firstOrFail();

        return view('backend.page.students.show', compact('student'));
    }

    public function update(Request $request, $student_id)
    {
        $student = Student::where('student_id', $student_id)->firstOrFail();

        $messages = [
            'student_name.unique' => 'This student name already exists.',
        ];

        $data = $request->validate([
            'student_name' => [
                'required',
                'string',
                'max:255',
                Rule::unique('students')
                    ->where(fn ($q) => $q->where('group_id', $request->group_id))
                    ->ignore($student->student_id, 'student_id'),
            ],
            'gender' => ['required', 'in:Male,Female'],
            'phone_number' => [
                'nullable',
                'string',
                'max:50',
                Rule::unique('students', 'phone_number')->ignore($student->student_id, 'student_id'),
            ],
            'group_id' => ['required', 'exists:groups,group_id'],
            'status' => ['required', 'in:0,1'],
        ], $messages);

        $student->update($data);

        return redirect()->route('students.index')->with('success', __('app.Student updated.'));
    }

    public function destroy($student_id)
    {
        Student::where('student_id', $student_id)->firstOrFail()->delete();

        return redirect()->route('students.index')->with('success', __('app.Student deleted!'));
    }
}
