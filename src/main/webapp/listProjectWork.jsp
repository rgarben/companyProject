<%@page import="java.time.temporal.ChronoUnit"%>
<%@page import="com.jacaranda.model.EmployedProject"%>
<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.time.LocalDateTime"%>
<%@page import="java.util.HashMap"%>
<%@page import="java.util.Map"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Project"%>
<%@page import="com.jacaranda.model.EmployedProject"%>
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

int segundos = 0;
LocalDateTime tiempo = null;
EmployedProject emP = null;
EmployedProject empe = null;

Employee user = null;
try {
	user = DbRepository.find(Employee.class, (int) session.getAttribute("id"));
} catch (Exception e) {
	e.printStackTrace();
}
%>
<%

Map<Integer, LocalDateTime> map = new HashMap<Integer, LocalDateTime>();

if(session.getAttribute("map")!=null){
	map = (HashMap) session.getAttribute("map");
}

if (user != null ) {
	
	if(request.getParameter("work")!=null){
		map.put(Integer.valueOf(request.getParameter("work")), LocalDateTime.now());
		session.setAttribute("map", map);
	}else if(request.getParameter("working")!=null){
		segundos = (int) ChronoUnit.SECONDS.between((LocalDateTime) map.get(Integer.valueOf(request.getParameter("working"))), LocalDateTime.now());
		emP = new EmployedProject(DbRepository.find(Employee.class, user.getId()),
		DbRepository.find(Project.class, Integer.valueOf(request.getParameter("working"))));

		if (DbRepository.find(EmployedProject.class, emP) == null) {
			
			emP = new EmployedProject(DbRepository.find(Employee.class, user.getId()),
			DbRepository.find(Project.class, Integer.valueOf(request.getParameter("working"))), segundos);
			
			DbRepository.addObject(emP);
		} else {
			
			empe = new EmployedProject(DbRepository.find(Employee.class, user.getId()),
			DbRepository.find(Project.class, Integer.valueOf(request.getParameter("working"))),
			segundos + emP.getTimeProject());
			
			DbRepository.modifyObject(empe);
		}
		map.remove(Integer.valueOf(request.getParameter("working")));
	}
	
%>
<body>
<%@include file="menu.jsp" %>
	<br><br><br>
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
					<form>
						<div class="form-group row" style="display: none">
							<label for="idUser" class="col-4 col-form-label">idUser</label>
							<div class="col-8">
								<input id="idUser" name="idUser" type="text"
									class="form-control" required="required"
									value="<%=user.getId()%>">
							</div>
						</div>
						<div class="form-group row" style="display: none">
							<label for="idProject" class="col-4 col-form-label">idProject</label>
							<div class="col-8">
								<input id="idProject" name="idProject" type="text"
									class="form-control" required="required"
									value="<%=cp.getIdProject().getId()%>">
							</div>
						</div>
						<div class="form-group row">
							<div class="offset-4 col-8">
								<%
								if(map.containsKey(cp.getIdProject().getId())){
									%><button name="working" type="submit" class="btn btn-danger"
									value="<%=cp.getIdProject().getId()%>">Terminar de 	trabajar</button>
								<%
								}else{
								    	%><button name="work" type="submit"
									class="btn btn-secundary"
									value="<%=cp.getIdProject().getId()%>">Empezar a
									trabajar</button>
								<%
								}
								%>
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