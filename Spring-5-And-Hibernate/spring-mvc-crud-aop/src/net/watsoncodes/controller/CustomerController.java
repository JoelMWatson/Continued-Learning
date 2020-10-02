package net.watsoncodes.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import net.watsoncodes.entity.Customer;
import net.watsoncodes.service.CustomerService;

@Controller
@RequestMapping("/customer")
public class CustomerController {

	// inject customer service
	@Autowired
	private CustomerService customerService;

	@GetMapping("/list")
	public String listCustomers(Model model) {

		// get customers
		List<Customer> customers = customerService.getCustomers();

		// add customers to model
		model.addAttribute("customers", customers);

		return "list-customers";
	}

	@GetMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {

		Customer customer = new Customer();

		model.addAttribute("customer", customer);

		return "customer-form";
	}

	@PostMapping("/saveCustomer")
	public String saveCustomer(@ModelAttribute("customer") Customer customer) {

		customerService.saveCustomer(customer);

		return "redirect:/customer/list";
	}

	@GetMapping("/showFormForUpdate")
	public String showFormForUpdate(@RequestParam("customerId") int id, Model model) {

		// get customer
		Customer customer = customerService.getCustomer(id);

		// set to model attribute
		model.addAttribute("customer", customer);

		// send over to form
		return "customer-form";
	}

	@GetMapping("/delete")
	public String deleteCustomer(@RequestParam("customerId") int id) {

		customerService.deleteCustomer(id);

		return "redirect:/customer/list";
	}

}
