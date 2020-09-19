package net.watsoncodes;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/student")
public class StudentController {

	@RequestMapping("/showForm")
	public String showForm(Model model) {

		// create student
		Student student = new Student();

		// add student to model
		model.addAttribute("student", student);

		return "student-form";
	}

	@RequestMapping("/processForm")
	public String processForm(@ModelAttribute("student") Student student) {

		// log the data
		System.out.println("Student: " + student.getFirstName() + " " + student.getLastName());

		return "student-confirmation";
	}
}
