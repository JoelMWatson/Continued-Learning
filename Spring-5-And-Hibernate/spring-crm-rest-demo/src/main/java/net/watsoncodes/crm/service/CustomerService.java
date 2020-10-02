package net.watsoncodes.crm.service;

import java.util.List;

import net.watsoncodes.crm.entity.Customer;

public interface CustomerService {

	public List<Customer> getCustomers();

	public void saveCustomer(Customer theCustomer);

	public Customer getCustomer(int theId);

	public void deleteCustomer(int theId);

}
