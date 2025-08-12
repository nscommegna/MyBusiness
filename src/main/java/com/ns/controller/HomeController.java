package com.ns.controller;

import com.ns.model.Registro;
import com.ns.service.RegistroService;
import com.ns.utils.Message;
import com.ns.utils.MessageType;
import lombok.extern.slf4j.Slf4j;
import org.apache.logging.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.awt.*;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import static com.ns.utils.Constants.*;

@Slf4j
@Controller
public class HomeController {

   @Autowired
   RegistroService registroService;




    @GetMapping("/")
    public String index(Model model) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        List<Registro> registri = registroService.findAllRegistri();
        Map<String, List<Registro>> grouped = registri.stream()
                .collect(Collectors.groupingBy(r->sdf.format(r.getData()), LinkedHashMap::new, Collectors.toList()));

        model.addAttribute("keys",grouped.keySet());
        model.addAttribute("registriByDate", grouped);
        model.addAttribute(PAGE_TITLE,REGISTRO);
        model.addAttribute(PAGE_CONTENT,PAGE_REGISTRO);
        return "index";
    }


    @PostMapping("/registro/apri")
    public String apriRegistro(@RequestParam String data, RedirectAttributes redirectAttributes) {
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
        Registro r = new Registro();
       try {
           r.setData(sdf.parse(data));
           registroService.saveRegistro(r);
           redirectAttributes.addFlashAttribute(new Message("Giornata aperta correttamente", MessageType.SUCCESS));
       }
       catch (Exception e){
           log.error(e.getMessage());
           redirectAttributes.addFlashAttribute(new Message().createErrorMessage());
       }
        return "redirect:/";
    }

    @PostMapping("/registro/aggiungi")
    public String aggiungi(@RequestParam String data,
                           String fornitore,
                           String prodotto,
                           String peso,String cliente,
                           String mezzi, RedirectAttributes redirectAttributes) {
        SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
        Registro r = new Registro();
        try {
            r.setData(sdf.parse(data));
            r.setPeso(Double.valueOf(peso));
            registroService.saveRegistro(r);
            redirectAttributes.addFlashAttribute(new Message("Registro inserito correttamente", MessageType.SUCCESS));
        }
        catch (Exception e){
            log.error(e.getMessage());
            redirectAttributes.addFlashAttribute(new Message().createErrorMessage());
        }
        return "redirect:/";
    }
}
