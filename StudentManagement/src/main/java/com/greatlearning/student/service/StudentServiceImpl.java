package com.greatlearning.student.service;

import java.util.List;

import javax.transaction.Transactional;

import org.hibernate.HibernateException;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.greatlearning.student.entity.Student;

@Repository
public class StudentServiceImpl implements StudentService {

	private SessionFactory sessionFactory;

	// create session
	private Session session;

	@Autowired
	StudentServiceImpl(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
		try {
			session = sessionFactory.getCurrentSession();
		} catch (HibernateException e) {
			session = sessionFactory.openSession();
		}

	}

	@Transactional
	public List<Student> findAll() {
		Transaction tx = session.beginTransaction();

		// find all the records from the database table
		List<Student> students = session.createQuery("from Student").list();

		// commit the transaction
		tx.commit();

		return students;
	}

	@Transactional
	public Student findById(int theId) {
		Transaction tx = session.beginTransaction();

		// find record with Id from the database table
		Student theStudent = session.get(Student.class, theId);

		tx.commit();

		return theStudent;
	}

	@Transactional
	public void save(Student theStudent) {
		Transaction tx = session.beginTransaction();

		// saving the student object
		session.saveOrUpdate(theStudent);

		tx.commit();

	}

	@Transactional
	public void deleteById(int theId) {
		Transaction tx = session.beginTransaction();

		// find record with Id from the database table
		Student theStudent = session.get(Student.class, theId);

		session.delete(theStudent);

		tx.commit();
	}

	// print the loop
	@Transactional
	public void print(List<Student> student) {

		for (Student s : student) {
			System.out.println(s);
		}
	}

}
