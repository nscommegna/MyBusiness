package com.ns.service;

import com.ns.model.Trasportatore;
import com.ns.repository.TrasportatoreRepository;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.Optional;

@Service
public class TrasportatoreService {

    private final TrasportatoreRepository  trasportatoreRepository;

    public TrasportatoreService(TrasportatoreRepository trasportatoreRepository){
        this.trasportatoreRepository = trasportatoreRepository;
        ;
    }

    public List<Trasportatore> findAll() {
        return trasportatoreRepository.findAll();
    }



    public Trasportatore save(Trasportatore trasportatore) {
        // qui puoi mettere eventuali controlli o logica
        return trasportatoreRepository.save(trasportatore);
    }

    public void delete(Long id) {
        trasportatoreRepository.deleteById(id);
    }

    public Optional<Trasportatore> findById(Long id) {
        return trasportatoreRepository.findById(id);
    }
}
