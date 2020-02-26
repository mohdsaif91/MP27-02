package com.mycompany.mp2;

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
public class BuyNow extends HttpServlet {

    String username;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HttpSession session;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String firstname = request.getParameter("firstname");
            String lastname = request.getParameter("lastname");
            System.out.println(firstname + " " + lastname);
            username = request.getParameter("username");
            session = request.getSession();
            session.setAttribute("username", username);
            String password = request.getParameter("passsword");
            String query = "insert into signuppojo(firstname,lastname)values('" + firstname + "','" + lastname + "')";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.execute();
            con.close();

            // second table username and password
            String query2 = "insert into usernameadnpassword2(password,username)values('" + password + "','" + username + "')";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query2);
            ps.execute();
            con.close();
        } catch (Exception e) {
            // TODO: handle exception
        }

        // ordertabe
        createOrdertable(username);
        response.sendRedirect("homeController");

    }

    private void createOrdertable(String tbname) {
        try {
            String query = "create table " + tbname
                    + "(id serial,productid text,companyname text,price text,packaging text,"
                    + "quantity integer,productname text,show text,image text)";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(BuyNow.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
