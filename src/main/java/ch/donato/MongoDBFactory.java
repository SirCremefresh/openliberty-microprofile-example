package ch.donato;

import com.mongodb.MongoClientSettings;
import com.mongodb.MongoCredential;
import com.mongodb.ServerAddress;
import com.mongodb.client.MongoClient;
import com.mongodb.client.MongoClients;
import com.mongodb.client.MongoDatabase;

import javax.enterprise.context.ApplicationScoped;
import java.util.Arrays;

@ApplicationScoped
public class MongoDBFactory {
	private MongoClient mongoClient = null;

	public MongoDatabase get() {
		if (mongoClient == null) {
			MongoCredential credential = MongoCredential.createCredential("root", "admin", "example".toCharArray());

			mongoClient = MongoClients.create(
					MongoClientSettings.builder()
							.applyToClusterSettings(
									builder ->
											builder.hosts(Arrays.asList(new ServerAddress("localhost", 27017)))
							)
							.credential(credential)
							.build()
			);
		}
		return mongoClient.getDatabase("test");
	}
}
