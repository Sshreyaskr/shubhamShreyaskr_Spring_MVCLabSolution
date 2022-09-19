package com.greatlearning.student.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.greatlearning.student.entity.Student;
import com.greatlearning.student.service.StudentService;

@Controller
@RequestMapping("/student")
public class StudentController {
	
	@Autowired
	private StudentService studentService;
	
	
	@RequestMapping("/list")
	public String listForms(Model model) {
		// get Students from db
		List<Student> theStudents = studentService.findAll();
		
		///connecting the model to the view
		model.addAttribute("Students", theStudents);
		
		return "list-Students";
	}
	
	@RequestMapping("/showFormForAdd")
	public String showFormForAdd(Model model) {
		// create model attribute to bind form data
		Student student=new Student();
		
		model.addAttribute("student", student);
		
		return "Student-form";
	}
	
	@RequestMapping("/showFormForUpdate")
       public String showFormForUpdate(@RequestParam("studentId") int stuId,Model theModel) {
    	// get the Book from the service   
		Student theStudent=studentService.findById(stuId);
		
		// set Student as a model attribute to pre-populate the form
		theModel.addAttribute("student", theStudent);
		
		return "Student-form";
	}
	
	/*
	 * Using the Id attribute we use one method  saveBook()-for both adding book and update.
	 * If id is already there, then it will be updated 
	 * otherwise a new record will be saved
	 */
	@PostMapping("/save")
	public String saveBook(@RequestParam("id") int id, @RequestParam("firstName") String firstName,
			@RequestParam("lastName") String lastName, @RequestParam("department") String department,@RequestParam("country") String country) {

		System.out.println(id);
		Student theStudent=null;
		if (id != 0) {
			theStudent = studentService.findById(id);
			theStudent.setFirstName(firstName);
			theStudent.setLastName(lastName);
			theStudent.setDepartment(department);
			theStudent.setCountry(country);
		} else
			theStudent = new Student(firstName, lastName, department, country);
		// save the Book
		studentService.save(theStudent);

		// use a redirect to prevent duplicate submissions
		return "redirect:/student/list";

	}
	
	@RequestMapping("/delete")
	public String delete(@RequestParam("studentId") int id) {
		// delete the Book
		studentService.deleteById(id);
		
		// redirect to /Books/list
		return "redirect:/student/list";
	}
	
	
	

}
