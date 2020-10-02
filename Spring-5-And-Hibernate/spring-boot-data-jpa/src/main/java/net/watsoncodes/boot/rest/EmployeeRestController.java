package net.watsoncodes.boot.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.watsoncodes.boot.entity.Employee;
import net.watsoncodes.boot.service.EmployeeService;

@RestController
@RequestMapping("/api")
public class EmployeeRestController {

	private EmployeeService employeeService;

	@Autowired
	public EmployeeRestController(EmployeeService employeeService) {
		this.employeeService = employeeService;
	}

	@GetMapping("/employees")
	public List<Employee> showEmployees() {
		return employeeService.findAll();
	}

	@GetMapping("/employees/{id}")
	public Employee showEmployee(@PathVariable int id) {

		Employee employee = employeeService.find(id);

		if (employee == null) { throw new RuntimeException("Employee not found"); }

		return employee;
	}

	@PostMapping("/employees")
	public Employee addEmployee(@RequestBody Employee employee) {

		employee.setId(0);

		employeeService.save(employee);

		return employee;
	}

	@PutMapping("/employees")
	public Employee updateEmployee(@RequestBody Employee employee) {

		employeeService.save(employee);

		return employee;
	}

	@DeleteMapping("/employees/{id}")
	public String deleteEmployee(@PathVariable int id) {

		Employee employee = employeeService.find(id);

		if (employee == null) { throw new RuntimeException("Employee not found"); }

		employeeService.delete(id);

		return "Deleted Employee with id: " + id;
	}
}
