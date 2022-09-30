package com.fmu.br.videoplatform.dtos;

import com.fmu.br.videoplatform.dtos.constants.ConstantUtils;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;

@Getter
@Setter
public class PageLayout {

    private String prescription = ConstantUtils.RECEITUARIO;
    private String date;
}
