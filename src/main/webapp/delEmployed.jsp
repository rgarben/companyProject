<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Project"%>
<%@page import="com.jacaranda.model.CompanyProject"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.sql.Date"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Delete Employee</title>
</head>
<%if(session.getAttribute("rol").equals("admin")){
					%>
<%

Employee p = null;

int id = -1;
String name = "";
String apellido = "";
String email = "";
String genero = "";
Date fnacimiento = null;
Company comp = null;

if (request.getParameter("delete") != null) {
	p = DbRepository.find(Employee.class, Integer.valueOf(request.getParameter("delete")));

	id = p.getId();
	name = p.getFirstName();
	apellido = p.getLastName();
	email = p.getEmail();
	genero = p.getGender();
	fnacimiento = p.getDateOfBirth();
	comp = p.getCompany();

}

if (request.getParameter("submit3") != null) {
	try {
		DbRepository.delObject(new Employee(Integer.valueOf(request.getParameter("id")), Date.valueOf(request.getParameter("dateOfBirth")), 
				request.getParameter("email"),request.getParameter("lastName"), request.getParameter("name"), request.getParameter("gender"), 
				DbRepository.searchCompany(request.getParameter("company"))));
	} catch (Exception e) {
		e.printStackTrace();
	}
}

%>
<body>
	<form>
		<div class="form-group row">
			<label for="id" class="col-4 col-form-label">Id</label>
			<div class="col-8">
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<i class="fa fa-address-card"></i>
						</div>
					</div>
					<input id="id" name="id" type="text" class="form-control"
						required="required" value="<%=id%>" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="name" class="col-4 col-form-label">Nombre</label>
			<div class="col-8">
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<i class="fa fa-address-card"></i>
						</div>
					</div>
					<input id="name" name="name" type="text" class="form-control"
						required="required" value="<%=name%>" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="lastName" class="col-4 col-form-label">Apellido</label>
			<div class="col-8">
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<i class="fa fa-address-card-o"></i>
						</div>
					</div>
					<input id="lastName" name="lastName" type="text"
						required="required" class="form-control" value="<%=apellido%>"
						readonly="readonly">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="email" class="col-4 col-form-label">Email</label>
			<div class="col-8">
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<i class="fa fa-at"></i>
						</div>
					</div>
					<input id="email" name="email" type="text" required="required"
						class="form-control" value="<%=email%>" readonly="readonly">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="gender" class="col-4 col-form-label">Genero</label>
			<div class="col-8">
				<input id="gender" name="gender" type="text" class="form-control"
					required="required" value="<%=genero%>" readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="dateOfBirth" class="col-4 col-form-label">Fecha
				de nacimiento</label>
			<div class="col-8">
				<input id="dateOfBirth" name="dateOfBirth" type="date"
					class="form-control" required="required"
					pattern="\d{4}-\d{2}-\d{2}" value="<%=fnacimiento%>"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="select" class="col-4 col-form-label">Selecciona
				compañia</label>
			<div class="col-8">
				<input id="company" name="company" type="text" class="form-control"
					required="required"
					value="<%=comp != null ? comp.getName() : ""%>"
					readonly="readonly">

			</div>
		</div>
		<div class="form-group row">
			<div class="offset-4 col-8">
				<button name="submit3" type="submit" class="btn btn-primary">Submit</button>
			</div>
		</div>
	</form>
</body>
<% }else{%>
<body>
<h1>No estas registrado</h1>
</body>
<%} %>
</html>
