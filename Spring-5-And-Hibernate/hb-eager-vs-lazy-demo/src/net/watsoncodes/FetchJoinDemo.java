package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;
import org.hibernate.query.Query;

import net.watsoncodes.entity.Course;
import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;

public class FetchJoinDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Instructor.class)
				.addAnnotatedClass(InstructorDetail.class).addAnnotatedClass(Course.class).buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// Join Fetch fetches the courses as well
			Query<Instructor> query = session.createQuery(
					"select i from Instructor i JOIN FETCH i.courses where i.id = :instructorId", Instructor.class);

			query.setParameter("instructorId", 1);

			Instructor instructor = query.getSingleResult();

			System.out.println("Instructor: " + instructor);
			System.out.println("Courses: " + instructor.getCourses());

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			session.close();
			factory.close();
		}

	}

}
