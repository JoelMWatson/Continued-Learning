package net.watsoncodes.boot.service;

import java.util.List;

import net.watsoncodes.boot.entity.Employee;

public interface EmployeeService {
	public List<Employee> findAll();

	public Employee find(int id);

	public void save(Employee employee);

	public void delete(int id);
}
