package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Course;
import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;
import net.watsoncodes.entity.Review;

public class CreateCourseAndReviewsDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Instructor.class)
				.addAnnotatedClass(InstructorDetail.class).addAnnotatedClass(Course.class)
				.addAnnotatedClass(Review.class).buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// Create course
			Course course = new Course("Pacman");

			// add reviews
			course.addReview(new Review("Great"));
			course.addReview(new Review("Well done"));
			course.addReview(new Review("I hate it"));

			// Save course (and subsequently save the reviews)
			session.save(course);

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			session.close();
			factory.close();
		}

	}

}
