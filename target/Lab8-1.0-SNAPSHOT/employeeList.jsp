<%-- 
    Document   : employeeList
    Created on : 10 Jun 2024, 10:22:40 pm
    Author     : s65417
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
            <nav class="navbar navbar-expand-md navbar-dark" style="background-color: tomato">
                <div>
                    <a href="<%=request.getContextPath()%>/" class="navbar-brand">Employee Management App </a>
                </div>
                
                <ul class="navbar-nav">
                    <li>
                        <a href="<%=request.getContextPath()%>/list" class="nav-link">Employees</a>
                    </li> 
                </ul> 
                    
            </nav>
        </header>
                    
       <br>
       
       <div class="row">
           <div class="container">
               <h3 class="text-center">List of Employees</h3>
               <hr>
               <div class="container text-left">
                   <a href="<%=request.getContextPath()%>/new" class="btn btn-success">Add New Employee</a>
               </div>
               <br>
               <table class="table table-bordered">
                   <thead>
                       <tr>
                           <th>ID</th>
                           <th>Name</th>
                           <th>Email</th>
                           <th>Position</th>
                           <th>Actions</th>
                       </tr>
                   </thead>
                   <tbody>
                       <c:forEach var="employee" items="${listEmployee}">
                           <tr>
                               <td><c:out value="${employee.id}" /></td>
                               <td><c:out value="${employee.name}" /></td>
                               <td><c:out value="${employee.email}" /></td>
                               <td><c:out value="${employee.position}" /></td>
                               <td>
                                   <a href="<%=request.getContextPath()%>/edit?id=<c:out value='${employee.id}' />">Edit</a> &nbsp;&nbsp;&nbsp;&nbsp;
                                   <a href="<%=request.getContextPath()%>/delete?id=<c:out value='${employee.id}'/>">Delete</a>
                               </td>
                           </tr>
                       </c:forEach>
                   </tbody>
               </table>
           </div>
       </div>
    </body>
</html>
