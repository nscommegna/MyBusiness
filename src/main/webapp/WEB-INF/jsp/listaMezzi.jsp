<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="d-flex justify-content-end mb-3">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#aggiungiClienteModal">
        Aggiungi Nuovo
    </button>
</div>


<table id="fornitoriTable" class="table-light table-bordered  align-middle">
     <thead class="bg-primary text-white">
        <tr>
            <th>Ragione Sociale</th>
            <th>Città</th>
            <th>Indirizzo</th>
            <th>Telefono</th>
            <th>Azioni</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="cliente" items="${clienti}">
            <tr>
                <td>${cliente.ragioneSociale}</td>
                <td>${cliente.citta}</td>
                <td>${cliente.indirizzo}</td>
                <td>${cliente.telefono}</td>
                <td>
                    <button type="button" class="btn btn-primary btn-modifica"
                            data-bs-toggle="modal"
                            data-bs-target="#modificaClienteModal"
                            data-id="${cliente.id}"
                            data-nome="${cliente.ragioneSociale}"
                            data-citta="${cliente.citta}"
                            data-indirizzo="${cliente.indirizzo}"
                            data-partitaIva="${cliente.partitaIva}"
                            data-telefono="${cliente.telefono}"
                            data-luogoConsegna="${cliente.luogoConsegna}">
                        <i class="fa fa-edit"></i>
                    </button>
                    </button>
                    <button type="button" class="btn btn-danger btn-elimina"
                            data-id="${cliente.id}"
                            data-nome="${cliente.ragioneSociale}">
                      <i class="fa fa-trash"></i>
                    </button>

                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!--Modale nuovo Cliente -->
<div class="modal fade" id="aggiungiClienteModal" tabindex="-1" aria-labelledby="aggiungiClienteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">  <!-- modal-lg per grande -->
    <div class="modal-content">
      <form action="${pageContext.request.contextPath}/cliente/nuovo" method="post">
        <div class="modal-header">
          <h5 class="modal-title" id="aggiungiClienteModal">Nuovo Cliente</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
        </div>
        <div class="modal-body">
          <div class="row g-3">
            <div class="col-md-6">
              <label for="nome" class="form-label">Ragione Sociale</label>
              <input type="text" class="form-control" id="nome" name="ragioneSociale" required>
            </div>
            <div class="col-md-6">
                          <label for="citta" class="form-label">Città</label>
                          <input type="text" class="form-control" id="citta" name="citta">
             </div>
             <div class="col-md-12">
                                       <label for="partitaIva" class="form-label">Partita IVA</label>
                                       <input type="text" class="form-control" id="partitaIva" name="partitaIva">
                                     </div>
            <div class="col-md-8">
                          <label for="indirizzo" class="form-label">Indirizzo</label>
                          <input type="text" class="form-control" id="indirizzo" name="indirizzo">
                        </div>

             <div class="col-md-4">
                          <label for="telefono" class="form-label">Telefono</label>
                          <input type="text" class="form-control" id="telefono" name="telefono">
                        </div>
            <div class="col-md-12">
              <label for="luogoConsegna" class="form-label">Luogo Consegna</label>
              <input type="text" class="form-control" id="luogoConsegna" name="luogoConsegna" required>
            </div>
          </div>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
          <button type="submit" class="btn btn-primary">Salva Cliente</button>
        </div>
      </form>
    </div>
  </div>
</div>

<!--Modale visualizza/modifica Fornitore -->

<div class="modal fade" id="modificaClienteModal" tabindex="-1" aria-labelledby="modificaClienteLabel" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <div class="modal-content">
      <form id="formModificaCliente" method="post" action="${pageContext.request.contextPath}/cliente/update">
        <div class="modal-header">
          <h5 class="modal-title col 12" id="modificaClienteLabel">Modifica Cliente</h5>
           <i id="toggleLock" class="fa fa-lock ms-2 text-secondary col-2 end-0" style="cursor:pointer;" title="Sblocca per modificare"></i>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Chiudi"></button>
        </div>
        <div class="modal-body">
          <input type="hidden" name="id" id="modifica-id" />

          <div class="mb-6">
            <label for="modifica-ragioneSociale" class="form-label">Ragione sociale</label>
            <input type="text" class="form-control" id="modifica-ragioneSociale" name="ragioneSociale" required />
          </div>
          <div class="mb-6">
            <label for="modifica-citta" class="form-label">Città</label>
            <input type="text" class="form-control" id="modifica-citta" name="citta" required />
          </div>
          <div class="mb-12">
            <label for="modifica-partitaIva" class="form-label">Partita IVA</label>
            <input type="text" class="form-control" id="modifica-partitaIva" name="partitaIva" />
          </div>
          <div class="mb-8">
            <label for="modifica-indirizzo" class="form-label">Indirizzo</label>
            <input type="text" class="form-control" id="modifica-indirizzo" name="indirizzo" />
          </div>
          <div class="mb-4">
            <label for="modifica-telefono" class="form-label">Telefono</label>
            <input type="text" class="form-control" id="modifica-telefono" name="telefono" />
          </div>
          <div class="mb-3">
            <label for="modifica-luogoConsegna" class="form-label">Luogo Consegna</label>
            <input type="text" class="form-control" id="modifica-luogoConsegna" name="luogoConsegna" />
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

<!--Modale elimina Cliente -->
<div class="modal fade" id="confermaEliminaModal" tabindex="-1" aria-labelledby="confermaEliminaLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <form method="post" action="${pageContext.request.contextPath}/cliente/delete">
        <div class="modal-header bg-danger text-white">
          <h5 class="modal-title" id="confermaEliminaLabel">Conferma Eliminazione</h5>
          <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
        </div>
        <div class="modal-body">
          Sei sicuro di voler eliminare <strong id="nomeClienteDaEliminare"></strong>?
          <input type="hidden" name="id" id="clienteIdDaEliminare" value="">
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
      $('#modificaClienteModal').find('input, select, textarea').prop('disabled', false);
      $('#btnSalva').prop('disabled', false);
    } else {
      $(this)
        .removeClass('fa-lock-open text-success')
        .addClass('fa-lock text-secondary')
        .attr('title', 'Sblocca per modificare');
      $('#modificaClienteModal').find('input, select, textarea').prop('disabled', true);
      $('#btnSalva').prop('disabled', true);
    }
  });


  $('#modificaClienteModal').on('show.bs.modal', function (event) {
    var button = $(event.relatedTarget); // Bottone che ha aperto il modal

    // Prendo i dati dal data-attribute
    var id = button.data('id');
    var nome = button.data('nome');
    var indirizzo = button.data('indirizzo');
    var partitaIva = button.data('partitaiva');
    var telefono = button.data('telefono');
    var luogoConsegna = button.data('luogoconsegna');
    var citta = button.data('citta');

    // Popolo i campi del form
    var modal = $(this);
    modal.find('#modifica-id').val(id);
    modal.find('#modifica-ragioneSociale').val(nome);
    modal.find('#modifica-luogoConsegna').val(luogoConsegna);
    modal.find('#modifica-indirizzo').val(indirizzo);
    modal.find('#modifica-partitaIva').val(partitaIva);
    modal.find('#modifica-telefono').val(telefono);
    modal.find('#modifica-citta').val(citta);

     // Di default blocca i campi e il salva, con lucchetto chiuso
      $('#modificaClienteModal').find('input, select, textarea').prop('disabled', true);
      $('#btnSalva').prop('disabled', true);
      $('#toggleLock').removeClass('fa-lock-open text-success').addClass('fa-lock text-secondary').attr('title', 'Sblocca per modificare');
  });
});

$(document).ready(function() {
  $('.btn-elimina').click(function() {
    const data = $(this).data();
    $('#clienteIdDaEliminare').val(data.id);
    $('#nomeClienteDaEliminare').text(data.nome);

    const modal = new bootstrap.Modal(document.getElementById('confermaEliminaModal'));
    modal.show();
  });
});


</script>
