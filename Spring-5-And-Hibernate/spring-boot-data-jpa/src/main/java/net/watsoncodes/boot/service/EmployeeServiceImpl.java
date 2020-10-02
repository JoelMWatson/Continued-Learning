package net.watsoncodes.boot.service;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import net.watsoncodes.boot.dao.EmployeeRepository;
import net.watsoncodes.boot.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeRepository employeeRepository;

	@Autowired
	public EmployeeServiceImpl(@Qualifier("employeeDaoJpaImpl") EmployeeRepository employeeRepository) {
		this.employeeRepository = employeeRepository;
	}

	@Override
	public List<Employee> findAll() {
		return employeeRepository.findAll();
	}

	@Override
	public Employee find(int id) {

		Optional<Employee> result = employeeRepository.findById(id);

		Employee employee = null;
		if (result.isPresent()) {
			employee = result.get();
		} else {
			throw new RuntimeException("Employee not found");
		}

		return employee;
	}

	@Override
	public void save(Employee employee) {
		employeeRepository.save(employee);

	}

	@Override
	public void delete(int id) {
		employeeRepository.deleteById(id);
	}

}
