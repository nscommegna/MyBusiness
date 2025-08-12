package com.ns.service;

import com.ns.model.Cliente;
import com.ns.model.Mezzo;
import com.ns.repository.ClienteRepository;
import com.ns.repository.FornitoreRepository;
import com.ns.repository.MezzoRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class MezzoService {

    private final MezzoRepository mezzoRepository;

    public MezzoService(FornitoreRepository fornitoreRepository, MezzoRepository mezzoRepository) {
        this.mezzoRepository = mezzoRepository;
    }

    public List<Mezzo> findAll() {
        return mezzoRepository.findAll();
    }



    public Mezzo save(Mezzo fornitore) {
        // qui puoi mettere eventuali controlli o logica
        return mezzoRepository.save(fornitore);
    }

    public void delete(Long id) {
        mezzoRepository.deleteById(id);
    }
}
