package ch.donato.entity;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "test_table")
public class TestTableEntity {
	@Column(name = "name")
	public String name;

	@Id
	public int id;


}
