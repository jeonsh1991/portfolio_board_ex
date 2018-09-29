package com.javalec.ex;

import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

public class StudentValidator implements Validator {

	@Override
	public boolean supports(Class<?> arg0) {
		// TODO Auto-generated method stub
		return Student.class.isAssignableFrom(arg0);
	}

	@Override
	public void validate(Object obj, Errors errors) {
		// TODO Auto-generated method stub
		System.out.println("validate()");
		Student student = (Student)obj;
		
		/*String studentName = student.getName();
		if(studentName == null || studentName.trim().isEmpty()) {
			System.out.println("studentName is null or empty");
			errors.rejectValue("name", "trouble");
		}*/
		
		// 위의 코드를 간단하게 ValidationUtils.rejectIfEmptyOrWhitespace를 사용해서 줄일 수 있다.
		// 하지만 위에처럼 마음대로 꾸미기가 불가능하다는 단점이 있다.(아래 방법은 서브밋이 안되서 아예 넘어가질 않는다.)
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "name", "trouble");
		
		int studentId = student.getId();
		if(studentId == 0) {
			System.out.println("studentId is 0");
			errors.rejectValue("id", "trouble");
		}
		
	}
	
	

}
