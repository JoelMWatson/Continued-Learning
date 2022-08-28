use std::{cell::RefCell, rc::Rc};

pub fn circular_references() {
    broken_circular_reference();
    fixed_circular_references();
    better_circular_references();
}
// ========= Broken circular_references ===========
// Student* ---- Course*
// Two problems with code below: Borrowing Problem and Lifetime Problem
struct Student<'a> {
    name: String,
    courses: Vec<&'a Course<'a>>,
}

impl<'a> Student<'a> {
    fn new(name: &str) -> Student<'a> {
        Student {
            name: name.into(),
            courses: Vec::new(),
        }
    }
}

struct Course<'a> {
    name: String,
    students: Vec<&'a Student<'a>>,
}

impl<'a> Course<'a> {
    fn new(name: &str) -> Course<'a> {
        Course {
            name: name.into(),
            students: Vec::new(),
        }
    }

    // 1: Problem of borrowing: Solve with RefCell
    // fn add_student(&'a mut self, student: &'a mut Student<'a>) {
    //     student.courses.push(self);
    //     self.students.push(student); // Cannot borrow as mutable and immutable
    // }
}

fn broken_circular_reference() {
    // 2: Problem of lifetime: Solved with Rc

    // let john = Student::new("John");

    // let course = Course::new("Rust Course");

    // course.add_student(john);

    // Issue happens when variables are dropped
    // If student drops first then course has a broken ref
    // if course drops first then student has a broken ref
}

// ========= Fixed circular_references ===========
// Student* ---- Course*
// Problems Fixed using Rc and RefCell...works but super ugly to write

struct Student1 {
    name: String,
    courses: Vec<Rc<RefCell<Course1>>>,
}

impl<'a> Student1 {
    fn new(name: &str) -> Student1 {
        Student1 {
            name: name.into(),
            courses: Vec::new(),
        }
    }
}

struct Course1 {
    name: String,
    students: Vec<Rc<RefCell<Student1>>>,
}

impl<'a> Course1 {
    fn new(name: &str) -> Course1 {
        Course1 {
            name: name.into(),
            students: Vec::new(),
        }
    }

    fn add_student(course: Rc<RefCell<Course1>>, student: Rc<RefCell<Student1>>) {
        student.borrow_mut().courses.push(course.clone());
        course.borrow_mut().students.push(student.clone());
    }
}

fn fixed_circular_references() {
    let john = Rc::new(RefCell::new(Student1::new("John")));
    let jane = Rc::new(RefCell::new(Student1::new("Jane")));

    let course = Course1::new("Rust Course");
    let magic_course = Rc::new(RefCell::new(course));

    Course1::add_student(magic_course.clone(), john);
    Course1::add_student(magic_course.clone(), jane);
}

// ========= Better circular_references ===========
// Student
// Course
// Enrollment (Student --- Course)

struct Student2 {
    name: String,
}

impl Student2 {
    fn courses(&self, platform: Platform) -> Vec<String> {
        platform
            .enrollments
            .iter()
            .filter(|&e| e.student.name == self.name)
            .map(|e| e.course.name.clone())
            .collect()
    }
}

struct Course2 {
    name: String,
}

struct Enrollment<'a> {
    student: &'a Student2,
    course: &'a Course2,
}

impl<'a> Enrollment<'a> {
    fn new(student: &'a Student2, course: &'a Course2) -> Enrollment<'a> {
        Enrollment { student, course }
    }
}

struct Platform<'a> {
    enrollments: Vec<Enrollment<'a>>,
}

impl<'a> Platform<'a> {
    fn new() -> Platform<'a> {
        Platform {
            enrollments: Vec::new(),
        }
    }
    fn enroll(&mut self, student: &'a Student2, course: &'a Course2) {
        self.enrollments.push(Enrollment { student, course })
    }
}

fn better_circular_references() {
    let student = Student2 {
        name: "Student".into(),
    };
    let course = Course2 {
        name: "Rust Course".into(),
    };

    let mut p = Platform::new();
    p.enroll(&student, &course);

    for c in student.courses(p) {
        println!("Student is taking {}", c);
    }
}
