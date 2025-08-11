package com.ns.repository;

import com.ns.model.Cliente;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface ClienteRepository extends JpaRepository<Cliente, Long> {

    // Puoi aggiungere query personalizzate se servono, ad esempio:
    // List<Cliente> findByCitta(String citta);
    // Optional<Cliente> findByRagioneSociale(String ragioneSociale);

}
