package com.jacaranda.model;

import java.sql.Date;
import java.util.List;
import java.util.Objects;

import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;
import jakarta.persistence.Table;

@Entity
@Table(name = "employee")
public class Employee {
	@Id
	private int id;
	private String firstName;
	private String lastName;
	private String email;
	private String gender;
	private Date dateOfBirth;
	private String password;
	private String rol;
	@ManyToOne
	@JoinColumn(name="idCompany")
	private Company company;
	@OneToMany(mappedBy = "employee")
	private List<EmployedProject> employedProject;
	
	public Employee() {
		super();
	}

	public Employee(Date dateOfBirth, String email, String lastName, String firstName, String gender, Company company, String password, String rol) {
		super();
		this.dateOfBirth = dateOfBirth;
		this.email = email;
		this.lastName = lastName;
		this.firstName = firstName;
		this.gender = gender;
		this.company = company;
		this.password = password;
		this.rol = rol;
	}
	
	public Employee(Date dateOfBirth, String email, String lastName, String firstName, String gender, Company company, String password) {
		super();
		this.dateOfBirth = dateOfBirth;
		this.email = email;
		this.lastName = lastName;
		this.firstName = firstName;
		this.gender = gender;
		this.company = company;
		this.password = password;
		this.rol = "user";
	}

	public Employee(int id, Date dateOfBirth, String email, String lastName, String firstName, String gender, Company company, String password, String rol) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.company = company;
		this.password = password;
		this.rol = rol;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getRol() {
		return rol;
	}

	public void setRol(String rol) {
		this.rol = rol;
	}

	public List<EmployedProject> getEmployedProject() {
		return employedProject;
	}

	public void setEmployedProject(List<EmployedProject> employedProject) {
		this.employedProject = employedProject;
	}

	public Employee(int id, Date dateOfBirth, String email, String lastName, String firstName, String gender, Company company) {
		super();
		this.id = id;
		this.firstName = firstName;
		this.lastName = lastName;
		this.email = email;
		this.gender = gender;
		this.dateOfBirth = dateOfBirth;
		this.company = company;
	}

	public Date getDateOfBirth() {
		return dateOfBirth;
	}

	public void setDateOfBirth(Date dateOfBirth) {
		this.dateOfBirth = dateOfBirth;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getLastName() {
		return lastName;
	}

	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	public String getFirstName() {
		return firstName;
	}

	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Company getCompany() {
		return company;
	}

	public void setCompany(Company company) {
		this.company = company;
	}

	@Override
	public int hashCode() {
		return Objects.hash(id);
	}

	@Override
	public boolean equals(Object obj) {
		Employee other = (Employee) obj;
		return id == other.id;
	}

	@Override
	public String toString() {
		return String.format(
				"Employee [id=%s, firstName=%s, lastName=%s, email=%s, gender=%s, dateOfBirth=%s, password=%s, rol=%s, company=%s, employedProject=%s]",
				id, firstName, lastName, email, gender, dateOfBirth, password, rol, company, employedProject);
	}

}
