<%-- 
    Document   : index
    Created on : 10 Jun 2024, 10:22:59 pm
    Author     : s65417
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>User Management Application</title>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
              integrity="sha384-gg0yR0iXCbMQv3Xipma34MD+dH/lfQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
    </head>
    <body>
        <h1>Application MVC system for Employee Management</h1><br>
        
        <ul>
            <li> <a href="<%=request.getContextPath()%>/list">All Employee List </a></li><br>              
            <li> <a href="<%=request.getContextPath()%>/new">All a New Employee </a></li><br>
            <li> <a href="<%=request.getContextPath()%>/list">Edit Employee </a></li><br>
        </ul>
    </body>
</html>
