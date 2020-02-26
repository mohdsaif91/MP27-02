/*
 * 
 * CopyRight cosmos
 */
package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import lombok.Data;

/**
 * @author saif
 */
@Data
public class subcategorypojo {

    int id;
    String brandname;
    String imagename;
    String companyname;
    String description;
    String productprice;
    String packaging;
    String genericname;

    public static List<subcategorypojo> getList(ResultSet rs) throws SQLException {
        List<subcategorypojo> ogli = new ArrayList<>();
        while (rs.next()) {
            subcategorypojo su = new subcategorypojo();
            su.id = rs.getInt("id");
            su.brandname = rs.getString("brandname");
            su.imagename = rs.getString("imagename");
            ogli.add(su);
        }
        return ogli;
    }

    public static List<subcategorypojo> getAllList(ResultSet rs) {
        List<subcategorypojo> oglis = new ArrayList<>();
        try {
            while (rs.next()) {
                subcategorypojo su = new subcategorypojo();
                su.id = rs.getInt("id");
                su.brandname = rs.getString("brandname");
                su.imagename = rs.getString("imagename");
//                su.companyname = rs.getString("company");
//                su.genericname = rs.getString("genericname");
//                su.imagename = rs.getString("imagename");
//                su.description = rs.getString("mdeidescription");
//                su.productprice = rs.getString("productprice");
//                su.packaging = rs.getString("packaging");
                oglis.add(su);
            }
        } catch (SQLException ex) {
            Logger.getLogger(subcategorypojo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oglis;
    }
    public static List<subcategorypojo> getAllListforproduct(ResultSet rs) {
        List<subcategorypojo> oglis = new ArrayList<>();
        try {
            while (rs.next()) {
                subcategorypojo su = new subcategorypojo();
                su.id = rs.getInt("id");
                su.brandname = rs.getString("brandname");
                su.imagename = rs.getString("imagename");
                su.companyname = rs.getString("company");
                su.genericname = rs.getString("genericname");
                su.imagename = rs.getString("imagename");
                su.description = rs.getString("mdeidescription");
                su.productprice = rs.getString("productprice");
                su.packaging = rs.getString("packaging");
                oglis.add(su);
            }
        } catch (SQLException ex) {
            Logger.getLogger(subcategorypojo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return oglis;
    }
}
