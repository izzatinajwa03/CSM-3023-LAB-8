<%-- 
    Document   : employeeForm
    Created on : 10 Jun 2024, 10:22:27 pm
    Author     : s65417
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Employee Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/lfQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <header>
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato;">
                <a href="<%=request.getContextPath()%>/" class="navbar-brand">Employee Management App</a>
                <div class="collapse navbar-collapse">
                    <ul class="navbar-nav ml-auto">
                        <li class="nav-item">
                            <a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a>
                        </li>
                    </ul>
                </div>
            </nav>
        </header>
        <br>
        <div class="container col-md-5">
            <div class="card">
                <div class="card-body">
                    <c:choose>
                        <c:when test="${employee != null}">
                            <form action="<%=request.getContextPath()%>/update" method="post">
                                <h2>Edit Employee</h2>
                                <input type="hidden" name="id" value="<c:out value='${employee.id}' />" />
                        </c:when>
                        <c:otherwise>
                            <form action="<%=request.getContextPath()%>/insert" method="post">
                                <h2>Add New Employee</h2>
                        </c:otherwise>
                    </c:choose>
                    
                    <fieldset class="form-group">
                        <label for="name">Employee Name</label>
                        <input type="text" id="name" class="form-control" name="name" value="<c:out value='${employee.name}' />" required>
                    </fieldset>
                    
                    <fieldset class="form-group">
                        <label for="email">Employee Email</label>
                        <input type="email" id="email" class="form-control" name="email" value="<c:out value='${employee.email}' />" required>
                    </fieldset>
                    
                    <fieldset class="form-group">
                        <label for="position">Employee Position</label>
                        <input list="positionlist" id="position" class="form-control" name="position" value="<c:out value='${employee.position}' />" required>
                        <datalist id="positionlist">
                            <option value="Manager">
                            <option value="Head of Dept">
                            <option value="Supervisor">
                            <option value="Director">
                        </datalist>
                    </fieldset>
                    
                    <button type="submit" class="btn btn-success">Save</button>
                    
                    </form>
                </div>
            </div>
        </div>
    </body>
</html>
