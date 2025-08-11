<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 <div class="d-flex justify-content-between align-items-center mb-4">
     <h2>Registro</h2>
     <button class="btn btn-success" data-bs-toggle="modal" data-bs-target="#apriGiornataModal">
         Apri giornata
     </button>
 </div>
 <c:forEach var="key" items="${keys}">
     <div class="card mb-4">
         <div class="card-header bg-primary text-white d-flex justify-content-between align-items-center">
             <strong>${key}</strong>
             <button class="btn btn-light btn-sm"
                     data-bs-toggle="modal"
                     data-bs-target="#aggiungiRigaModal"
                     data-data="${key}">
                 +
             </button>
         </div>
         <ul class="list-group list-group-flush">
             <c:forEach var="registro" items="${registriByDate[key]}">
                 <li class="list-group-item">
                 <br>
                     <div class="row">
                        <div class="col-md-2"><strong>Prodotto:</strong> ${registro.prodotto}</div>
                         <div class="col-md-3"><strong>Fornitore:</strong> ${registro.fornitore}</div>
                         <div class="col-md-4"><strong>Mezzo:</strong> ${registro.mezzo}</div>
                         <div class="col-md-2"><strong>Cliente:</strong> ${registro.cliente}</div>
                         <div class="col-md-1"><button class="btn btn-warning btn-sm">Modifica</button></div>

                         <br><br>

                         <div class="col-md-2"><strong>Prezzo Acquisto:</strong> ${registro.prezzoAcquisto}</div>
                         <div class="col-md-3"><strong>Peso:</strong> ${registro.peso}</div>
                         <div class="col-md-2"><strong>Costo Trasporto:</strong> ${registro.costoTrasporto}</div>
                         <div class="col-md-2"><strong>Costo Trasporto + Iva :</strong> ${registro.costoTrasportoIva}</div>
                         <div class="col-md-2"><strong>Prezzo vendita :</strong> ${registro.prezzoVendita}</div>
                         <div class="col-md-1"><button class="btn btn-success btn-sm">Chiudi</button></div>

                     </div>
                 </li>
             </c:forEach>
         </ul>
     </div>
 </c:forEach>

 <!-- Modale Apri Giornata -->
 <div class="modal fade" id="apriGiornataModal" tabindex="-1" aria-hidden="true">
     <div class="modal-dialog">
         <form method="post" action="/registro/apri">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">Apri giornata</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                 </div>
                 <div class="modal-body">
                     <label for="dataGiornata" class="form-label">Seleziona data</label>
                     <input type="date" class="form-control" id="dataGiornata" name="data" required>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                     <button type="submit" class="btn btn-success">Apri</button>
                 </div>
             </div>
         </form>
     </div>
 </div>

 <!-- Modale Aggiungi Riga -->
 <div class="modal fade" id="aggiungiRigaModal" tabindex="-1" aria-hidden="true">
     <div class="modal-dialog">
         <form method="post" action="/registro/aggiungi">
             <input type="hidden" id="dataRegistro" name="data">
             <div class="modal-content">
                 <div class="modal-header">
                     <h5 class="modal-title">Aggiungi riga</h5>
                     <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
                 </div>
                 <div class="modal-body">
                     <div class="mb-3">
                         <label class="form-label">Fornitore</label>
                         <input type="text" class="form-control" name="fornitore" >
                     </div>
                     <div class="mb-3">
                         <label class="form-label">Prodotto</label>
                         <input type="text" class="form-control" name="prodotto" >
                     </div>
                     <div class="mb-3">
                         <label class="form-label">Peso</label>
                         <input type="number" class="form-control" name="peso" step="0.01" >
                     </div>
                     <div class="mb-3">
                         <label class="form-label">Cliente</label>
                         <input type="text" class="form-control" name="cliente">
                     </div>
                     <div class="mb-3">
                         <label class="form-label">Mezzi</label>
                         <input type="text" class="form-control" name="mezzi">
                     </div>
                 </div>
                 <div class="modal-footer">
                     <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Chiudi</button>
                     <button type="submit" class="btn btn-primary">Aggiungi</button>
                 </div>
             </div>
         </form>
     </div>
 </div>

 <script>
     const aggiungiRigaModal = document.getElementById('aggiungiRigaModal');
     aggiungiRigaModal.addEventListener('show.bs.modal', event => {
         const button = event.relatedTarget;
         const data = button.getAttribute('data-data');
         document.getElementById('dataRegistro').value = data;
     });
 </script>
