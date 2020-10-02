package net.watsoncodes.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import net.watsoncodes.dao.CustomerDAO;
import net.watsoncodes.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	// inject DAO
	@Autowired
	private CustomerDAO customerDao;

	@Override
	@Transactional
	public List<Customer> getCustomers() {
		return customerDao.getCustomers();
	}

	@Override
	@Transactional
	public void saveCustomer(Customer customer) {
		customerDao.saveCustomer(customer);
	}

	@Override
	@Transactional
	public Customer getCustomer(int id) {
		return customerDao.getCustomer(id);
	}

	@Override
	@Transactional
	public void deleteCustomer(int id) {
		customerDao.deleteCustomer(id);
	}

}
