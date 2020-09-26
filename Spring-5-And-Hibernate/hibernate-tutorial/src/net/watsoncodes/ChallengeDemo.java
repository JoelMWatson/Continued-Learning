package net.watsoncodes;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import net.watsoncodes.entity.ChallengeEntity;

public class ChallengeDemo {

	/*
	 * [x] Create the database table.
	 * 
	 * [x] Set up the Hibernate configuration file.
	 * 
	 * [x] Create a Java class (entity) with Hibernate annotations.
	 * 
	 * [x] Develop a main application.
	 * 
	 * [x] Develop code to save objects.
	 * 
	 * [x] Develop code to retrieve an object by primary key.
	 * 
	 * [x] Develop code to query objects to find employees for a given company.
	 * 
	 * [x] Develop code to delete an object by primary key.
	 */

	public static void main(String[] args) {

		// create a session factory
		SessionFactory factory = new Configuration().configure("challenge_hibernate.cfg.xml")
				.addAnnotatedClass(ChallengeEntity.class).buildSessionFactory();

		// use factory to create session
		Session session = factory.getCurrentSession();

		ChallengeController challenge = new ChallengeController(session);

		// use session to interact with db
		try {

			// Start transaction
			session.beginTransaction();

			// do action
//			ChallengeEntity cEntity = challenge.create("Noodles", "Bread", "cheese");
//			session.save(cEntity);
//			ChallengeEntity cEntity = challenge.readOne(3);
//			System.out.println(cEntity);
//			List<ChallengeEntity> cEntitys = challenge.readMany("company", "egg");
//			System.out.println(cEntitys);

//			ChallengeEntity cEntity = challenge.readOne(3);

			// commit transaction
			session.getTransaction().commit();

		} finally {
			// close factory
			factory.close();
		}
	}

}
