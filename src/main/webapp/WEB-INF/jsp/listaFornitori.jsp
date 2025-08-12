<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="d-flex justify-content-end mb-3">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#aggiungiFornitoreModal">
        Aggiungi Nuovo
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
                    <button type="button" class="btn btn-primary btn-modifica"
                            data-bs-toggle="modal"
                            data-bs-target="#modificaFornitoreModal"
                            data-id="${fornitore.id}"
                            data-nome="${fornitore.nome}"
                            data-cognome="${fornitore.cognome}"
                            data-indirizzo="${fornitore.indirizzo}"
                            data-partitaIva="${fornitore.partitaIva}"
                            data-telefono="${fornitore.telefono}"
                            data-codiceFiscale="${fornitore.codiceFiscale}"
                            data-citta="${fornitore.citta}"
                            data-provincia="${fornitore.provincia}"
                            data-cap="${fornitore.cap}">
                        <i class="fa fa-edit"></i>
                    </button>
                    </button>
                    <button type="button" class="btn btn-danger btn-elimina"
                            data-id="${fornitore.id}"
                            data-nome="${fornitore.nome}"
                            data-cognome="${fornitore.cognome}">
                      <i class="fa fa-trash"></i>
                    </button>

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!--Modale nuovo Fornitore -->
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

<!--Modale visualizza/modifica Fornitore -->

<div class="modal fade" id="modificaFornitoreModal" tabindex="-1" aria-labelledby="modificaFornitoreLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="formModificaFornitore" method="post" action="${pageContext.request.contextPath}/fornitore/update">
        <div class="modal-header">
          <h5 class="modal-title col 12" id="modificaFornitoreLabel">Modifica Fornitore</h5>
           <i id="toggleLock" class="fa fa-lock ms-2 text-secondary col-2 end-0" style="cursor:pointer;" title="Sblocca per modificare"></i>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="id" id="modifica-id" />

          <div class="mb-3">
            <label for="modifica-nome" class="form-label">Nome</label>
            <input type="text" class="form-control" id="modifica-nome" name="nome" required />
          </div>
          <div class="mb-3">
            <label for="modifica-cognome" class="form-label">Cognome</label>
            <input type="text" class="form-control" id="modifica-cognome" name="cognome" required />
          </div>
          <div class="mb-3">
            <label for="modifica-indirizzo" class="form-label">Indirizzo</label>
            <input type="text" class="form-control" id="modifica-indirizzo" name="indirizzo" />
          </div>
          <div class="mb-3">
            <label for="modifica-partitaIva" class="form-label">Partita IVA</label>
            <input type="text" class="form-control" id="modifica-partitaIva" name="partitaIva" />
          </div>
          <div class="mb-3">
            <label for="modifica-telefono" class="form-label">Telefono</label>
            <input type="text" class="form-control" id="modifica-telefono" name="telefono" />
          </div>
          <div class="mb-3">
            <label for="modifica-codiceFiscale" class="form-label">Codice Fiscale</label>
            <input type="text" class="form-control" id="modifica-codiceFiscale" name="codiceFiscale" />
          </div>
          <div class="mb-3">
            <label for="modifica-citta" class="form-label">Città</label>
            <input type="text" class="form-control" id="modifica-citta" name="citta" />
          </div>
          <div class="mb-3">
            <label for="modifica-provincia" class="form-label">Provincia</label>
            <input type="text" class="form-control" id="modifica-provincia" name="provincia" />
          </div>
          <div class="mb-3">
            <label for="modifica-cap" class="form-label">CAP</label>
            <input type="text" class="form-control" id="modifica-cap" name="cap" />
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
          <button type="submit" id="btnSalva" class="btn btn-primary">Salva Modifiche</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!--Modale elimina Fornitore -->
<div class="modal fade" id="confermaEliminaModal" tabindex="-1" aria-labelledby="confermaEliminaLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" action="${pageContext.request.contextPath}/fornitore/delete">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title" id="confermaEliminaLabel">Conferma Eliminazione</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          Sei sicuro di voler eliminare <strong id="nomeFornitoreDaEliminare"></strong>?
          <input type="hidden" name="id" id="fornitoreIdDaEliminare" value="">
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
          <button type="submit" class="btn btn-danger">Elimina</button>
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

$(document).ready(function() {

  $('#toggleLock').click(function() {
    const locked = $(this).hasClass('fa-lock');
    if (locked) {
      $(this)
        .removeClass('fa-lock text-secondary')
        .addClass('fa-lock-open text-success')
        .attr('title', 'Blocca di nuovo');
      $('#modificaFornitoreModal').find('input, select, textarea').prop('disabled', false);
      $('#btnSalva').prop('disabled', false);
    } else {
      $(this)
        .removeClass('fa-lock-open text-success')
        .addClass('fa-lock text-secondary')
        .attr('title', 'Sblocca per modificare');
      $('#modificaFornitoreModal').find('input, select, textarea').prop('disabled', true);
      $('#btnSalva').prop('disabled', true);
    }
  });


  $('#modificaFornitoreModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Bottone che ha aperto il modal

    // Prendo i dati dal data-attribute
    var id = button.data('id');
    var nome = button.data('nome');
    var cognome = button.data('cognome');
    var indirizzo = button.data('indirizzo');
    var partitaIva = button.data('partitaiva');
    var telefono = button.data('telefono');
    var codiceFiscale = button.data('codicefiscale');
    var citta = button.data('citta');
    var provincia = button.data('provincia');
    var cap = button.data('cap');

    // Popolo i campi del form
    var modal = $(this);
    modal.find('#modifica-id').val(id);
    modal.find('#modifica-nome').val(nome);
    modal.find('#modifica-cognome').val(cognome);
    modal.find('#modifica-indirizzo').val(indirizzo);
    modal.find('#modifica-partitaIva').val(partitaIva);
    modal.find('#modifica-telefono').val(telefono);
    modal.find('#modifica-codiceFiscale').val(codiceFiscale);
    modal.find('#modifica-citta').val(citta);
    modal.find('#modifica-provincia').val(provincia);
    modal.find('#modifica-cap').val(cap);

     // Di default blocca i campi e il salva, con lucchetto chiuso
      $('#modificaFornitoreModal').find('input, select, textarea').prop('disabled', true);
      $('#btnSalva').prop('disabled', true);
      $('#toggleLock').removeClass('fa-lock-open text-success').addClass('fa-lock text-secondary').attr('title', 'Sblocca per modificare');
  });
});

$(document).ready(function() {
  $('.btn-elimina').click(function() {
    const data = $(this).data();
    $('#fornitoreIdDaEliminare').val(data.id);
    $('#nomeFornitoreDaEliminare').text(data.nome + ' ' + data.cognome);

    const modal = new bootstrap.Modal(document.getElementById('confermaEliminaModal'));
    modal.show();
  });
});


</script>
