package com.fmu.br.videoplatform.services.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fmu.br.videoplatform.dtos.*;
import com.fmu.br.videoplatform.services.GeneratePdf;
import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.stereotype.Service;
import com.itextpdf.text.Font.FontFamily;

import javax.swing.*;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.time.LocalDate;
import java.time.ZoneId;
import java.util.ArrayList;

@Service
public class GeneratePdfImpl implements GeneratePdf {

    Document doc = new Document();
    @Override
    public void generate(RecipePdf data) {


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


            generateHeader(data);
            generateBody(data);



        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        } catch (JsonProcessingException e) {
            throw new RuntimeException(e);
        }
        doc.close();
    }

    public void generateHeader(RecipePdf data){
        Paragraph paragraph = new Paragraph();
        paragraph.setAlignment(Element.ALIGN_CENTER);
        paragraph.add(new Chunk(data.getPageLayout().getPrescription(), new Font(Font.BOLD, 24, Font.HELVETICA)));
        doc.add(paragraph);

        doc.add(new Paragraph(" "));

        Paragraph doctorInfoParagraph = new Paragraph();
        doctorInfoParagraph.setAlignment(Element.ALIGN_CENTER);
        doctorInfoParagraph.add(new Chunk(data.getDoctor().getName() + " " + data.getDoctor().getCrm() + " - " + data.getDoctor().getState(), new Font(Font.HELVETICA,
                14)));
        doc.add(doctorInfoParagraph);

        doc.add(new Paragraph(" "));


    }

    public void generateBody(RecipePdf data){
        Paragraph name = new Paragraph();
        name.add(new Chunk("Nome: ", new Font(Font.BOLD, 16, Font.HELVETICA)));
        name.add(new Chunk(data.getPacient().getName().toUpperCase(), new Font(Font.HELVETICA, 16)));

        Paragraph document = new Paragraph();
        document.add(new Chunk("CPF: ", new Font(Font.BOLD, 16, Font.HELVETICA)));
        document.add(new Chunk(data.getPacient().getDocumentNumber(), new Font(Font.HELVETICA, 16)));

        Paragraph date = new Paragraph();
        date.add(new Chunk("Data e hora: ", new Font(Font.HELVETICA, 16, Font.BOLD)));
        date.add(new Chunk(data.getPageLayout().getDate(), new Font(Font.HELVETICA, 16)));


        doc.add(name);
//        doc.add(new Paragraph(" "));
        doc.add(document);
//        doc.add(new Paragraph(" "));
        doc.add(date);
    }
}
