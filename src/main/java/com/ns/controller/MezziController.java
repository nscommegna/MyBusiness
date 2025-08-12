package com.ns.controller;

import com.ns.model.Mezzo;
import com.ns.model.Mezzo;
import com.ns.service.MezzoService;
import com.ns.service.MezzoService;
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

import java.util.List;

import static com.ns.utils.Constants.*;

@Slf4j
@Controller
public class MezziController {

   @Autowired
   RegistroService registroService;
   @Autowired
   MezzoService mezzoService;



    @GetMapping("/mezzi")
    public String listaMezzo(Model model) {
        List<Mezzo> mezzi = mezzoService.findAll();
        model.addAttribute("mezzi",mezzi);
        model.addAttribute(PAGE_TITLE,GESTIONE_MEZZI);
        model.addAttribute(PAGE_CONTENT,PAGE_MEZZI);
        // carica dati e aggiungi al model
        //model.addAttribute("mezzi", mezziService.findAll());
        return "index"; // torna sempre al layout principale
    }

    @PostMapping("/mezzo/nuovo")
    public String creaMezzo(@ModelAttribute Mezzo mezzi, RedirectAttributes redirectAttrs) {
        mezzoService.save(mezzi);
        redirectAttrs.addFlashAttribute(new Message("Mezzo creato con successo!",MessageType.SUCCESS));
        return "redirect:/mezzi";
    }

    @PostMapping("/mezzi/update")
    public String updateMezzo(@ModelAttribute Mezzo mezzi, RedirectAttributes redirectAttrs) {
        mezzoService.save(mezzi);
        redirectAttrs.addFlashAttribute(new Message("Mezzo aggiornato con successo!", MessageType.SUCCESS));
        return "redirect:/mezzi"; // o la pagina lista mezzi
    }



    @PostMapping("/mezzi/delete")
    public String eliminaMezzo(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        mezzoService.delete(id);
        redirectAttributes.addFlashAttribute(new Message("Mezzo eliminato con successo", MessageType.SUCCESS));
        return "redirect:/mezzi";
    }


}
