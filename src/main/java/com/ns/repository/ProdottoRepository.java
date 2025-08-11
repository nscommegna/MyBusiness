package com.ns.repository;

import com.ns.model.Prodotto;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ProdottoRepository extends JpaRepository<Prodotto, Long> {

    // Puoi aggiungere query personalizzate se servono, ad esempio:
    // List<Cliente> findByCitta(String citta);
    // Optional<Cliente> findByRagioneSociale(String ragioneSociale);

}
