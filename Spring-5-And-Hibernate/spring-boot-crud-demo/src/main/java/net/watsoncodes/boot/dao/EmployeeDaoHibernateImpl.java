package net.watsoncodes.boot.dao;

import java.util.List;

import javax.persistence.EntityManager;

import org.hibernate.Session;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.watsoncodes.boot.entity.Employee;

// Hibernate API
@Repository
public class EmployeeDaoHibernateImpl implements EmployeeDAO {

	private EntityManager entityManager;

	@Autowired
	public EmployeeDaoHibernateImpl(EntityManager entityManager) {
		this.entityManager = entityManager;
	}

	@Override
	public List<Employee> findAll() {

		Session session = entityManager.unwrap(Session.class);

		Query<Employee> query = session.createQuery("from Employee", Employee.class);

		List<Employee> employees = query.getResultList();

		return employees;
	}

	@Override
	public Employee find(int id) {

		Session session = entityManager.unwrap(Session.class);

		Employee employee = session.get(Employee.class, id);

		return employee;
	}

	@Override
	public void save(Employee employee) {

		Session session = entityManager.unwrap(Session.class);

		session.saveOrUpdate(employee);
	}

	@Override
	public void delete(int id) {

		Session session = entityManager.unwrap(Session.class);

		Query<Employee> query = session.createQuery("delete from Employee where id=:id", Employee.class);
		query.setParameter("id", id);

		query.executeUpdate();
	}

}
