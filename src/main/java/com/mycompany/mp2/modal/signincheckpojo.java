package com.mycompany.mp2.modal;

import java.io.Serializable;

import lombok.Data;

@Data

public class signincheckpojo implements Serializable {


    int fkey_id;
    String useraname;
    String password;

}
