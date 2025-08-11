package com.ns.service;

import com.ns.model.Registro;
import com.ns.repository.RegistroRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class RegistroService {

    private final RegistroRepository registroRepository;

    public RegistroService(RegistroRepository registroRepository) {
        this.registroRepository = registroRepository;
    }

    public List<Registro> findAllRegistri() {
        return registroRepository.findAll();
    }



    public Registro saveRegistro(Registro user) {
        // qui puoi mettere eventuali controlli o logica
        return registroRepository.save(user);
    }
    
    public void deleteRegistro(Long id) {
        registroRepository.deleteById(id);
    }
}
