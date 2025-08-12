package com.ns.controller;

import com.ns.model.Fornitore;
import com.ns.model.Registro;
import com.ns.service.FornitoreService;
import com.ns.service.RegistroService;
import com.ns.utils.Message;
import com.ns.utils.MessageType;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.text.SimpleDateFormat;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.ns.utils.Constants.*;
import static com.ns.utils.Constants.PAGE_REGISTRO;

@Slf4j
@Controller
public class FornitoriController {

   @Autowired
   RegistroService registroService;
   @Autowired
   FornitoreService fornitoreService;



    @GetMapping("/fornitori")
    public String listaFornitori(Model model) {
        List<Fornitore> fornitori = fornitoreService.findAll();
        model.addAttribute("fornitori",fornitori);
        model.addAttribute(PAGE_TITLE,GESTIONE_FORNITORI);
        model.addAttribute(PAGE_CONTENT,PAGE_LISTA_FORNITORI);
        // carica dati e aggiungi al model
        //model.addAttribute("fornitori", fornitoreService.findAll());
        return "index"; // torna sempre al layout principale
    }

    @PostMapping("/fornitori/nuovo")
    public String creaFornitore(@ModelAttribute Fornitore fornitore, RedirectAttributes redirectAttrs) {
        fornitoreService.save(fornitore);
        redirectAttrs.addFlashAttribute(new Message("Fornitore creato con successo!",MessageType.SUCCESS));
        return "redirect:/fornitori";
    }


/*    @GetMapping("/fornitore/{id}")
    public String dettaglioFornitore(@PathVariable Long id, Model model) {
        model.addAttribute("pageTitle", "Dettaglio Fornitore");
        model.addAttribute("contentPage", "/WEB-INF/views/FornitoreDettaglio.jsp");

        model.addAttribute("fornitore", fornitoreService.findById(id));
        model.addAttribute("acquisti", acquistoService.findByFornitoreId(id));
        return "index"; // torna sempre al layout principale
    }*/

}
