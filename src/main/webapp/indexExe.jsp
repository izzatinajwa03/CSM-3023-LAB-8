<%-- 
    Document   : indexExe
    Created on : 14 Jun 2024, 1:13:39 am
    Author     : User
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>CAR</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
          integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/lfQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <h1 class="my-4">CAR</h1>
        <ul class="list-group">
            <li class="list-group-item">
                <a href="<%=request.getContextPath()%>/listCars">All Car List</a>
            </li>
            <li class="list-group-item">
                <a href="<%=request.getContextPath()%>/newcar">Add New Car</a>
            </li>
        </ul>
    </div>
    <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" 
            integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" 
            integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGaH0k6+HK5OkCDztj7oGHTl7s" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" 
            integrity="sha384-jjSmVgyd0p3pXB1rRibZUAYoIIy1l1UCBIY4PIHpk6fi6RHClyy1AazrH5+2gJIo" crossorigin="anonymous"></script>
</body>
</html>
