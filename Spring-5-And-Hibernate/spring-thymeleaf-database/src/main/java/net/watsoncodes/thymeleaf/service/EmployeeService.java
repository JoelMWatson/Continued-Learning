package net.watsoncodes.thymeleaf.service;

import java.util.List;

import net.watsoncodes.thymeleaf.entity.Employee;

public interface EmployeeService {
	public List<Employee> findAll();

	public Employee findById(int id);

	public void save(Employee employee);

	public void deleteById(int id);
}
