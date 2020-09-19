package net.watsoncondes.validation;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class CourseCodeConstraintValidator implements ConstraintValidator<CourseCode, String> {

	private String coursePrefix;

	@Override
	public void initialize(CourseCode courseCode) {
		coursePrefix = courseCode.value();
	}

	@Override
	public boolean isValid(String data, ConstraintValidatorContext validator) {

		boolean result;
		if (data != null) {
			result = data.startsWith(coursePrefix);
		} else {
			result = true; // let them pass since it's not required
		}

		return result;
	}

}
