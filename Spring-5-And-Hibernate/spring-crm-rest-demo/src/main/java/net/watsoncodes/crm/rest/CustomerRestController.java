package net.watsoncodes.crm.rest;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import net.watsoncodes.crm.entity.Customer;
import net.watsoncodes.crm.service.CustomerService;

@RestController
@RequestMapping("/api")
public class CustomerRestController {

	@Autowired
	private CustomerService customerService;

	@GetMapping("/customers")
	public List<Customer> getCustomers() {
		return customerService.getCustomers();
	}

	@GetMapping("/customers/{customerId}")
	public Customer getCustomer(@PathVariable int customerId) {
		Customer customer = customerService.getCustomer(customerId);

		if (customer == null) { throw new CustomerNotFoundException("Customer id not found - " + customerId); }

		return customer;
	}

	@PostMapping("/customers")
	public Customer addCustomer(@RequestBody Customer customer) {

		customer.setId(0); // make sure its inserted as a new customer
		customerService.saveCustomer(customer);

		return customer;
	}

	@PutMapping("/customers")
	public Customer updateCustomer(@RequestBody Customer customer) {

		customerService.saveCustomer(customer);

		return customer;
	}

	@DeleteMapping("/customers/{customerId}")
	public String deleteCustomer(@PathVariable int customerId) {
		Customer customer = customerService.getCustomer(customerId);

		if (customer == null) { throw new CustomerNotFoundException("Customer id not found - " + customerId); }

		customerService.deleteCustomer(customerId);

		return "Deleted customer id - " + customerId;
	}
}
