package com.jacaranda.model;

import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "project")
public class Project {

	@Id
	private int id;
	private String name;
	private String butget;

	@OneToMany(mappedBy = "project")
	private List<CompanyProject> companyProyect;
	@OneToMany(mappedBy = "project")
	private List<EmployedProject> employedProject;
	
	public Project() {
		super();
	}

	public Project(int id, String name, String butget) {
		super();
		this.id = id;
		this.name = name;
		this.butget = butget;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getButget() {
		return butget;
	}

	public void setButget(String butget) {
		this.butget = butget;
	}
	
	public List<CompanyProject> getCompanyProyect() {
		return companyProyect;
	}

	public void setCompanyProyect(List<CompanyProject> companyProyect) {
		this.companyProyect = companyProyect;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		Project other = (Project) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return String.format("Project [id=%s, name=%s, butget=%s, companyProyect=%s]", id, name, butget,
				companyProyect);
	}

}
