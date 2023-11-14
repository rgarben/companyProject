<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Project"%>
<%@page import="com.jacaranda.model.CompanyProject"%>
<%@page import="com.jacaranda.model.EmployedProject"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.time.temporal.ChronoUnit"%>

<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Projects</title>
</head>
<%
Employee user = null;
try {
	user = DbRepository.find(Employee.class, (int) session.getAttribute("id"));
} catch (Exception e) {
	e.printStackTrace();
}
%>
<%
if (user != null && session.getAttribute("id").equals(user.getId())) {
%>
<form action="addTime.jsp" method="get">
	<div class="form-group row" style="display: none">
		<label for="idUser" class="col-4 col-form-label">idUser</label>
		<div class="col-8">
			<input id="idUser" name="idUser" type="text" class="form-control"
				required="required" value="<%=user.getId()%>">
		</div>
	</div>
	<div class="form-group row" style="display: none">
		<label for="idProject" class="col-4 col-form-label">idProject</label>
		<div class="col-8">
			<input id="idProject" name="idProject" type="text"
				class="form-control" required="required"
				value="<%=request.getParameter("idProject")%>">
		</div>
	</div>
	<div class="form-group row">
		<label for="nameUser" class="col-4 col-form-label">Empleado</label>
		<div class="col-8">
			<input id="nameUser" name="nameUser" type="text" class="form-control"
				required="required" value="<%=user.getFirstName()%>"
				readonly="readonly">
		</div>
	</div>
	<div class="form-group row">
		<label for="idProject" class="col-4 col-form-label">idProject</label>
		<div class="col-8">
			<input id="idProject" name="idProject" type="text"
				class="form-control" required="required"
				value="<%=request.getParameter("idProject")%>" readonly="readonly">
		</div>
	</div>
	<div class="form-group row">
		<div class="offset-4 col-8">
			<button name="start" type="submit" class="btn btn-secundary">Empezar
				a trabajar</button>
		</div>
	</div>
	<div class="form-group row">
		<div class="offset-4 col-8">
			<button name="stop" type="submit" class="btn btn-secundary">Terminar
				de trabajar</button>
		</div>
	</div>
</form>

<%
int segundos = 0;
LocalDateTime tiempo = null;
EmployedProject emP = null;
EmployedProject empe = null;

if (request.getParameter("start") != null) {
	tiempo = LocalDateTime.now();
	session.setAttribute("contador", tiempo);
} else if (request.getParameter("stop") != null) {
	segundos = (int) ChronoUnit.SECONDS.between((LocalDateTime) session.getAttribute("contador"), LocalDateTime.now());
	emP = new EmployedProject(DbRepository.find(Employee.class, user.getId()),
	DbRepository.find(Project.class, Integer.valueOf(request.getParameter("idProject"))));

	if (DbRepository.find(EmployedProject.class, emP) == null) {
		emP = new EmployedProject(DbRepository.find(Employee.class, user.getId()),
		DbRepository.find(Project.class, Integer.valueOf(request.getParameter("idProject"))), segundos);
		DbRepository.addObject(emP);
	} else {
		empe = new EmployedProject(DbRepository.find(Employee.class, user.getId()),
		DbRepository.find(Project.class, Integer.valueOf(request.getParameter("idProject"))),
		segundos + emP.getTimeProject());

		DbRepository.modifyObject(empe);
	}

}
%>

</body>
<%
} else {
%>
<body>
	<h2>No estas logeado</h2>
</body>
<%
}
%>
</html>