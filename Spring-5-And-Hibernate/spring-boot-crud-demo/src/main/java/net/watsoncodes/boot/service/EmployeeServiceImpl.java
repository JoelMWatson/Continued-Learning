package net.watsoncodes.boot.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.watsoncodes.boot.dao.EmployeeDAO;
import net.watsoncodes.boot.entity.Employee;

@Service
public class EmployeeServiceImpl implements EmployeeService {

	private EmployeeDAO employeeDAO;

	@Autowired
	public EmployeeServiceImpl(@Qualifier("employeeDaoJpaImpl") EmployeeDAO employeeDAO) {
//	public EmployeeServiceImpl(@Qualifier("employeeDaoHibernateImpl") EmployeeDAO employeeDAO) { // hibernate implementation
		this.employeeDAO = employeeDAO;
	}

	@Override
	@Transactional
	public List<Employee> findAll() {
		return employeeDAO.findAll();
	}

	@Override
	@Transactional
	public Employee find(int id) {
		return employeeDAO.find(id);
	}

	@Override
	@Transactional
	public void save(Employee employee) {
		employeeDAO.save(employee);

	}

	@Override
	@Transactional
	public void delete(int id) {
		employeeDAO.delete(id);
	}

}
