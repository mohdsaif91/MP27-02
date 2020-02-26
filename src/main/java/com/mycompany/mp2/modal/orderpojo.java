package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import lombok.Data;

@Data
public class orderpojo {

    int pid;
    int productid;
    int userid;
    String tablename;
    String brandname;
    String genericname;
    String imagename;
    String companyname;
    String Productprice;
    String packaging;
    String quantity;
    int zipcode;
    String country;
    Double total;

    public static List<orderpojo> getList(ResultSet rs, String quantity) throws SQLException {
        int quan = Integer.parseInt(quantity);
        List<orderpojo> orderList = new ArrayList<>();
        orderList.clear();
        while (rs.next()) {
            orderpojo op = new orderpojo();
            op.imagename = rs.getString("imagename");
            op.brandname = rs.getString("brandname");
            op.Productprice = rs.getString("productprice");
            op.packaging = rs.getString("packaging");
            op.total = Double.parseDouble(rs.getString("productprice")) * quan;
            orderList.add(op);
        }
        orderList.forEach(s -> {
            System.out.println(s.getGenericname());
            System.out.println(s.getProductprice());
            System.out.println(s.getProductprice());
        });
        return orderList;
    }
}
