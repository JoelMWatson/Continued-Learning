package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Student;

public class PrimaryKeyDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Student.class)
				.buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// create 3 students
			Student student1 = new Student("Jan", "Dan", "Jan@email.com");
			Student student2 = new Student("Jon", "Don", "Jon@email.com");
			Student student3 = new Student("Jim", "Dim", "Jim@email.com");

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// save student object
			session.save(student1); // Each student gets a auto incremented ID
			session.save(student2);
			session.save(student3);

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}
}
