/*
 * 
 * CopyRight cosmos
 */
package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * @author saif
 */
@Data
public class subcatepojo {

    int id;
    String genericname;
    String imagename;
    String medeidescription;
    String productprice;
    String packagig;

    public static List<subcatepojo> getsublist(ResultSet rs) throws SQLException {
        List<subcatepojo> li = new ArrayList<>();
        while (rs.next()) {
            subcatepojo scp = new subcatepojo();
            scp.id = rs.getInt("id");
            scp.genericname = rs.getString("genericname");
            scp.imagename = rs.getString("imagename");
            scp.medeidescription = rs.getString("mdeidescription");
            scp.productprice = rs.getString("productprice");
            scp.packagig = rs.getString("packaging");
            li.add(scp);
        }
        for (subcatepojo spc : li) {
            System.out.println(spc.id + " " + spc.genericname);
        }
        return li;
    }

}
