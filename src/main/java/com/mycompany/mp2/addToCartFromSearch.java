package com.mycompany.mp2;

/*
 * 

 * CopyRight cosmos
 */
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
import javax.servlet.http.HttpSession;

/**
 *
 * @author saif
 */
public class addToCartFromSearch extends HttpServlet {

    HttpSession session;
    String ab = "order";
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String username;
    int id;
    String imagename;
    String productprice;
    String packaging;
    String brandname;
    String tablename;
    String quan;
    String og;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            session = request.getSession();
            username = (String) session.getAttribute("username");
            tablename = request.getParameter("tablename");
            og = tablename.replaceAll(" ", "");
            brandname = request.getParameter("brandname");
            quan = request.getParameter("qun");
            System.out.println(tablename + " " + brandname + " " + quan);
            String query = "select id,imagename,productprice,packaging from " + og + " where brandname='" + brandname + "'";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            con.close();
            while (rs.next()) {
                id = rs.getInt("id");
                imagename = rs.getString("imagename");
                productprice = rs.getString("productprice");
                packaging = rs.getString("packaging");
            }

        } catch (SQLException ex) {
            Logger.getLogger(addToCartFromSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
        Thread th = new Thread(() -> {
            insertinto(id, imagename, productprice, packaging, username, tablename, brandname, quan);
        });
        th.start();
        response.sendRedirect("homeController");
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

    private void insertinto(int id, String imagename, String productprice, String packaging, String username, String tablename, String brandname, String quan) {
        try {
            String query = "insert into " + username + "(productid,companyname,price,packaging,quantity,productname,show,image)"
                    + "values(" + id + ",'" + tablename + "','" + productprice + "','" + packaging + "','" + quan + "','" + brandname + "','cart','" + imagename + "')";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(addToCartFromSearch.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
