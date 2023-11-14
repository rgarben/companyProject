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
<%
Employee user = null;
try {
	user = DbRepository.find(Employee.class, (int) session.getAttribute("id"));
} catch (Exception e) {
	e.printStackTrace();
}

if (user != null) {
%>
<body>
	<%@include file="menu.jsp"%>
	<br>
	<br>
	<br>
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
						required="required" value="<%=user.getId()%>" readonly="readonly">
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
						required="required" value="<%=user.getFirstName()%>"
						readonly="readonly">
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
						required="required" class="form-control"
						value="<%=user.getFirstName()%>" readonly="readonly">
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
						class="form-control" value="<%=user.getEmail()%>"
						readonly="readonly">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="gender" class="col-4 col-form-label">Genero</label>
			<div class="col-8">
				<input id="gender" name="gender" type="text" class="form-control"
					required="required" value="<%=user.getGender()%>"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="dateOfBirth" class="col-4 col-form-label">Fecha
				de nacimiento</label>
			<div class="col-8">
				<input id="dateOfBirth" name="dateOfBirth" type="date"
					class="form-control" required="required"
					pattern="\d{4}-\d{2}-\d{2}" value="<%=user.getDateOfBirth()%>"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="select" class="col-4 col-form-label">Compañia</label>
			<div class="col-8">
				<input id="company" name="company" type="text" class="form-control"
					required="required"
					value="<%=user != null ? user.getCompany().getName() : ""%>"
					readonly="readonly">
			</div>
		</div>
		<div class="form-group row">
			<label for="rol" class="col-4 col-form-label">Rol</label>
			<div class="col-8">
				<div class="input-group"></div>
				<input id="rol" name="rol" type="text" required="required"
					class="form-control" value="<%=user.getRol()%>" readonly="readonly">
			</div>
		</div>
	</form>
</body>
<%
} else {
%>
<body>
	<h1>No estas registrado</h1>
</body>
<%
}
%>
</html>
