package com.ns.service;

import com.ns.model.Fornitore;
import com.ns.model.Registro;
import com.ns.repository.FornitoreRepository;
import com.ns.repository.RegistroRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class FornitoreService {

    private final FornitoreRepository fornitoreRepository;

    public FornitoreService(FornitoreRepository fornitoreRepository) {
        this.fornitoreRepository = fornitoreRepository;
    }

    public List<Fornitore> findAll() {
        return fornitoreRepository.findAll();
    }



    public Fornitore save(Fornitore fornitore) {
        // qui puoi mettere eventuali controlli o logica
        return fornitoreRepository.save(fornitore);
    }


    public void deleteFornitore(Long id) {
        fornitoreRepository.deleteById(id);
    }
}
