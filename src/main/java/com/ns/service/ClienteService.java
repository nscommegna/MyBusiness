package com.ns.service;

import com.ns.model.Cliente;
import com.ns.model.Fornitore;
import com.ns.repository.ClienteRepository;
import com.ns.repository.FornitoreRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ClienteService {

    private final ClienteRepository clienteRepository;

    public ClienteService(FornitoreRepository fornitoreRepository, ClienteRepository clienteRepository) {

        this.clienteRepository = clienteRepository;
    }

    public List<Cliente> findAll() {
        return clienteRepository.findAll();
    }



    public Cliente save(Cliente fornitore) {
        // qui puoi mettere eventuali controlli o logica
        return clienteRepository.save(fornitore);
    }

    public void deleteCliente(Long id) {
        clienteRepository.deleteById(id);
    }
}
