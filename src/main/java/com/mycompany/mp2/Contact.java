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
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saif
 */
public class Contact extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String ans = "";
    List<String> namelist = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String uname = request.getParameter("uname");
            String query = "select useraname from usernameandpassword";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                String usname = rs.getString("useraname");
                namelist.add(usname);
            }
            namelist.forEach(s -> {
                System.out.println(s);
                if (s.equals(uname)) {
                    ans = "yes";
                } else if (s == null) {
                    ans = "no";
                } else {
                    ans = "no";
                }
            });
            response.setContentType("text/plain");
            response.getWriter().write(ans);
        } catch (Exception e) {
            // TODO: handle exception
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String fname = request.getParameter("c_fname");
            String lastname = request.getParameter("c_lname");
            String email = request.getParameter("c_email");
            String subject = request.getParameter("c_subject");
            String username = request.getParameter("c_username");
            String message = request.getParameter("c_message");
            String query = "insert into contactpojo2(email,firstname,lastname,message,read,subject,username)values('"
                    + email + "','" + fname + "','" + lastname + "','" + message + "','no','" + subject + "','"
                    + username + "')";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
            System.out.println("doen");
            request.getRequestDispatcher("contact.jsp").forward(request, response);

        } catch (IOException | SQLException e) {
            // TODO: handle exception
            System.out.println(e);
        }
    }

}
