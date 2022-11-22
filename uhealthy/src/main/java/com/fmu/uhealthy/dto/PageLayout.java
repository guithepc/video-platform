package com.fmu.uhealthy.dto;

import com.fmu.uhealthy.dto.constants.ConstantUtils;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class PageLayout {

    private String prescription = ConstantUtils.RECEITUARIO;
    private String date;
}
