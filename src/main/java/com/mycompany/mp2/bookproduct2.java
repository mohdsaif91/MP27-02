package com.mycompany.mp2;

/*
 * 

 * CopyRight cosmos
 */
import com.mycompany.mp2.modal.orderpojo;
import com.mycompany.mp2.modal.signuppojo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
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
public class bookproduct2 extends HttpServlet {

    LocalDateTime ldt;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int id;
    String quantity;
    String tablename;
    String brandname;
    List<orderpojo> lo = new ArrayList<>();
    int Ogproductprice;
    String packaging;
    String imagename;
    int userId = 0;
    public String firstname;
    public String lastname;
    public String address1;
    public String address2;
    public String mobilenum;
    public String emailid;
    public Date dob;
    public String city;
    public String state;
    List<signuppojo> userprod;
    Calendar cal = Calendar.getInstance();
    String deliv = "NO";
    String show = "Order";
    HttpSession jacksession;
    String username;
    SendingEmail sm = new SendingEmail();
    String pay;

    orderpojo us = new orderpojo();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        lo.clear();
        response.setContentType("text/html");
        jacksession = request.getSession();
        username = (String) jacksession.getAttribute("username");
        if (userId == 0 && username == null) {
            response.sendRedirect("signup.jsp");
        } else {
            try {
                lo.clear();
                if (jacksession.getAttribute("userid") != null) {
                    userId = (Integer) jacksession.getAttribute("userid");
                    userprod = getUsernameandaddress.getUserproadd(userId, username);
                } else {
                    userId = 10101;
                    userprod = getUsernameandaddress.getDefaultUser();
                }
                tablename = request.getParameter("tablename");
                String og = tablename.replaceAll(" ", "");
                brandname = request.getParameter("brandname");
                quantity = request.getParameter("qun");
                id = getid(og, brandname);
                System.out.println(id + " this is matter");
                us.setUserid(userId);
                us.setTablename(og);
                us.setBrandname(brandname);
                us.setProductid(id);
                lo.add(us);
                String query = "select imagename,brandname,productprice,packaging from " + og + " where  id=" + id;
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                lo = orderpojo.getList(rs, quantity);
                request.setAttribute("userinfo", userprod);
                request.setAttribute("productdetials", lo);
                System.out.println("size for test " + lo.size());
                request.setAttribute("pid", id);
                request.setAttribute("tablename", tablename);
                request.setAttribute("quantity", quantity);
                con.close();
                request.getRequestDispatcher("Posbooking.jsp").forward(request, response);

            } catch (SQLException ex) {
                Logger.getLogger(bookproduct2.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private int getid(String tablename, String brandname) {
        try {
            String query = "select id from " + tablename + "  where brandname='" + brandname + "'";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                id = rs.getInt("id");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(bookproduct2.class.getName()).log(Level.SEVERE, null, ex);
        }
        System.out.println(id + " inside the method");
        return id;
    }

}
