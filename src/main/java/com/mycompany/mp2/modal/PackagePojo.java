package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import lombok.Data;

/*
 * 
 * CopyRight cosmos
 */
/**
 * @author saif
 */
@Data

public class PackagePojo {

//    -------------------------------------------------

    public String id;
    String productid;
    String productprice;
    String quantity;
    String imagename;
    String companyname;
    String packaging;
    String brandname;
//    public String userid;
    public String genericname;
    public String firstname;
    public String lastname;
    public String username;
    public String address1;
    public String address2;
    public Date yyyy_mm_dd;
    public String city;
    public String state;
    public String country;
    public String paymentdoen;
//    ---------------------------------------------------
    String cardHoldeName;
    String cardNumber;
    short cvvNumber;
    String expiryDate;
    String emailid;
    String mobilenum;
    String paymentoption;
    String zipcode;

    public static List<PackagePojo> getAllColumn(ResultSet rs) {
        List<PackagePojo> admiList = new ArrayList<>();
        admiList.clear();
        try {
            while (rs.next()) {
                PackagePojo ad = new PackagePojo();
                ad.id = rs.getString("id");
                ad.address1 = rs.getString("address1");
                ad.address2 = rs.getString("address2");
                ad.brandname = rs.getString("brandname");
                ad.city = rs.getString("city");
                ad.companyname = rs.getString("companyname");
                ad.country = rs.getString("country");
                ad.firstname = rs.getString("firstname");
                ad.genericname = rs.getString("genericname");
                ad.imagename = rs.getString("imagename");
                ad.lastname = rs.getString("lastname");
                ad.mobilenum = rs.getString("mobilenum");
                ad.packaging = rs.getString("packaging");
//                ad.paymade = rs.getDate("paymade");
                ad.paymentdoen = rs.getString("paymentdoen");
                ad.productid = rs.getString("productid");
                ad.productprice = rs.getString("productprice");
                ad.quantity = rs.getString("quantity");
                ad.state = rs.getString("state");
                ad.username = rs.getString("username");
                ad.yyyy_mm_dd = rs.getDate("yyyy_mm_dd");
                ad.zipcode = rs.getString("zipcode");
                System.out.println(ad.zipcode+" 123456789");
                admiList.add(ad);
            }
        } catch (SQLException ex) {
            Logger.getLogger(adminordertable.class.getName()).log(Level.SEVERE, null, ex);
        }
        return admiList;
    }
}
