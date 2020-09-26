package net.watsoncodes;

import java.util.List;

import org.hibernate.Session;

import net.watsoncodes.entity.ChallengeEntity;

public class ChallengeController {

	private Session session;

	public ChallengeController(Session session) {
		super();
		this.session = session;
	}

	// Create
	public ChallengeEntity create(String firstName, String lastName, String company) {
		ChallengeEntity cEntity = new ChallengeEntity(firstName, lastName, company);
		session.save(cEntity);
		return cEntity;
	}

	// ReadOne
	public ChallengeEntity readOne(int id) {
		ChallengeEntity cEntity = session.get(ChallengeEntity.class, id);
		return cEntity;
	}

	// ReadMany
	public List<ChallengeEntity> readMany(String field, String value) {
		List<ChallengeEntity> cEntitys = session
				.createQuery("from ChallengeEntity e where e." + field + " = '" + value + "'").getResultList();
		return cEntitys;
	}

	// Delete
	public void delete(int id) {
		session.createQuery("delete from Employee where id=" + id);
	}
}
