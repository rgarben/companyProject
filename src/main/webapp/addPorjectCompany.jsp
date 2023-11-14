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
<title>Add Project Company</title>
</head>
<%if(session.getAttribute("rol").equals("admin")){
					%>
<%
List<Company> listCompany = new ArrayList<>();
try {
	listCompany = DbRepository.findAll(Company.class);

} catch (Exception e) {
	e.printStackTrace();
}

List<Project> listProject = new ArrayList<>();
try {
	listProject = DbRepository.findAll(Project.class);

} catch (Exception e) {
	e.printStackTrace();
}

int idCompany=-1;
int idProject=-1;

if (request.getParameter("submit") != null) {
	try {
		idCompany=Integer.valueOf(request.getParameter("company"));
		idProject=Integer.valueOf(request.getParameter("project"));
		CompanyProject cp = new CompanyProject(DbRepository.find(Company.class, idCompany),
				DbRepository.find(Project.class, idProject),
		Date.valueOf(request.getParameter("begin")), Date.valueOf(request.getParameter("end")));
		DbRepository.addObject(cp);
	} catch (Exception e) {
		e.printStackTrace();
	}
}
%>
<body>

	<form>
		<div class="form-group row">
			<label for="begin" class="col-4 col-form-label">Begin</label>
			<div class="col-8">
				<input id="begin" name="begin" type="date" class="form-control"
					required="required">
			</div>
		</div>
		<div class="form-group row">
			<label for="end" class="col-4 col-form-label">End</label>
			<div class="col-8">
				<input id="end" name="end" type="date" class="form-control"
					required="required">
			</div>
		</div>
		<div class="form-group row">
			<label for="company" class="col-4 col-form-label">Company</label>
			<div class="col-8">
				<select id="company" name="company" class="custom-select"
					required="required">
					<%
					for (Company c : listCompany) {
					%>

					<option value="<%=c.getId()%>"><%=c.getName()%></option>
					<%
					}
					%>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<label for="project" class="col-4 col-form-label">Project</label>
			<div class="col-8">
				<select id="project" name="project" class="custom-select"
					required="required">
					<%
					for (Project p : listProject) {
					%>

					<option value="<%=p.getId()%>"><%=p.getName()%></option>
					<%
					}
					%>
				</select>
			</div>
		</div>
		<div class="form-group row">
			<div class="offset-4 col-8">
				<button name="submit" type="submit" class="btn btn-primary">Submit</button>
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