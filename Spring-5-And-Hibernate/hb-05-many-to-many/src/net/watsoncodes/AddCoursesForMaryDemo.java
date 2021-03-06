package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.Course;
import net.watsoncodes.entity.Instructor;
import net.watsoncodes.entity.InstructorDetail;
import net.watsoncodes.entity.Review;
import net.watsoncodes.entity.Student;

public class AddCoursesForMaryDemo {

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

			// get "mary" (Jil)
			Student student = session.get(Student.class, 2);
			System.out.println("Student: " + student);
			System.out.println("Courses: " + student.getCourses());

			// create courses
			Course course1 = new Course("Rubiks Cube");
			Course course2 = new Course("Atari 2600");

			// add student
			course1.addStudent(student);
			course2.addStudent(student);

			// save the courses
			session.save(course1);
			session.save(course2);

			// commit transaction
			session.getTransaction().commit();
			System.out.println("Transaction Done");

		} finally {
			session.close();
			factory.close();
		}

	}

}
