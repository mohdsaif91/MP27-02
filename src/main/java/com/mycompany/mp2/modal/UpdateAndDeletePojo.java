/*
 * 
 * CopyRight cosmos
 */
package com.mycompany.mp2.modal;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;

/**
 * @author saif
 */
@Data
public class UpdateAndDeletePojo {

    List<MainCompany> catli = new ArrayList<>();
    List<subcategorypojo> subli = new ArrayList<>();
}
