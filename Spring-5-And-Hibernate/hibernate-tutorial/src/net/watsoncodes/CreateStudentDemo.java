package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Student;

public class CreateStudentDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class)
				.buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// create the student object
			Student student = new Student("Paul", "Wall", "Paul@email.com");

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// save student object
			session.save(student);

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}

}
