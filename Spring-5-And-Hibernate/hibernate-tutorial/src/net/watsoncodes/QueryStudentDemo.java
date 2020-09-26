package net.watsoncodes;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Student;

public class QueryStudentDemo {

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

			// query the students
			List<Student> studentsList = session.createQuery("from Student").getResultList();

			// display the students
			displayStudents(studentsList);

			// HQL Query:
			// LIKE '%foobar%, AND, OR

			studentsList = session.createQuery("from Student s where s.lastName='Wall'").getResultList();

			displayStudents(studentsList);

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}

	private static void displayStudents(List<Student> studentsList) {
		for (Student student : studentsList) {
			System.out.println("Student: " + student);
		}
	}

}
