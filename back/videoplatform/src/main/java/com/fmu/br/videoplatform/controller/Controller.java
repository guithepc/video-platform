package com.fmu.br.videoplatform.controller;

import com.fmu.br.videoplatform.services.impl.GeneratePdfImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/services")
public class Controller {


    @PostMapping(value="/generate-pdf")
    public ResponseEntity<String> consultAgenda (@RequestBody String frase) throws InterruptedException {
        GeneratePdfImpl generator = new GeneratePdfImpl();
        generator.generate(frase);

        return ResponseEntity.ok().body("");
    }


}
