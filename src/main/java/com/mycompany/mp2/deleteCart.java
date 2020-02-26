package com.mycompany.mp2;

/*
 * 
 * CopyRight cosmos
 */

import com.mycompany.mp2.modal.Cartpojo;
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

/**
 *
 * @author saif
 */
public class deleteCart extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    HttpSession jacksession;
    String username;
    List<Cartpojo> clist2 = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        jacksession = request.getSession();
        username = (String) jacksession.getAttribute("username");
        if (username == null) {
            response.sendRedirect("signin.jsp");
        } else {
            try {
                String id = request.getParameter("id");
                int ogid = Integer.parseInt(id);
                System.out.println(id + " id id ");
                String query = "delete from " + username + " where id=" + ogid + "";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
                Thread th = new Thread(() -> {
                    clist2 = getList();
                });
                th.start();
                request.setAttribute("catrValue", clist2);
                System.out.println("Size " + clist2.size());
                request.getRequestDispatcher("CartShow.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(deleteCart.class.getName()).log(Level.SEVERE, null, ex);
            }

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private List<Cartpojo> getList() {
        List<Cartpojo> clist = new ArrayList<>();
        try {
            String query = "select id,image,productname,price,quantity,productid,companyname from " + username + " where show='cart'";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            clist = Cartpojo.getCart(rs);
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(deleteCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return clist;
    }

}
