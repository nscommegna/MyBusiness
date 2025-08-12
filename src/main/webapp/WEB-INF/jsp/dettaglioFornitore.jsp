<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- ===== Anagrafica Fornitore ===== -->
<div class="card mb-4">
    <div class="card-header bg-primary text-white">
        Anagrafica Fornitore
    </div>
    <div class="card-body">
        <div class="row mb-2">
            <div class="col-md-4"><strong>Nome:</strong> ${fornitore.nome}</div>
            <div class="col-md-4"><strong>Cognome:</strong> ${fornitore.cognome}</div>
            <div class="col-md-4"><strong>Indirizzo:</strong> ${fornitore.indirizzo}</div>
        </div>
        <div class="row mb-2">
            <div class="col-md-4"><strong>Partita IVA:</strong> ${fornitore.partitaIva}</div>
            <div class="col-md-4"><strong>Telefono:</strong> ${fornitore.telefono}</div>
            <div class="col-md-4"><strong>Codice Fiscale:</strong> ${fornitore.codiceFiscale}</div>
        </div>
        <div class="row mb-2">
            <div class="col-md-4"><strong>Città:</strong> ${fornitore.citta}</div>
            <div class="col-md-4"><strong>Provincia:</strong> ${fornitore.provincia}</div>
            <div class="col-md-4"><strong>CAP:</strong> ${fornitore.cap}</div>
        </div>
    </div>
</div>

<!-- ===== Lista Acquisti ===== -->
<form action="/acquisti/paga" method="post">
    <table class="table table-striped table-bordered">
        <thead class="table-dark">
            <tr>
                <th><input type="checkbox" id="selectAll"></th>
                <th>Data</th>
                <th>Prodotto</th>
                <th>Prezzo</th>
                <th>Peso</th>
                <th>Importo</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="acquisto" items="${acquisti}">
                <tr>
                    <td><input type="checkbox" name="acquistiSelezionati" value="${acquisto.id}"></td>
                    <td>${acquisto.data}</td>
                    <td>${acquisto.prodotto}</td>
                    <td>${acquisto.prezzo}</td>
                    <td>${acquisto.peso}</td>
                    <td>${acquisto.importo}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div class="text-end">
        <button type="submit" class="btn btn-success">Paga</button>
    </div>
</form>

<script>
    document.getElementById('selectAll').addEventListener('click', function (e) {
        document.querySelectorAll('input[name="acquistiSelezionati"]').forEach(cb => cb.checked = e.target.checked);
    });
</script>
