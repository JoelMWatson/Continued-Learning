package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;

public class CreateDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Instructor.class)
				.addAnnotatedClass(InstructorDetail.class).buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// create the objects
			Instructor instructor = new Instructor("Chad", "Darby", "Darby@luv2code.com");
			InstructorDetail instructorDetail = new InstructorDetail("http://www.luv2code.com/youtube",
					"Loves to code");

			// associate the objects one-to-one
			instructor.setInstructorDetail(instructorDetail);

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// save instructor
			System.out.println("Saving: " + instructor);
			session.save(instructor); // Also saves the details because of the CascadeType.ALL

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			factory.close();
		}

	}

}
