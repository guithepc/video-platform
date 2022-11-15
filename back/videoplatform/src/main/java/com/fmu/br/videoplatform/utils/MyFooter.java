package com.fmu.br.videoplatform.utils;

import com.fmu.br.videoplatform.dtos.RecipePdf;
import com.itextpdf.text.Document;
import com.itextpdf.text.Element;
import com.itextpdf.text.Phrase;
import com.itextpdf.text.pdf.ColumnText;
import com.itextpdf.text.pdf.PdfContentByte;
import com.itextpdf.text.pdf.PdfPageEventHelper;
import com.itextpdf.text.pdf.PdfWriter;
import com.lowagie.text.Chunk;
import com.lowagie.text.Font;


public class MyFooter extends PdfPageEventHelper {
    Font ffont = new Font(Font.BOLD, 5, Font.ITALIC);

    public MyFooter() {
    }

    public void onEndPage(PdfWriter writer, Document document, RecipePdf data) {
        PdfContentByte cb = writer.getDirectContent();
        Phrase footer = new Phrase(String.valueOf(new Chunk("zaza", new com.lowagie.text.Font(com.lowagie.text.Font.BOLD, 12, com.lowagie.text.Font.HELVETICA))));
//        Phrase footer = new Phrase("this is a footer", ffont);
//        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,
//                header,
//                (document.right() - document.left()) / 2 + document.leftMargin(),
//                document.top() + 10, 0);
        ColumnText.showTextAligned(cb, Element.ALIGN_CENTER,
                footer,
                (document.right() - document.left()) / 2 + document.leftMargin(),
                document.bottom() - 10, 0);
    }
}