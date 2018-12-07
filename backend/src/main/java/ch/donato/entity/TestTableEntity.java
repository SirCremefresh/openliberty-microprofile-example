package ch.donato.entity;

import javax.persistence.*;

@Entity
@Table(name = "test_table")
public class TestTableEntity {
	@Column(name = "name")
	public String name;

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	public int id;
}
