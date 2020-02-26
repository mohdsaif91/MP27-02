/*
 * 
 * CopyRight cosmos
 */
package com.mycompany.mp2.modal;

import java.util.Date;
import lombok.Data;

/**
 * @author saif
 */
@Data
public class AllDataPojoClass {

    String id;
    String productid;
    String productprice;
    String quantity;
    String imagename;
    String companyname;
    String packaging;
    String brandname;
    String genericname;
    public String firstname;
    public String lastname;
    public String username;
    public String address1;
    public String address2;
    public String mobilenum;
    public Date yyyy_mm_dd;
    public String city;
    public String state;
    public String country;
    String cardHoldeName;
    String cardNumber;
    short cvvNumber;
    String expiryDate;
    String emailid;
    String paymentoption;
    String zipcode;
}
