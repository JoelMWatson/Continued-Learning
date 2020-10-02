package net.watsoncodes.security.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class LoginController {

	@GetMapping("/showMyLoginPage")
	public String showMyLoginPage() {
		return "plain-login";
	}

	// add custom access denied path
	@GetMapping("/access-denied")
	public String showAccessDeniedPage() {
		return "access-denied";
	}
}
