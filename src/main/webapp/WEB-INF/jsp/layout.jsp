<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>${pageTitle}</title>


    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"/>
    <!-- CSS DataTables -->
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.6/css/jquery.dataTables.min.css"/>

    <!-- DataTables Bootstrap 5 CSS -->
    <link href="https://cdn.datatables.net/1.13.6/css/dataTables.bootstrap5.min.css" rel="stylesheet"/>

    <!-- jQuery -->
    <script src="https://code.jquery.com/jquery-3.7.0.min.js"></script>

    <!-- Bootstrap Bundle JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- DataTables JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/jquery.dataTables.min.js"></script>

    <!-- DataTables Bootstrap 5 integration JS -->
    <script src="https://cdn.datatables.net/1.13.6/js/dataTables.bootstrap5.min.js"></script>

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" />


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
<c:if test="${not empty message}">
    <div class="toast-container position-fixed bottom-0 end-0 p-3 fs-5" style="z-index: 1055;">
        <div id="liveToast" class="toast align-items-center text-white
            <c:choose>
                <c:when test="${message.type == 'SUCCESS'}">bg-success</c:when>
                <c:when test="${message.type == 'ERROR'}">bg-danger</c:when>
                <c:when test="${message.type == 'WARNING'}">bg-warning text-dark</c:when>
                <c:otherwise>bg-info</c:otherwise>
            </c:choose>
            border-0" role="alert" aria-live="assertive" aria-atomic="true">
            <div class="d-flex">
                <div class="toast-body">
                    ${message.value}
                </div>
                <button type="button" class="btn-close btn-close-white me-2 m-auto"
                        data-bs-dismiss="toast" aria-label="Close"></button>
            </div>
        </div>
    </div>
</c:if>

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
<script>
    document.addEventListener('DOMContentLoaded', function () {
        var toastEl = document.getElementById('liveToast');
        if (toastEl) {
            var toast = new bootstrap.Toast(toastEl, { delay: 3000 }); // 3000 ms = 3 secondi
            toast.show();
        }
    });
</script>

</body>
</html>
