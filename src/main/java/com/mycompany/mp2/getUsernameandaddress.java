package com.mycompany.mp2;

import java.util.ArrayList;
import java.util.List;

import com.mycompany.mp2.modal.signuppojo;

/*
 * 
 * CopyRight cosmos
 */
/**
 * @author saif
 */
public class getUsernameandaddress {

    static List<signuppojo> all = new ArrayList<>();

    public static List<signuppojo> getUserproadd(int userId, String username) {
//        try {
//            String query = "select address1,address2,city,emailid,firstname,lastname,mobilenum,state from signuppojo where id=" + userId + "";
//            System.out.println(query);
//            con = ConnectionClass.getConnection();
//            ps = con.prepareStatement(query);
//            rs = ps.executeQuery();
//            all.clear();
//            while (rs.next()) {
//                signuppojo sp = new signuppojo();
//                sp.firstname = rs.getString("firstname");
//                sp.lastname = rs.getString("lastname");
//                all.add(sp);
//            }
//
//        } catch (SQLException ex) {
//            Logger.getLogger(getUsernameandaddress.class.getName()).log(Level.SEVERE, null, ex);
//        }
        return all;
    }

    public static List<signuppojo> getDefaultUser() {
        List<signuppojo> listSign = new ArrayList<>();
        signuppojo sp = new signuppojo();
        sp.firstname = "";
        sp.lastname = "";
        listSign.add(sp);
        return listSign;
    }

}
