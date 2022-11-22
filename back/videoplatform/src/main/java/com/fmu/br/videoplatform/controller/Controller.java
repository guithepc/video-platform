package com.fmu.br.videoplatform.controller;

import com.fmu.br.videoplatform.dtos.RecipePdf;
import com.fmu.br.videoplatform.services.impl.GeneratePdfImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@RequestMapping("/services")
public class Controller {


    @PostMapping(value="/generate-pdf")
    public ResponseEntity<String> generatePdf (@RequestBody RecipePdf data) throws InterruptedException {
        GeneratePdfImpl generator = new GeneratePdfImpl();
        generator.generate(data);

        return ResponseEntity.ok().body("");
    }


}
