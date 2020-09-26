package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Course;
import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;
import net.watsoncodes.entity.Review;
import net.watsoncodes.entity.Student;

public class CreateCourseAndStudentsDemo {

	public static void main(String[] args) {

		// create session factory
		SessionFactory factory = new Configuration().configure("hibernate.cfg.xml").addAnnotatedClass(Instructor.class)
				.addAnnotatedClass(InstructorDetail.class).addAnnotatedClass(Course.class)
				.addAnnotatedClass(Review.class).addAnnotatedClass(Student.class).buildSessionFactory();

		// create session
		Session session = factory.getCurrentSession();

		try {

			// start transaction
			System.out.println("Starting Transaction");
			session.beginTransaction();

			// Create course
			Course course = new Course("Pacman");

			// create students
			Student student1 = new Student("Jon", "Doe", "email@email.com");
			Student student2 = new Student("Jil", "Dil", "email@email.com");

			// add to course
			course.addStudent(student1);
			course.addStudent(student2);

			// save student
			session.save(student1);
			session.save(student2);

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
