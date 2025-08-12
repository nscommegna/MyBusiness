<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="d-flex justify-content-end mb-3">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#aggiungiFornitoreModal">
        + Aggiungi Nuovo
    </button>
</div>


<table id="fornitoriTable" class="table-light table-bordered  align-middle">
     <thead class="bg-primary text-white">
        <tr>
            <th>Nome</th>
            <th>Cognome</th>
            <th>Indirizzo</th>
            <th>Telefono</th>
            <th>Azioni</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="fornitore" items="${fornitori}">
            <tr>
                <td>${fornitore.nome}</td>
                <td>${fornitore.cognome}</td>
                <td>${fornitore.indirizzo}</td>
                <td>${fornitore.telefono}</td>
                <td>
                    <a type="button" class="btn btn-primary btn-sm col-2" href="${pageContext.request.contextPath}/fornitori/visualizza"><i class="fa-solid fa-eye"></i></a>
                    <button type="button" class="btn btn-secondary btn-sm col-2"><i class="fa-solid fa-pen"></i></button>
                    <button type="button" class="btn btn-danger btn-sm col-2"><i class="fa-solid fa-trash"></i></button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<div class="modal fade" id="aggiungiFornitoreModal" tabindex="-1" aria-labelledby="aggiungiFornitoreLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">  <!-- modal-lg per grande -->
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/fornitori/nuovo" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="aggiungiFornitoreLabel">Nuovo Fornitore</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
        </div>
        <div class="modal-body">
          <div class="row g-3">
            <div class="col-md-6">
              <label for="nome" class="form-label">Nome</label>
              <input type="text" class="form-control" id="nome" name="nome" required>
            </div>
            <div class="col-md-6">
              <label for="cognome" class="form-label">Cognome</label>
              <input type="text" class="form-control" id="cognome" name="cognome" required>
            </div>

            <div class="col-md-12">
              <label for="indirizzo" class="form-label">Indirizzo</label>
              <input type="text" class="form-control" id="indirizzo" name="indirizzo">
            </div>

            <div class="col-md-6">
              <label for="partitaIva" class="form-label">Partita IVA</label>
              <input type="text" class="form-control" id="partitaIva" name="partitaIva">
            </div>

            <div class="col-md-6">
              <label for="telefono" class="form-label">Telefono</label>
              <input type="text" class="form-control" id="telefono" name="telefono">
            </div>

            <div class="col-md-6">
              <label for="codiceFiscale" class="form-label">Codice Fiscale</label>
              <input type="text" class="form-control" id="codiceFiscale" name="codiceFiscale">
            </div>

            <div class="col-md-6">
              <label for="citta" class="form-label">Città</label>
              <input type="text" class="form-control" id="citta" name="citta">
            </div>

            <div class="col-md-6">
              <label for="provincia" class="form-label">Provincia</label>
              <input type="text" class="form-control" id="provincia" name="provincia">
            </div>

            <div class="col-md-6">
              <label for="cap" class="form-label">CAP</label>
              <input type="text" class="form-control" id="cap" name="cap">
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
          <button type="submit" class="btn btn-primary">Salva Fornitore</button>
        </div>
      </form>
    </div>
  </div>
</div>


<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">


<script>
   $(document).ready(function () {
     $('#fornitoriTable').DataTable({
       pageLength: 25,       // righe per pagina
       lengthChange: false,  // nasconde il select per cambiare il numero righe
       language: {
         url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/Italian.json'
       },
       pagingType: "simple_numbers"
     });
   });

</script>
