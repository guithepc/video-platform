package com.fmu.br.videoplatform.services.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fmu.br.videoplatform.dtos.*;
import com.fmu.br.videoplatform.services.GeneratePdf;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.stereotype.Service;

import javax.swing.*;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;

@Service
public class GeneratePdfImpl implements GeneratePdf {
    @Override
    public void generate(RecipePdf data) {
        Document doc = new Document();

        //TODO:

        try {
            PdfWriter.getInstance(doc, new FileOutputStream("C:\\Repositories\\video-platform\\back\\FirstDoccdf.pdf"));
            doc.open();



//            LocalDate today = LocalDate.now();
            RecipePdf recipe = new RecipePdf();

            recipe.setClinic(new Clinic());
            recipe.setDoctor(new Doctor());
            recipe.setPacient(new Pacient());
            recipe.setPageLayout(new PageLayout());
            recipe.setItemList(new ArrayList<>());
            recipe.getItemList().add(new Medicines());
            recipe.getItemList().add(new Medicines());

            recipe.getClinic().setAddress("");
            recipe.getClinic().setName("");

            recipe.getDoctor().setCrm("");
            recipe.getDoctor().setState("");

            recipe.getPacient().setName("");
            recipe.getPacient().setDocumentNumber("");

            recipe.getPageLayout().setDate("");
            recipe.getPageLayout().setPrescription("");


            recipe.getItemList().get(0).setName("");
            recipe.getItemList().get(0).setDescription("");
            recipe.getItemList().get(0).setQuantity(1);
            recipe.getItemList().get(0).setSubTitle("");

            recipe.getItemList().get(1).setName("");
            recipe.getItemList().get(1).setDescription("");
            recipe.getItemList().get(1).setQuantity(1);
            recipe.getItemList().get(1).setSubTitle("");

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            String json = ow.writeValueAsString(recipe);

            System.out.print(json);

            String a = "a";

            Paragraph paragraph = new Paragraph(data.getPageLayout().getPrescription());
            Paragraph paragraph2 = new Paragraph(data.getPageLayout().getDate());

            doc.add(paragraph);
            doc.add(paragraph2);




        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        doc.close();
    }
}
