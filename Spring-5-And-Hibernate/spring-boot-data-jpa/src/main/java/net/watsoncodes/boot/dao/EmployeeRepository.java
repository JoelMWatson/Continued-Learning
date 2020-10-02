package net.watsoncodes.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;

import net.watsoncodes.boot.entity.Employee;

public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	// No more code required...omg
}
