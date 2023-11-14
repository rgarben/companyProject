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
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css"> 
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<meta charset="ISO-8859-1">
<title>Employee</title>
</head>
<%
List<Company> listCompany = new ArrayList<>();
try {
	listCompany = DbRepository.findAll(Company.class);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<body>
	<table class="table">
		<thead>
			<tr class="bg-secondary">
				<td><b>Nombre de compañia</b></td>
				<td><b>Nº empleados</b></td>
				<td><b>Nº proyectos</b></td>
			</tr>
		</thead>
		<tbody>
			<%for (Company c : listCompany) {%>
			<tr class="bg-primary">
				<td><%=c.getName()%></td>
				<td><%=c.getEmployes().size()%></td>
				<td><%=c.getCompanyProject().size()%></td>
			</tr>
			<tr>
			<tr class="bg-secondary"><td><b>Empleados</b></td></tr>
				<%
				for (Employee e : c.getEmployes()) {
				%>
				<tr>
				<td><%=e.getFirstName()%></td>
				</tr>
				<%
				}
				%>
			</tr>
				<tr class="bg-secondary">
					<td><b>Proyectos</b></td>
					<td><b>Presupuesto</b></td>
				</tr>
				
			<tr>
				<%
				for (CompanyProject cp : c.getCompanyProject()) {
				%>
				<tr>
				<td><%=cp.getIdProject().getName()%></td>
				<td><%=cp.getIdProject().getButget()%></td>
				</tr>
				<%
				}
				%>
			</tr>
			<%}%>
		</tbody>
	</table>
</body>
</html>