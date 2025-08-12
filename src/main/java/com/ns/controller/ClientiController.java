package com.ns.controller;

import com.ns.model.Cliente;
import com.ns.model.Cliente;
import com.ns.service.ClienteService;
import com.ns.service.ClienteService;
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
public class ClientiController {

   @Autowired
   RegistroService registroService;
   @Autowired
   ClienteService clienteService;



    @GetMapping("/clienti")
    public String listaClienti(Model model) {
        List<Cliente> clienti = clienteService.findAll();
        model.addAttribute("clienti",clienti);
        model.addAttribute(PAGE_TITLE,GESTIONE_CLIENTI);
        model.addAttribute(PAGE_CONTENT,PAGE_CLIENTI);
        // carica dati e aggiungi al model
        //model.addAttribute("clienti", clienteService.findAll());
        return "index"; // torna sempre al layout principale
    }

    @PostMapping("/cliente/nuovo")
    public String creaCliente(@ModelAttribute Cliente cliente, RedirectAttributes redirectAttrs) {
        clienteService.save(cliente);
        redirectAttrs.addFlashAttribute(new Message("Cliente creato con successo!",MessageType.SUCCESS));
        return "redirect:/clienti";
    }

    @PostMapping("/cliente/update")
    public String updateCliente(@ModelAttribute Cliente cliente, RedirectAttributes redirectAttrs) {
        clienteService.save(cliente);
        redirectAttrs.addFlashAttribute(new Message("Cliente aggiornato con successo!", MessageType.SUCCESS));
        return "redirect:/clienti"; // o la pagina lista clienti
    }

/*    @GetMapping("/cliente/{id}")
    public String dettaglioCliente(@PathVariable Long id, Model model) {
        model.addAttribute("pageTitle", "Dettaglio Cliente");
        model.addAttribute("contentPage", "/WEB-INF/views/ClienteDettaglio.jsp");

        model.addAttribute("cliente", clienteService.findById(id));
        model.addAttribute("acquisti", acquistoService.findByClienteId(id));
        return "index"; // torna sempre al layout principale
    }*/

    @PostMapping("/cliente/delete")
    public String eliminaCliente(@RequestParam Long id, RedirectAttributes redirectAttributes) {
        clienteService.deleteCliente(id);
        redirectAttributes.addFlashAttribute(new Message("Cliente eliminato con successo", MessageType.SUCCESS));
        return "redirect:/clienti";
    }


}
