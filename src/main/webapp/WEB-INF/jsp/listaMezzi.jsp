<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page contentType="text/html;charset=UTF-8" %>

<div class="d-flex justify-content-end mb-3">
    <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#nuovoTrasportatoreModal">
        Aggiungi Nuovo
    </button>
</div>

<table id="trasportatoriTable" class="table-light table-bordered  align-middle">
    <thead class="bg-primary text-white">
        <tr>
            <th>Trasportatore</th>
            <th>Mezzi</th>
            <th>Azioni</th>
        </tr>
    </thead>
    <tbody>
        <c:forEach var="trasportatore" items="${trasportatori}">
            <tr>
                <td>${trasportatore.nome}</td>
                <td>
                    <ul class="mb-0">
                        <c:forEach var="mezzo" items="${trasportatore.mezziList}">
                            <li>${mezzo}</li>
                        </c:forEach>
                    </ul>
                </td>
                <td>
                    <!-- Modifica -->
                    <button type="button" class="btn btn-sm btn-primary btn-edit"
                            data-id="${trasportatore.id}"
                            data-nome="${trasportatore.nome}"
                            data-mezzi="${trasportatore.mezzi}"
                            data-bs-toggle="modal" data-bs-target="#editTrasportatoreModal">
                        <i class="bi bi-pencil-square"></i>
                    </button>
                    <!-- Elimina -->
                    <button type="button" class="btn btn-sm btn-danger btn-delete"
                            id="btnEliminaTrasp"
                            data-id="${trasportatore.id}"
                            data-nome="${trasportatore.nome}"
                            data-bs-toggle="modal" data-bs-target="#confermaEliminaModal">
                        <i class="bi bi-trash"></i>
                    </button>
                </td>
            </tr>
        </c:forEach>
    </tbody>
</table>

<!-- Modal Nuovo Trasportatore -->
<div class="modal fade" id="nuovoTrasportatoreModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form method="post" action="/trasportatori/salva" id="nuovoForm" class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title">Nuovo Trasportatore</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        <div class="mb-3">
          <label class="form-label">Nome Trasportatore</label>
          <input type="text" name="nome" class="form-control" required>
        </div>

        <input type="hidden" name="targhe" id="nuovoTargheHidden">

        <div class="mb-3">
          <label class="form-label">Targhe</label>
          <table class="table table-bordered" id="nuovoTabellaTarghe">
            <thead>
              <tr>
                <th>Targa</th>
                <th style="width:50px;">Azioni</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>
          <div class="d-flex">
            <input type="text" id="nuovaTargaInput" class="form-control me-2" placeholder="Nuova targa">
            <button type="button" class="btn btn-success" id="nuovoAggiungiTargaBtn">Aggiungi</button>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
        <button type="submit" class="btn btn-success">Salva</button>
      </div>
    </form>
  </div>
</div>

<!-- Modal Modifica Trasportatore -->
<div class="modal fade" id="editTrasportatoreModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog modal-lg">
    <form method="post" action="/trasportatori/salva" id="editForm" class="modal-content">
      <div class="modal-header d-flex justify-content-between align-items-center">
        <h5 class="modal-title">Modifica Trasportatore</h5>
        <button type="button" class="btn btn-outline-secondary" id="toggleLock" title="Sblocca per modificare">
          🔒</i>
        </button>
      </div>
      <div class="modal-body">
        <input type="hidden" name="id" id="editId">
        <input type="hidden" name="targhe" id="targheHidden">

        <div class="mb-3">
          <label class="form-label">Nome</label>
          <input type="text" name="nome" id="editNome" class="form-control" disabled required>
        </div>

        <div class="mb-3">
          <label class="form-label">Targhe</label>
          <table class="table table-bordered" id="tabellaTarghe">
            <thead>
              <tr>
                <th>Targa</th>
                <th style="width:50px;">Azioni</th>
              </tr>
            </thead>
            <tbody></tbody>
          </table>
          <div class="d-flex">
            <input type="text" id="nuovaTarga" class="form-control me-2" placeholder="Nuova targa" disabled>
            <button type="button" class="btn btn-success" id="aggiungiTargaBtn" disabled>Aggiungi</button>
          </div>
        </div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
        <button type="submit" class="btn btn-primary" id="saveEditBtn" disabled>Salva Modifiche</button>
      </div>
    </form>
  </div>
</div>

<!-- Modale Conferma Eliminazione -->
<div class="modal fade" id="confermaEliminaModal" tabindex="-1" aria-hidden="true">
  <div class="modal-dialog">
    <form method="post" action="/trasportatori/delete" class="modal-content">
      <div class="modal-header bg-danger text-white">
        <h5 class="modal-title">Conferma Eliminazione</h5>
        <button type="button" class="btn-close btn-close-white" data-bs-dismiss="modal"></button>
      </div>
      <div class="modal-body">
        Sei sicuro di voler eliminare <b id="nomeDaEliminare"></b>?
        <input type="hidden" name="id" id="idDaEliminare">
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Annulla</button>
        <button type="submit" class="btn btn-danger">Elimina</button>
      </div>
    </form>
  </div>
</div>

<!-- Bootstrap Icons -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">

<script>

    // DataTable
     $(document).ready(function () {
       $('#trasportatoriTable').DataTable({
         pageLength: 25,       // righe per pagina
         lengthChange: false,  // nasconde il select per cambiare il numero righe
         language: {
           url: '//cdn.datatables.net/plug-ins/1.13.6/i18n/Italian.json'
         },
         pagingType: "simple_numbers"
       });
     });

    //Gestione Modifica
    var lockBtn = document.getElementById('toggleLock');
    var locked = true; // stato iniziale


    // Funzione toggle lucchetto
    lockBtn.addEventListener('click', function() {
        locked = !locked;
        // Cambia icona 🔒 🔓
        lockBtn.textContent = locked ? '🔒' : '🔓';
        // Abilita/disabilita tutti gli input della tabella
        exampleModal.querySelectorAll('input, button').forEach(function(el) {
                // Non toccare il pulsante lucchetto e il close del modal
                if (el !== lockBtn && !el.classList.contains('btn-close')) {
                    el.disabled = locked;
                }
            });
    });


     var exampleModal = document.getElementById('editTrasportatoreModal');

         // Evento che si attiva quando il modal viene mostrato
         exampleModal.addEventListener('show.bs.modal', function (event) {
             var button = event.relatedTarget; // Bottone che ha attivato il modal

             // Estrae i dati dagli attributi data-*
             var id = button.getAttribute('data-id');
             var nome = button.getAttribute('data-nome');
             var mezzi = button.getAttribute('data-mezzi');

             // Aggiorna il contenuto del modal
             exampleModal.querySelector('#editId').value = id;
             exampleModal.querySelector('#editNome').value = nome;

               // Legge le targhe dal bottone
                     var targheString = button.getAttribute('data-mezzi'); // "AA123BB#CC456DD#EE789FF"
                     var targheArray = targheString.split('#'); // ["AA123BB", "CC456DD", "EE789FF"]

                     // Seleziona il tbody della tabella
                     var tbody = exampleModal.querySelector('#tabellaTarghe tbody');

                     // Pulisce il contenuto precedente
                     tbody.innerHTML = '';

                     // Inserisce una riga per ogni targa
                     targheArray.forEach((targa, index) => {
                         var tr = document.createElement('tr');
                          tr.innerHTML =        '<td><input type="text" class="form-control targa-input" value="' + targa + '" disabled></td>' +
                                                '<td><button type="button" class="btn btn-danger btn-sm btn-elimina" disabled>Elimina</button></td>';

                                 // Aggiunge listener al pulsante elimina
                                 tr.querySelector('.btn-elimina').addEventListener('click', function() {
                                     tr.remove();

                                 });

                                 tbody.appendChild(tr);

                     });

                      var addTargaBtn = document.getElementById('aggiungiTargaBtn');

                                                   addTargaBtn.addEventListener('click', function() {

                                                                                     var targa = document.getElementById('nuovaTarga');
                                                                                     if (targa.value != null && targa.value != ''){
                                                                                         var tr = document.createElement('tr');
                                                                                         tr.innerHTML =        '<td><input type="text" class="form-control targa-input" value="' + targa.value + '" ></td>' +
                                                                                                                '<td><button type="button" class="btn btn-danger btn-sm btn-elimina">Elimina</button></td>';

                                                                                          tr.querySelector('.btn-elimina').addEventListener('click', function() {
                                                                                                                              tr.remove();

                                                                                                                          });
                                                                                        targa.value = '';
                                                                                         tbody.appendChild(tr);
                                                                                     }
                                                                                    });


               // Submit form
               var form = document.getElementById('editForm');
               form.addEventListener('submit', function(e) {
                   e.preventDefault(); // previene submit normale per mostrare log
                   var tbody = exampleModal.querySelector('#tabellaTarghe');
                   var targhe = Array.from(tbody.querySelectorAll('input.targa-input')).map(i => i.value.trim());
                   document.getElementById('targheHidden').value = targhe.join('#');

                   // Ora submit al backend
                   form.submit();

               });
         });
//FINE GESTIONE MODIFICA

//GESTIONE NUOVO
var btnNuovaTarga = document.getElementById('nuovoAggiungiTargaBtn');
btnNuovaTarga.addEventListener('click', function() {
                                                                                    var tbodyNuovo  = document.getElementById('nuovoTabellaTarghe');
                                                                                     var targa = document.getElementById('nuovaTargaInput');
                                                                                     if (targa.value != null && targa.value != ''){
                                                                                         var tr = document.createElement('tr');
                                                                                         tr.innerHTML =        '<td><input type="text" class="form-control targa-input" value="' + targa.value + '" ></td>' +
                                                                                                                '<td><button type="button" class="btn btn-danger btn-sm btn-elimina">Elimina</button></td>';

                                                                                          tr.querySelector('.btn-elimina').addEventListener('click', function() {
                                                                                                                              tr.remove();

                                                                                                                          });
                                                                                        targa.value = '';
                                                                                        tbodyNuovo.appendChild(tr);
                                                                                     }
                                                                                    });

var nuovoForm = document.getElementById('nuovoForm');
var nuovoModal = document.getElementById('nuovoTrasportatoreModal');
               nuovoForm.addEventListener('submit', function(e) {
                   e.preventDefault(); // previene submit normale per mostrare log
                   var tbody = nuovoModal.querySelector('#nuovoTabellaTarghe');
                   var targhe = Array.from(tbody.querySelectorAll('input.targa-input')).map(i => i.value.trim());
                   document.getElementById('nuovoTargheHidden').value = targhe.join('#');

                   // Ora submit al backend
                   nuovoForm.submit();

               });

var eliminaModal = document.getElementById('confermaEliminaModal');
eliminaModal.addEventListener('show.bs.modal', function (event) {
             var button = event.relatedTarget; // Bottone che ha attivato il modal
             // Estrae i dati dagli attributi data-*
             var nome = button.getAttribute('data-nome');
             var id = button.getAttribute('data-id');
             eliminaModal.querySelector('#nomeDaEliminare').textContent = nome;
             eliminaModal.querySelector('#idDaEliminare').value = id;

             });

</script>
