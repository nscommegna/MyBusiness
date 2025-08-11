package com.ns.repository;

import com.ns.model.Trasportatore;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface TrasportatoreRepository extends JpaRepository<Trasportatore, Long> {

    // Puoi aggiungere query personalizzate se servono, ad esempio:
    // List<Cliente> findByCitta(String citta);
    // Optional<Cliente> findByRagioneSociale(String ragioneSociale);

}
