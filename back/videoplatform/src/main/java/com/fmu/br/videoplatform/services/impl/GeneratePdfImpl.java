package com.fmu.br.videoplatform.services.impl;

import com.fmu.br.videoplatform.services.GeneratePdf;
import com.lowagie.text.Document;
import com.lowagie.text.Paragraph;
import com.lowagie.text.pdf.PdfWriter;
import org.springframework.stereotype.Service;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;

@Service
public class GeneratePdfImpl implements GeneratePdf {
    @Override
    public void generate(String frase) {
        Document doc = new Document();

        try {
            PdfWriter.getInstance(doc, new FileOutputStream("C:\\Repositories\\video-platform\\back\\FirstDoccdf.pdf"));
            doc.open();

            Paragraph paragraph = new Paragraph(frase);

            doc.add(paragraph);




        } catch (FileNotFoundException e) {
            throw new RuntimeException(e);
        }
        doc.close();
    }
}
