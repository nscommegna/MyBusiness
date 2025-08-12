<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!-- Sidebar -->
<div id="sidebar" class="bg-light border-end position-fixed" style="width:250px; height:100vh; left:-250px; transition:left 0.3s;">
    <div class="p-3">
        <a href="/" class="d-flex align-items-center mb-3 link-dark text-decoration-none">
            <span class="fs-4">Menu</span>
        </a>
        <hr>
        <ul class="nav nav-pills flex-column mb-auto">
            <li class="nav-item"><a href="/" class="nav-link active">Home</a></li>
            <li><a href="/fornitori" class="nav-link link-dark">Fornitori</a></li>
            <li><a href="/clienti" class="nav-link link-dark">Clienti</a></li>
            <li><a href="/mezzi" class="nav-link link-dark">Trasporti</a></li>
            <li><a href="/recap" class="nav-link link-dark">Recap</a></li>
            <li><a href="/spese" class="nav-link link-dark">Spese Varie</a></li>
        </ul>
    </div>
</div>
