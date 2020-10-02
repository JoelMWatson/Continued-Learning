package net.watsoncodes.boot.dao;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.Query;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.watsoncodes.boot.entity.Employee;

// Standard JPA API
@Repository
public class EmployeeDaoJpaImpl implements EmployeeDAO {

	private EntityManager entityManager;

	@Autowired
	public EmployeeDaoJpaImpl(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public List<Employee> findAll() {

		Query query = entityManager.createQuery("from Employee");

		List<Employee> employees = query.getResultList();

		return employees;
	}

	@Override
	public Employee find(int id) {

		Employee employee = entityManager.find(Employee.class, id);

		return employee;
	}

	@Override
	public void save(Employee employee) {

		Employee dbEmployee = entityManager.merge(employee);

		employee.setId(dbEmployee.getId());
	}

	@Override
	public void delete(int id) {
		Query query = entityManager.createQuery("delete from Employee where id = :id");

		query.setParameter("id", id);

		query.executeUpdate();
	}

}
