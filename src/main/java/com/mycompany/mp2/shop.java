package com.mycompany.mp2;

import com.mycompany.mp2.modal.subcatepojo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saif
 */
public class shop extends HttpServlet {

    Connection con;
    ResultSet rs;
    PreparedStatement ps;
    String userId;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String brandname = request.getParameter("brandname");
            String tabname = request.getParameter("tabname");
            String ogbrandname = brandname.trim();
            String ogtabname = tabname.trim();
            System.out.println(brandname + " " + tabname);
            String ogstring = tabname.replaceAll(" ", "");
            String query = "select id,genericname,imagename,mdeidescription,productprice,packaging from " + ogstring
                    + " where company='" + ogtabname + "' and brandname='" + ogbrandname + "'";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            request.setAttribute("brandname", brandname);
            request.setAttribute("tabename", tabname);
            request.setAttribute("productvalue", subcatepojo.getsublist(rs));
            con.close();
            request.getRequestDispatcher("shopsingle2.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(shop.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
