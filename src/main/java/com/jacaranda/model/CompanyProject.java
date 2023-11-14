package com.jacaranda.model;

import java.sql.Date;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.Table;

@Entity
@Table(name="companyProject")
public class CompanyProject {

	@Id
	@ManyToOne
	@JoinColumn(name="idCompany")
	private Company company;
	@Id
	@ManyToOne
	@JoinColumn(name="idProject")
	private Project project;
	
	@Id
	private Date begin;
	
	private Date end;
	
	public CompanyProject() {
		super();
	}
	
	public CompanyProject(Company company, Project project, Date begin, Date end) {
		super();
		this.company = company;
		this.project = project;
		this.begin = begin;
		this.end = end;
	}

	public Company getIdCompany() {
		return company;
	}

	public void setIdCompany(Company idCompany) {
		this.company = idCompany;
	}

	public Project getIdProject() {
		return project;
	}

	public void setIdProject(Project idProject) {
		this.project = idProject;
	}

	public Date getBegin() {
		return begin;
	}

	public void setBegin(Date begin) {
		this.begin = begin;
	}

	public Date getEnd() {
		return end;
	}

	public void setEnd(Date end) {
		this.end = end;
	}

	@Override
	public int hashCode() {
		return Objects.hash(begin, company, project);
	}

	@Override
	public boolean equals(Object obj) {
		CompanyProject other = (CompanyProject) obj;
		return Objects.equals(begin, other.begin) && company == other.company && project == other.project;
	}

	@Override
	public String toString() {
		return String.format("CompanyProject [idCompany=%s, idProject=%s, begin=%s, end=%s]", company, project,
				begin, end);
	}

}
