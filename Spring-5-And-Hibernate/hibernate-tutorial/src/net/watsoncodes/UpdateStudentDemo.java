package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Student;

public class UpdateStudentDemo {
	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class)
				.buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// find the student id
			int id = 1;

			// read student using id
			System.out.println("Getting student with ID: " + id);
			Student myStudent = session.get(Student.class, id);
			System.out.println("Get Completed: " + myStudent);

			// Updating student
			System.out.println("Updating Student");
			myStudent.setEmail("Lordlordlordyayaya@mail.com");
			System.out.println("Update Completed: " + myStudent);

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

			session = factory.getCurrentSession();

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// updating all students
			System.out.println("Updating all student emails to 'foobar@gmail'");
			session.createQuery("update Student set email='foobar@gmail'").executeUpdate();

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}
}
