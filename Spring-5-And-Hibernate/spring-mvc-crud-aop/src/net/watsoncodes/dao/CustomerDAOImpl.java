package net.watsoncodes.dao;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import net.watsoncodes.entity.Customer;

@Repository
public class CustomerDAOImpl implements CustomerDAO {

	// inject the session factory
	@Autowired
	private SessionFactory sessionFactory;

	@Override
	public List<Customer> getCustomers() {
		// get session
		Session session = sessionFactory.getCurrentSession();

		// create query
		Query<Customer> query = session.createQuery("from Customer order by lastName", Customer.class);

		// get customers
		List<Customer> customers = query.getResultList();

		// return customers
		return customers;
	}

	@Override
	public void saveCustomer(Customer customer) {
		// get session
		Session session = sessionFactory.getCurrentSession();

		// save customer
		session.saveOrUpdate(customer);

	}

	@Override
	public Customer getCustomer(int id) {
		// get session
		Session session = sessionFactory.getCurrentSession();

		// create query
		Query<Customer> query = session.createQuery("from Customer where id = " + id, Customer.class);

		// get customer
		Customer customer = query.getSingleResult();

		// return customer
		return customer;
	}

	@Override
	public void deleteCustomer(int id) {
		// get session
		Session session = sessionFactory.getCurrentSession();

		// create query
		Query<Customer> query = session.createQuery("delete from Customer where id = :customerId");

		// set vars
		query.setParameter("customerId", id);

		// execute the delete
		query.executeUpdate();
	}

}
