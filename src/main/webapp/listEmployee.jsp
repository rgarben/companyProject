<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Employee"%>
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
<title>Employee</title>
</head>
<%
List<Employee> listEmployes = new ArrayList<>();
try {
	listEmployes = DbRepository.findAll(Employee.class);

} catch (Exception e) {
	e.printStackTrace();
}
%>
<body>
<%@include file="menu.jsp" %>
	<br><br><br><br>
	<table>
		<thead>
			<tr>
				<td>dateOfBirth</td>
				<td>email</td>
				<td>lastName</td>
				<td>firstName</td>
				<td>gender</td>
				<td>id</td>
				<td>company</td>
			</tr>
		</thead>
		<tbody>
			<%
			for (Employee e : listEmployes) {
			%>
			<tr>
				<td><%=e.getDateOfBirth()%></td>
				<td><%=e.getEmail()%></td>
				<td><%=e.getLastName()%></td>
				<td><%=e.getFirstName()%></td>
				<td><%=e.getGender()%></td>
				<td><%=e.getId()%></td>
				<td><%=e.getCompany().getName()%></td>
				<%
				if (session.getAttribute("rol").equals("admin")) {
				%>

				<td>
					<form action="editEmployed.jsp" method="get">
						<div class="form-group row">
							<div class="col-8">
								<input id="edit" name="edit" type="text" class="form-control"
									value="<%=e.getId()%>" hidden>
								<button name="edit" type="submit" class="btn btn-success">Edit</button>
							</div>
						</div>
					</form>
				</td>
				<td>
					<form action="delEmployed.jsp" method="get">
						<div class="form-group row">
							<div class="col-8">
								<input id="delete" name="delete" type="text"
									class="form-control" value="<%=e.getId()%>" hidden>
								<button name="delete" type="submit" class="btn btn-success">Delete</button>
							</div>
						</div>
					</form>
				</td>

				<%
				}
				%>
			</tr>
			<%
			}
			%>
		</tbody>
	</table>
</body>
</html>