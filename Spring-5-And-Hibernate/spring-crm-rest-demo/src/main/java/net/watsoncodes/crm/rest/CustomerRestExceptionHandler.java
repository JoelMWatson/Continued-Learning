package net.watsoncodes.crm.rest;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;

@ControllerAdvice
public class CustomerRestExceptionHandler {

	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(CustomerNotFoundException e) {
		CustomerErrorResponse error = new CustomerErrorResponse(
				HttpStatus.NOT_FOUND.value(),
				e.getMessage(),
				System.currentTimeMillis());

		return new ResponseEntity<>(error, HttpStatus.NOT_FOUND);
	}

	@ExceptionHandler
	public ResponseEntity<CustomerErrorResponse> handleException(Exception e) {
		CustomerErrorResponse error = new CustomerErrorResponse(
				HttpStatus.BAD_REQUEST.value(),
				e.getMessage(),
				System.currentTimeMillis());

		return new ResponseEntity<>(error, HttpStatus.BAD_REQUEST);
	}
}
