package com.ns.controller;

import com.ns.model.Trasportatore;
import com.ns.service.TrasportatoreService;
import com.ns.utils.Message;
import com.ns.utils.MessageType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.*;

import static com.ns.utils.Constants.*;

@Slf4j
@Controller
public class MezziController {

    @Autowired
    TrasportatoreService trasportatoreService;



    @GetMapping("/mezzi")
    public String listaMezzo(Model model) {
        List<Trasportatore> trasportatori = trasportatoreService.findAll();
        model.addAttribute("trasportatori",trasportatori);
        model.addAttribute(PAGE_TITLE,GESTIONE_MEZZI);
        model.addAttribute(PAGE_CONTENT,PAGE_MEZZI);
        log.info(trasportatori.stream().findFirst().orElse(null).getMezziList().toString());
        // carica dati e aggiungi al model
        //model.addAttribute("mezzi", mezziService.findAll());
        return "index"; // torna sempre al layout principale
    }




    @PostMapping("/trasportatori/salva")
    public String salvaTrasportatore(@RequestParam(required = false) Long id,
                                     @RequestParam String nome,
                                     @RequestParam String targhe,
                                     RedirectAttributes redirectAttributes) {

        String msg = "";
        Trasportatore t;

        if (id != null) {
            // modifica
            t = trasportatoreService.findById(id)
                    .orElse(new Trasportatore());
            msg =  "Trasportatore aggiornato con successo";
        } else {
            // nuovo
            t = new Trasportatore();

            msg =  "Trasportatore aggiunto con successo";
        }
        // gestione mezzi
        t.setNome(nome);
        t.setMezzi(targhe);
        t = trasportatoreService.save(t);
        // save gestisce anche update

        redirectAttributes.addFlashAttribute(new Message(msg,MessageType.SUCCESS));
        return "redirect:/mezzi";
    }


    @PostMapping("/trasportatori/delete")
    public String delete(@RequestParam(required = true) String id,
                                     RedirectAttributes redirectAttributes) {

        String msg = "";
        Trasportatore t;
        try {
            t = trasportatoreService.findById(Long.valueOf(id))
                    .orElseThrow();
            trasportatoreService.delete(Long.valueOf(id));
            msg = "Trasportatore eliminato con successo";
            redirectAttributes.addFlashAttribute(new Message(msg, MessageType.SUCCESS));
        }
        catch (Exception e){
            log.error(e.getMessage());
            redirectAttributes.addFlashAttribute(new Message().createErrorMessage());
        }
        return "redirect:/mezzi";
        }
    }

