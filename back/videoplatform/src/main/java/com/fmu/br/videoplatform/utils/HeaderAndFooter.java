package com.fmu.br.videoplatform.utils;

import com.lowagie.text.Document;
import com.lowagie.text.Element;
import com.lowagie.text.Font;
import com.lowagie.text.Phrase;
import com.lowagie.text.pdf.ColumnText;
import com.lowagie.text.pdf.PdfContentByte;
import com.lowagie.text.pdf.PdfPageEventHelper;
import com.lowagie.text.pdf.PdfWriter;

import java.awt.*;

public class HeaderAndFooter extends PdfPageEventHelper {

    private String name = "";


    protected Phrase footer;
    protected Phrase header;

    /*
     * Font for header and footer part.
     */
    private static Font headerFont = new Font(Font.COURIER, 9,
            Font.NORMAL, Color.blue);

    private static Font footerFont = new Font(Font.TIMES_ROMAN, 9,
            Font.BOLD,Color.blue);


    /*
     * constructor
     */
    public HeaderAndFooter(String name) {
        super();

        this.name = name;


        header = new Phrase("***** Header *****");
        footer = new Phrase("**** Footer ****");
    }


    @Override
    public void onEndPage(PdfWriter writer, Document document) {

        PdfContentByte cb = writer.getDirectContent();

        //header content
        String headerContent = "Name: " +name;

        //header content
        String footerContent = headerContent;
        /*
         * Header
         */
        ColumnText.showTextAligned(cb, Element.ALIGN_LEFT, new Phrase(headerContent,headerFont),
                document.leftMargin() - 1, document.top() + 30, 0);

        /*
         * Foooter
         */
        ColumnText.showTextAligned(cb, Element.ALIGN_RIGHT, new Phrase(String.format(" %d ",
                        writer.getPageNumber()),footerFont),
                document.right() - 2 , document.bottom() - 20, 0);

    }

}


