package net.watsoncodes.thymeleaf.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import net.watsoncodes.thymeleaf.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	// No more code required...omg

	// Method to sort by last name
	public List<Employee> findAllByOrderByLastNameAsc(); // special method name pattern to build queries
}
