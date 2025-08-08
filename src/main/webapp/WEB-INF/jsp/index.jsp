<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
    <title>MyBusiness - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>

<div class="d-flex">
    <nav class="flex-column flex-shrink-0 p-3 bg-light" style="width: 250px; height: 100vh;">
        <a href="/" class="d-flex align-items-center mb-3 mb-md-0 me-md-auto link-dark text-decoration-none">
            <span class="fs-4">Menu</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item">
                <a href="#" class="nav-link active">Home</a>
            </li>
            <li><a href="#" class="nav-link link-dark">Profilo</a></li>
            <li><a href="#" class="nav-link link-dark">Impostazioni</a></li>
            <li><a href="#" class="nav-link link-dark">Logout</a></li>
        </ul>
    </nav>

    <div class="flex-grow-1 p-3">
        <h1>Benvenuto in MyBusiness</h1>
        <p>Pagina iniziale con menù laterale Bootstrap.</p>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

</body>
</html>
