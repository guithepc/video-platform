package com.fmu.uhealthy.controller;

import com.fmu.uhealthy.dto.RecipePdf;
import com.fmu.uhealthy.service.GeneratePdfImpl;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/services")
public class Controller {


    @PostMapping(value="/generate-pdf")
    public ResponseEntity<String> consultAgenda (@RequestBody RecipePdf data) {
        GeneratePdfImpl generator = new GeneratePdfImpl();
        generator.generate(data);

        return ResponseEntity.ok().body("");
    }


}
