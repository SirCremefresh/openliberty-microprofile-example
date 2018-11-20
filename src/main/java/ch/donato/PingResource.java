package ch.donato;

import com.mongodb.client.MongoClient;

import javax.annotation.Resource;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.core.Response;

@Path("ping")
public class PingResource {

	@Resource(name = "mongo/sampledb")
	private MongoClient meetings;

	@GET
	public Response ping() {
		boolean isNull =  meetings == null;
		String som = "pong " + isNull;
		return Response.ok(som).build();
	}
}
