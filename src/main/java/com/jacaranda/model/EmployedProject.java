package com.jacaranda.model;

import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name="employedProject")
public class EmployedProject {

	@Id
	@ManyToOne
	@JoinColumn(name="idEmployed")
	private Employee employee;
	@Id
	@ManyToOne
	@JoinColumn(name="idProject")
	private Project project;
	
	private int timeProject;
	
	public EmployedProject() {
		super();
	}

	public EmployedProject(Employee employee, Project project, int timeProject) {
		super();
		this.employee = employee;
		this.project = project;
		this.timeProject = timeProject;
	}
	
	public EmployedProject(Employee employee, Project project) {
		super();
		this.employee = employee;
		this.project = project;
		this.timeProject = getTimeProject();
	}

	public Employee getEmployee() {
		return employee;
	}

	public void setEmployee(Employee employee) {
		this.employee = employee;
	}

	public Project getProject() {
		return project;
	}

	public void setProject(Project project) {
		this.project = project;
	}

	public int getTimeProject() {
		return timeProject;
	}

	public void setTimeProject(int timeProject) {
		this.timeProject = timeProject;
	}

	@Override
	public int hashCode() {
		return Objects.hash(employee, project);
	}

	@Override
	public boolean equals(Object obj) {
		EmployedProject other = (EmployedProject) obj;
		return Objects.equals(employee, other.employee) && Objects.equals(project, other.project);
	}

	@Override
	public String toString() {
		return String.format("EmployedProject [employee=%s, project=%s, timeProject=%s]", employee, project,
				timeProject);
	}
	
}
