package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import lombok.Data;

@Data
public class myOrderPojo {

    int id;
    String companyname;
    int price;
    String packaging;
    int quantity;
    String productname;
    String image;
    String productid;

    public static List<myOrderPojo> getList(ResultSet rs) {
        List<myOrderPojo> li = new ArrayList<>();
        li.clear();
        try {
            while (rs.next()) {
                myOrderPojo mp = new myOrderPojo();
                mp.productid=rs.getString("productid");
                mp.id = rs.getInt("id");
                mp.companyname = rs.getString("companyname");
                mp.price = rs.getInt("price");
                mp.packaging = rs.getString("packaging");
                mp.quantity = rs.getInt("quantity");
                mp.productname = rs.getString("productname");
                mp.image = rs.getString("image");
                li.add(mp);
            }
        } catch (SQLException ex) {
            Logger.getLogger(myOrderPojo.class.getName()).log(Level.SEVERE, null, ex);
        }
        return li;
    }
}
