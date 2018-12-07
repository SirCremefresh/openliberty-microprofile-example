package ch.donato;


import ch.donato.entity.TestTableEntity;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.transaction.Transactional;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("/ping")
@RequestScoped
public class PingResource {

	@PersistenceContext(name = "jdbc/postgresql")
	private EntityManager em;

	@GET
	@Transactional(Transactional.TxType.REQUIRES_NEW)
	public Response ping() {

		TestTableEntity testTableEntity = new TestTableEntity();
		testTableEntity.name = "Donatoo";
		em.persist(testTableEntity);
		return Response.ok("ok").build();
	}
}
