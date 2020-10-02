package net.watsoncodes.thymeleaf.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.watsoncodes.thymeleaf.entity.Employee;
import net.watsoncodes.thymeleaf.service.EmployeeService;

@Controller
@RequestMapping("employees")
public class EmployeeController {

	private EmployeeService employeeService;

	@Autowired
	public EmployeeController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@GetMapping("/list")
	public String listEmployees(Model model) {
		List<Employee> employees = employeeService.findAll();
		model.addAttribute("employees", employees);
		return "employees/list-employees";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		Employee employee = new Employee();
		model.addAttribute("employee", employee);
		return "employees/employee-form";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("id") int id, Model model) {
		Employee employee = employeeService.findById(id);
		model.addAttribute("employee", employee);
		return "employees/employee-form";
	}

	@GetMapping("/delete")
	public String confirmDelete(@RequestParam("id") int id) {
		employeeService.deleteById(id);

		// prevent duplicate submission by redirecting
		return "redirect:/employees/list";
	}

	@PostMapping("/save")
	public String saveEmployee(@ModelAttribute("employee") Employee employee) {
		employeeService.save(employee);

		// prevent duplicate submission by redirecting
		return "redirect:/employees/list";
	}
}
