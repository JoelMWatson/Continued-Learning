package net.watsoncodes;

import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@RequestMapping("/hello")
public class HelloWorldController {

	// create controller method to show the initial HTML form
	@RequestMapping("/showForm")
	public String showForm() {
		return "helloworld-form";
	}

	// need a controller method to process the HTML from
	@RequestMapping("/processForm")
	public String processForm() {
		return "helloworld";
	}

	@RequestMapping("/processFormVersion2")
	public String processFormVersion2(HttpServletRequest request, Model model) {

		// get name parameter from the form submission
		String name = request.getParameter("studentName");

		// convert to uppercase
		name = name.toUpperCase();

		// create message
		String result = "Yo V2! " + name;

		model.addAttribute("message", result);

		// add message to model
		return "helloworld";
	}

	// uses @RequestParam rather than bringing name in inside the function
	@RequestMapping("/processFormVersion3")
	public String processFormVersion3(@RequestParam("studentName") String name, Model model) {

		// convert to uppercase
		name = name.toUpperCase();

		// create message
		String result = "Yo V3! " + name;

		model.addAttribute("message", result);

		// add message to model
		return "helloworld";
	}
}
