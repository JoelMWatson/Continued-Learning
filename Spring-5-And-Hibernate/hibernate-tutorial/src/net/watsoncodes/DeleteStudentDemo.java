package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Student;

public class DeleteStudentDemo {
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

			// set student id
			int id = 1;

			// read student using id
			Student myStudent = session.get(Student.class, id);
			System.out.println("Get Completed: " + myStudent);

			// delete student
			System.out.println("Deleting Student: " + myStudent);
			session.delete(myStudent);

			// delete other student
			System.out.println("Deleting Other Student...");
			session.createQuery("delete from Student where id=2");

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}
}
