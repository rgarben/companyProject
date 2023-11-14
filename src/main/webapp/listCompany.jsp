<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.repository.DbRepository"%>
<%@page import="java.util.List" %>
<%@page import="java.util.ArrayList" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Employee</title>
</head>
<%
List<Company> listCompany = new ArrayList<>();
try {
	listCompany =  DbRepository.findAll(Company.class);
	
} catch (Exception e) {
	e.printStackTrace();
}

%>
<body>

	<table>
		<thead>
			<tr>
				<td>Id</td>
				<td>Name</td>
				<td>Address</td>
				<td>City</td>
				<td>Employes</td>
			</tr>		
		</thead>
		<tbody>
		<%for (Company c : listCompany) {%>
			<tr>
				<td><%=c.getId()%></td>
				<td><%=c.getName()%></td>
				<td><%=c.getAddress()%></td>
				<td><%=c.getCity()%></td>
				<td><%=c.getEmployes().size()%></td>
			</tr>
			<tr>
			<%for(Employee e: c.getEmployes()){	%>
				<td><%=e.getFirstName()%></td>
			
			<%} %>
			</tr>
		<%}%>
			

		</tbody>
	</table>
		<!--  <a href="addCinema.jsp" class="btn btn-primary">Volver a agregar cine</a>-->
</body>
</html>