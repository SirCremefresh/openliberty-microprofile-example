package ch.donato;

import com.mongodb.client.MongoDatabase;

import javax.enterprise.context.RequestScoped;
import javax.inject.Inject;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("/ping")
@RequestScoped
public class PingResource {

	@Inject
	MongoDBFactory mongoDBFactory;

	@GET
	public Response ping() {
		MongoDatabase mongoDatabase = mongoDBFactory.get();
		return Response.ok("ok").build();
	}
}
