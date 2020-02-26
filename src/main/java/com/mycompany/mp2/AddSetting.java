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

/**
 *
 * @author saif
 */
public class AddSetting extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String four = request.getParameter("four");
        if (four.equals("setemail")) {
            try {
                String email = request.getParameter("email");
                String password = request.getParameter("password");
                String query = "update \"emailTable\" set email='" + email + "',password='" + password + "'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
                System.out.println(email + " " + password);
                response.setContentType("text/plain");
                System.out.println("last");
                response.getWriter().write("Updated");
            } catch (SQLException ex) {
                Logger.getLogger(AddSetting.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (four.equals("setdays")) {
            try {
                String days = request.getParameter("days");
                String query = "update daystable set days='" + days + "'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
                response.setContentType("text/plain");
                System.out.println("last");
                response.getWriter().write("Updated");
            } catch (SQLException ex) {
                Logger.getLogger(AddSetting.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (four.equals("setpassword")) {
            try {
                String pString = request.getParameter("password");
                String query = "select username from admintablecredentials where password='" + pString + "'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                if (rs.next()) {
                    con.close();
                    response.setContentType("text/plain");
                    response.getWriter().write("yes");
                } else {
                    con.close();
                    response.setContentType("text/plain");
                    response.getWriter().write("no");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AddSetting.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (four.equals("setPassword")) {
            try {
                String username = request.getParameter("user");
                String pString = request.getParameter("pass");
                String query = "update admintablecredentials set username='" + username + "',password='" + pString + "'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                int i = ps.executeUpdate();
                if (i == 0) {
                    con.close();
                    response.setContentType("text/plain");
                    response.getWriter().write("no");
                } else {
                    con.close();
                    response.setContentType("text/plain");
                    response.getWriter().write("yes");
                }
            } catch (SQLException ex) {
                Logger.getLogger(AddSetting.class.getName()).log(Level.SEVERE, null, ex);
            }
        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
