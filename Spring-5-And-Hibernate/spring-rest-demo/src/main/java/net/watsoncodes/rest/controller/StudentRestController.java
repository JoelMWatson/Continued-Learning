package net.watsoncodes.rest.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.watsoncodes.rest.StudentNotFoundException;
import net.watsoncodes.rest.entity.Student;

@RestController
@RequestMapping("/api")
public class StudentRestController {

	private List<Student> students;

	@PostConstruct // will run one time after construction
	public void loadData() {
		students = new ArrayList<Student>();

		students.add(new Student("Poornima", "Patel"));
		students.add(new Student("Mario", "Rossi"));
		students.add(new Student("Mary", "Smith"));
	}

	@GetMapping("/students")
	public List<Student> getStudents() {
		return students;
	}

	@GetMapping("/students/{studentId}")
	public Student getStudent(@PathVariable int studentId) {
		// check the id against the list size
		if (studentId >= students.size() || studentId < 0) {
			throw new StudentNotFoundException("Student id was not found!");
		}
		return students.get(studentId);
	}
}
