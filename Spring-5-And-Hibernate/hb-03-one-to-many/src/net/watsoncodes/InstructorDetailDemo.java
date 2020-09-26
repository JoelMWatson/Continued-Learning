package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;

public class InstructorDetailDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Instructor.class)
				.addAnnotatedClass(InstructorDetail.class).buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {
			// create the objects
			int id = 2;

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// instructor
			InstructorDetail detail = session.get(InstructorDetail.class, id);

			System.out.println("Detail: " + detail);

			// Bi directional Connection
			System.out.println("Instructor: " + detail.getInstructor());

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
			factory.close();
		}

	}

}
