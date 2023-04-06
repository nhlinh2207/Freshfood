package com.linh.model;

import lombok.*;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.ManyToMany;
import javax.persistence.Table;

@Entity
@Table(name = "tbl_role")
@Builder
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class Role {
      
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	private Integer id;
	
	@Column(columnDefinition = "VARCHAR(255)")
	private String name;
	
	@ManyToMany(mappedBy = "roles")
	private List<User> users = new ArrayList<User>();
}
