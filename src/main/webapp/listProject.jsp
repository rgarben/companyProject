<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Project"%>
<%@page import="com.jacaranda.model.CompanyProject"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>

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
<body>
	<table class="table">
		<thead>
			<tr class="bg-secondary">
				<td><b>Id project</b></td>
				<td><b>Name project</b></td>
				<td><b>Butget</b></td>
			</tr>
		</thead>
		<tbody>
			<%
			for (CompanyProject cp : user.getCompany().getCompanyProject()) {
			%>
			<tr class="bg-primary">
				<td><%=cp.getIdProject().getId()%></td>
				<td><%=cp.getIdProject().getName()%></td>
				<td><%=cp.getIdProject().getButget()%></td>
				<td>
					<form action="addTime.jsp" method="get">
						<div class="form-group row" style="display: none">
							<label for="idUser" class="col-4 col-form-label">idUser</label>
							<div class="col-8">
								<input id="idUser" name="idUser" type="text"
									class="form-control" required="required" value="<%=user.getId()%>">
							</div>
						</div>
						<div class="form-group row" style="display: none">
							<label for="idProject" class="col-4 col-form-label">idProject</label>
							<div class="col-8">
								<input id="idProject" name="idProject" type="text"
									class="form-control" required="required" value="<%=cp.getIdProject().getId()%>">
							</div>
						</div>
						<div class="form-group row">
							<div class="offset-4 col-8">
								<button name="submit" type="submit" class="btn btn-secundary">Establecer tiempo</button>
							</div>
						</div>
					</form>
				</td>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
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