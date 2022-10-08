package com.fmu.br.videoplatform.services.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.ObjectWriter;
import com.fmu.br.videoplatform.dtos.*;
import com.fmu.br.videoplatform.services.GeneratePdf;
import com.lowagie.text.*;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;

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
            recipe.getItemList().get(0).setQuantity("");
            recipe.getItemList().get(0).setSubTitle("");

            recipe.getItemList().get(1).setName("");
            recipe.getItemList().get(1).setDescription("");
            recipe.getItemList().get(1).setQuantity("");
            recipe.getItemList().get(1).setSubTitle("");

            ObjectWriter ow = new ObjectMapper().writer().withDefaultPrettyPrinter();
            String json = ow.writeValueAsString(recipe);

            System.out.print(json);


            generateHeader(data);
            generateBody(data);
            generateFoot(data);



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

        Paragraph name = new Paragraph();
        name.add(new Chunk("Nome: ", new Font(Font.BOLD, 16, Font.HELVETICA)));
        name.add(new Chunk(data.getPacient().getName().toUpperCase(), new Font(Font.HELVETICA, 16)));

        Paragraph document = new Paragraph();
        document.add(new Chunk("CPF: ", new Font(Font.BOLD, 16, Font.HELVETICA)));
        document.add(new Chunk(data.getPacient().getDocumentNumber(), new Font(Font.HELVETICA, 16)));

        Paragraph date = new Paragraph();
        date.add(new Chunk("Data e hora: ", new Font(Font.HELVETICA, 16, Font.BOLD)));

        SimpleDateFormat formatter= new SimpleDateFormat("dd/MM/yyyy 'às' HH:mm:ss");
        Date currentDate = new Date(System.currentTimeMillis());

        date.add(new Chunk(formatter.format(currentDate ), new Font(Font.HELVETICA, 16)));


        doc.add(name);
//        doc.add(new Paragraph(" "));
        doc.add(document);
//        doc.add(new Paragraph(" "));
        doc.add(date);

        doc.add(new Paragraph(" "));
    }

    public void generateFoot(RecipePdf data) {
        Paragraph feet = new Paragraph();
        Paragraph feet2 = new Paragraph();

        feet.add(new Chunk(data.getClinic().getName(), new Font(Font.BOLD, 12, Font.HELVETICA)));
        feet2.add(new Chunk(data.getClinic().getAddress(), new Font(Font.HELVETICA, 10)));
        doc.add(feet);
        doc.add(feet2);

    }
    public void generateBody(RecipePdf data){

        for (Medicines med : data.getItemList()) {
            int i = 1;
            Paragraph paragraph = new Paragraph();
            Paragraph paragraph2 = new Paragraph();
            Paragraph paragraph3 = new Paragraph();
            paragraph.add(new Chunk(med.getName(), new Font(Font.BOLD, 16, Font.HELVETICA)));
            i++;
//            paragraph2.add(new Chunk(med.getSubTitle() + med.getDescription() + String.valueOf(med.getQuantity()), new Font(Font.HELVETICA,10)));
            paragraph2.add(new Chunk(med.getDescription(), new Font(Font.HELVETICA, 12)));
            paragraph3.add(new Chunk(med.getQuantity(), new Font( Font.HELVETICA, 10)));
            doc.add(paragraph);
            doc.add(paragraph2);
            doc.add(paragraph3);
            doc.add(new Paragraph(" "));

        }
    }
}
