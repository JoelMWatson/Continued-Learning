package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;

public class DeleteDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Instructor.class)
				.addAnnotatedClass(InstructorDetail.class).buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {
			// create the objects
			int id = 1;

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// delete instructor
			session.delete(session.get(Instructor.class, id));

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}

}
