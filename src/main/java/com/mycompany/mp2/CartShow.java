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
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mycompany.mp2.modal.Cartpojo;

/**
 *
 * @author saif
 */
public class CartShow extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String tablename = "";
    String brandname = "";
    String quantity = "";
    HttpSession jacksession;
    String username = "";
    static List<Cartpojo> clist = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        clist.clear();
        jacksession = request.getSession();
        username = (String) jacksession.getAttribute("username");
        if (username == null) {
            response.sendRedirect("signin.jsp");
        } else {
            try {
                String query = "select id,image,productname,price,quantity,productid,companyname from " + username
                        + " where show='cart'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                clist = Cartpojo.getCart(rs);
                con.close();
                request.setAttribute("catrValue", clist);
                request.getRequestDispatcher("CartShow.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(CartShow.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
