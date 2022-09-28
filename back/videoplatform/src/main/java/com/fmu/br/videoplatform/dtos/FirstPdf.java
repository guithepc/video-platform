package com.fmu.br.videoplatform.dtos;

import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

public class FirstPdf {

    public FirstPdf(String frase){

        Document doc = new Document();

        try {
            PdfWriter.getInstance(doc, new FileOutputStream("FirstPdf.pdf"));
            doc.open();

            Paragraph paragraph = new Paragraph(frase);

            doc.add(paragraph);




        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }

        doc.close();
    }
}
