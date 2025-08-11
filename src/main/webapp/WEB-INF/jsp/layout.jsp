<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>${pageTitle}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
</head>
<body>

<!-- Navbar con hamburger -->
<nav class="navbar navbar-light bg-light border-bottom">
    <div class="container-fluid">
        <button class="btn btn-outline-primary" type="button" id="menu-toggle">
            &#9776;
        </button>
        <span class="navbar-brand mb-0 h1">${pageTitle}</span>
    </div>
</nav>

<!-- Include sidebar -->
<jsp:include page="sidebar.jsp" />

<!-- Contenuto principale -->
<div id="page-content" class="p-4" style="margin-left:0; transition: margin-left 0.3s;">
    <jsp:include page="${contentPage}" />
</div>

<script>
    const toggleBtn = document.getElementById('menu-toggle');
    const sidebar = document.getElementById('sidebar');
    const pageContent = document.getElementById('page-content');
    let sidebarOpen = false;

    toggleBtn.addEventListener('click', () => {
        if (sidebarOpen) {
            sidebar.style.left = '-250px';
            pageContent.style.marginLeft = '0';
        } else {
            sidebar.style.left = '0';
            pageContent.style.marginLeft = '250px';
        }
        sidebarOpen = !sidebarOpen;
    });
</script>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
