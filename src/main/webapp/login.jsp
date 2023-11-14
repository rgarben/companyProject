<%@page import="org.apache.commons.codec.digest.DigestUtils"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@page import="com.jacaranda.model.Company"%>
<%@page import="com.jacaranda.model.Employee"%>
<%@page import="com.jacaranda.model.Project"%>
<%@page import="com.jacaranda.model.Users"%>
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
<title>Login</title>
</head>

<%

Employee em = null;

String msj="";
String contra="";

if (request.getParameter("login") != null) {
	try {
		em = DbRepository.find(Employee.class, Integer.valueOf(request.getParameter("id")));
			if(em!=null){
				contra = DigestUtils.md5Hex(request.getParameter("pass"));
				if(em.getPassword().equals(contra)){
				session.setAttribute("user", em.getFirstName());
				session.setAttribute("rol", em.getRol());
				session.setAttribute("id", em.getId());
				response.sendRedirect("listProjectWork.jsp");
			}else{
				msj="Ese usuario no esta registrado.";
			}
		}else{
			msj="Usuario o contraseña incorrectos";
		}
		
	} catch (Exception e) {
		e.printStackTrace();
	}
}

%>

<body>

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
        <input id="id" name="id" type="text" class="form-control" required="required">
      </div>
    </div>
  </div>
  <div class="form-group row">
    <label for="pass" class="col-4 col-form-label">Contraseña</label> 
    <div class="col-8">
      <div class="input-group">
        <div class="input-group-prepend">
          <div class="input-group-text">
            <i class="fa fa-address-book-o"></i>
          </div>
        </div> 
        <input id="pass" name="pass" type="text" required="required" class="form-control">
      </div>
    </div>
  </div> 
  <div class="form-group row">
    <div class="offset-4 col-8">
      <button name="login" type="submit" class="btn btn-primary">Logear</button>
    </div>
  </div>
  <div class="form-group row">
    <div class="offset-4 col-8">
      <a name="login" type="button" class="btn btn-warning" href="register.jsp">Registrarse</a>
    </div>
  </div>
</form>
<h3><%=msj%></h3>
</body>
</html>