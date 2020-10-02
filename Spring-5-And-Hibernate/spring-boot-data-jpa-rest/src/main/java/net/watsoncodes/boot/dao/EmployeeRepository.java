package net.watsoncodes.boot.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.rest.core.annotation.RepositoryRestResource;

import net.watsoncodes.boot.entity.Employee;

@RepositoryRestResource(path = "members") // sets path to /members instead of /employees
public interface EmployeeRepository extends JpaRepository<Employee, Integer> {
	// No more code required...omg
}
