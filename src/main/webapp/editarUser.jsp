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
<%@page import="org.apache.commons.codec.digest.DigestUtils"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Edit user</title>
</head>
<%
String msj = "Puedes editar poniendo tu contraseña.";
Employee user = null;

int id = -1;
String name="";
String apellido="";
String email="";
String genero="";
Date fnacimiento=null;
Company comp = null;
String contra = "";

try {
	user = DbRepository.find(Employee.class, (int) session.getAttribute("id"));
	
	id=user.getId();
	name=user.getFirstName();
	apellido=user.getLastName();
	email=user.getEmail();
	genero=user.getGender();
	fnacimiento=user.getDateOfBirth();
	comp=user.getCompany();
	contra=user.getPassword();
	
} catch (Exception e) {
	e.printStackTrace();
}

//if(user.getRol().equals("admin") || user.getId()==Integer.valueOf(request.getParameter("id"))){
if(user!=null){

					%>
<%
List<Company> listCompany = new ArrayList<>();

try {
	listCompany = DbRepository.findAll(Company.class);

} catch (Exception e) {
	e.printStackTrace();
}

Employee em = null;

if (request.getParameter("submit2") != null) {
	try {
		
		if(!request.getParameter("pass").equals("******")){
			em = new Employee(
				Integer.valueOf(request.getParameter("id")),
				Date.valueOf(request.getParameter("dateOfBirth")), 
				request.getParameter("email"),
				request.getParameter("lastName"), 
				request.getParameter("name"), 
				request.getParameter("gender"),
				DbRepository.find(Company.class, Integer.valueOf(request.getParameter("company"))),
				DigestUtils.md5Hex(request.getParameter("pass")),
				user.getRol()
				);
		}else{
			em = new Employee(
					Integer.valueOf(request.getParameter("id")),
					Date.valueOf(request.getParameter("dateOfBirth")), 
					request.getParameter("email"),
					request.getParameter("lastName"), 
					request.getParameter("name"), 
					request.getParameter("gender"),
					DbRepository.find(Company.class, Integer.valueOf(request.getParameter("company"))),
					user.getPassword(),
					user.getRol()
					);
		}		
		
		DbRepository.modifyObject(em);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
<body>
<%@include file="menu.jsp" %>
	<br><br><br>
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
						required="required" value="<%=name%>">
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
						required="required" class="form-control" value="<%=apellido%>">
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
						class="form-control" value="<%=email%>">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<label for="gender" class="col-4 col-form-label">Genero</label>
			<div class="col-8">
				<input id="gender" name="gender" type="text" class="form-control"
					required="required" value="<%=genero%>">
			</div>
		</div>
		<div class="form-group row">
		    <label for="dateOfBirth" class="col-4 col-form-label">Fecha de nacimiento</label>
		    <div class="col-8">
		        <input id="dateOfBirth" name="dateOfBirth" type="date" class="form-control" required="required" pattern="\d{4}-\d{2}-\d{2}" value="<%=fnacimiento%>">
		    </div>
		</div>
		<div class="form-group row">
			<label for="select" class="col-4 col-form-label">Selecciona compañia</label>
			<div class="col-8">
				<select id="company" name="company" class="custom-select"
					required="required" value="<%= comp != null ? comp.getName() : "" %>">
					<%
					for (Company c : listCompany) {
						if(comp != null && user!=null && user.getCompany().getId()==c.getId()){
							%>
							<option selected="selected" value="<%=c.getId()%>"><%=c.getName()%></option>
							
						<%}else %>
						<option value="<%=c.getId()%>"><%=c.getName()%></option>
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
						required="required" value="******">
				</div>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-4 col-8">
				<button name="submit2" type="submit" class="btn btn-primary">Submit</button>
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
