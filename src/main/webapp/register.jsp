<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
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
<title>Agregar empleado</title>
</head>
<%
List<Company> listCompany = new ArrayList<>();
String mostrar="";
Employee em=null;
try {
	listCompany = DbRepository.findAll(Company.class);

} catch (Exception e) {
	e.printStackTrace();
}

if (request.getParameter("submit") != null) {
	if(request.getParameter("pass").equals(request.getParameter("pass2"))){		
	
		try {
			em = new Employee(Date.valueOf(request.getParameter("dateOfBirth")), request.getParameter("email"),
			request.getParameter("lastName"), request.getParameter("name"), request.getParameter("gender"),
			DbRepository.searchCompany(request.getParameter("company")),
			DigestUtils.md5Hex(request.getParameter("pass")));
			DbRepository.addObject(em);
		} catch (Exception e) {
			e.printStackTrace();
		}
		mostrar = String.format("<details close><summary>Detalles de la pelicula añadida</summary><label>Id: %s, <br>Nombre: %s,  <br>Apellidos: %s,<br>Email: %s,  <br>Genero: %s, <br> Cumple: %s, <br> Company: %s</label></details>", 
				em.getId(), em.getFirstName(), em.getLastName(), em.getEmail(), em.getGender(), em.getDateOfBirth(), em.getCompany().getName());
	}else{
		out.println("El password debe ser el mismo");
	}
}
%>
<body>

	<form>
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
						required="required">
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
						required="required" class="form-control">
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
						class="form-control">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="gender" class="col-4 col-form-label">Genero</label>
			<div class="col-8">
				<input id="gender" name="gender" type="text" class="form-control"
					required="required">
			</div>
		</div>
		<div class="form-group row">
			<label for="dateOfBirth" class="col-4 col-form-label">Fecha
				de nacimiento</label>
			<div class="col-8">
				<input id="dateOfBirth" name="dateOfBirth" type="date"
					class="form-control" required="required"
					pattern="\d{4}-\d{2}-\d{2}">
			</div>
		</div>
		<div class="form-group row">
			<label for="select" class="col-4 col-form-label">Selecciona
				compaÃ±ia</label>
			<div class="col-8">
				<select id="company" name="company" class="custom-select"
					required="required">
					<%
					for (Company c : listCompany) {
					%>
					<option><%=c.getName()%></option>
					<%
					}
					%>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label for="pass" class="col-4 col-form-label">Password</label>
			<div class="col-8">
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<i class="fa fa-address-card"></i>
						</div>
					</div>
					<input id="pass" name="pass" type="password" class="form-control"
						required="required">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="pass2" class="col-4 col-form-label">Repita password</label>
			<div class="col-8">
				<div class="input-group">
					<div class="input-group-prepend">
						<div class="input-group-text">
							<i class="fa fa-address-card"></i>
						</div>
					</div>
					<input id="pass2" name="pass2" type="password" class="form-control"
						required="required">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-4 col-8">
				<button name="submit" type="submit" class="btn btn-primary">Registrarse</button>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-4 col-8">
				<a name="returnV" type="button" class="btn btn-warning" href="login.jsp">Volver</a>
			</div>
		</div>
	</form>
	<%if(request.getParameter("submit") != null  && request.getParameter("pass").equals(request.getParameter("pass2"))){
	out.println(mostrar); 
}%>
</body>
</html>
