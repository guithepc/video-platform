package com.fmu.uhealthy.dto;

import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;

@Getter
@Setter
public class RecipePdf {

    private PageLayout pageLayout;
    private Doctor doctor;
    private Pacient pacient;
    private ArrayList<Medicines> itemList;
    private Clinic clinic;


}
