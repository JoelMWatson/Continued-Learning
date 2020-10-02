package net.watsoncodes.thymeleaf.controller;

import java.util.ArrayList;
import java.util.List;

import javax.annotation.PostConstruct;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import net.watsoncodes.thymeleaf.model.Employee;

@Controller
@RequestMapping("employees")
public class EmployeeController {
	private List<Employee> employees;

	@PostConstruct
	private void loadData() {
		Employee emp1 = new Employee(1, "Leslie", "Andrew", "fake@email.com");
		Employee emp2 = new Employee(2, "Ham", "Cheese", "fake@email.com");
		Employee emp3 = new Employee(3, "Bacon", "Brisket", "fake@email.com");

		employees = new ArrayList<>();

		employees.add(emp1);
		employees.add(emp2);
		employees.add(emp3);
	}

	@GetMapping("/list")
	public String listEmployees(Model model) {
		model.addAttribute("employees", employees);
		return "list-employees";
	}

}
