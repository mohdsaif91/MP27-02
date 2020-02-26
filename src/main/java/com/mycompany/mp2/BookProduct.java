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

import com.mycompany.mp2.modal.cartHelperPojo;
import com.mycompany.mp2.modal.orderpojo;
import com.mycompany.mp2.modal.signuppojo;

/**
 *
 * @author saif
 */
public class BookProduct extends HttpServlet {

    LocalDateTime ldt;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int id;
    static String quantity;
    static String tablename;
    String brandname;
    static List<orderpojo> lo = new ArrayList<>();
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
    static String username;
    SendingEmail sm = new SendingEmail();
    String pay;
    static String productid;

    orderpojo us = new orderpojo();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
//        try {
        lo.clear();
        response.setContentType("text/html");
        jacksession = request.getSession();
        username = (String) jacksession.getAttribute("username");
        String cdelete = request.getParameter("cartdelete");
        if (cdelete != null) {
            try {
                int id = Integer.parseInt(request.getParameter("id"));
                String query = "delete from " + username + " where id=" + id + "";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(BookProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
            try {
                lo.clear();
                if (jacksession.getAttribute("userid") != null) {
                    System.out.println("called");
                    userId = (Integer) jacksession.getAttribute("userid");
                    userprod = getUsernameandaddress.getUserproadd(userId, username);
                } else {
                    userId = 10101;
                    userprod = getUsernameandaddress.getDefaultUser();
                }
                productid = request.getParameter("productid");
                tablename = request.getParameter("tablename");
                brandname = request.getParameter("brandname");
                quantity = request.getParameter("qun");
                id = Integer.parseInt(productid);
                String ogquantity = quantity.replaceAll(" ", "");
                us.setUserid(userId);
                us.setTablename(tablename);
                us.setBrandname(brandname);
                us.setProductid(id);
                lo.add(us);
                String query = "select imagename,brandname,productprice,packaging from " + tablename + " where  id=" + id;
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                lo = orderpojo.getList(rs, ogquantity);
                con.close();
                request.setAttribute("userinfo", userprod);
                request.setAttribute("productdetials", lo);
                System.out.println("size for test " + lo.size());
                request.setAttribute("pid", id);
                request.setAttribute("tablename", tablename);
                request.setAttribute("quantity", quantity);
                request.setAttribute("uname", username);
                request.getRequestDispatcher("Posbooking.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(BookProduct.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            if (userId == 0 && username == null) {
                response.sendRedirect("signin.jsp");
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
                    getcartpojo();
                    tablename = request.getParameter("tablename");
                    brandname = request.getParameter("brandname");
                    quantity = request.getParameter("qun");
                    productid = request.getParameter("id");
                    id = Integer.parseInt(productid);
                    updateshow(username, id);
                    String ogquantity = quantity.replaceAll(" ", "");
                    us.setUserid(userId);
                    us.setTablename(tablename);
                    us.setBrandname(brandname);
                    us.setProductid(id);
                    lo.add(us);
                    String lowercase=tablename.toLowerCase().replaceAll(" ", "");
                    String query = "select imagename,brandname,productprice,packaging from " + lowercase + " where  id=" + id;
                    System.out.println(query);
                    con = ConnectionClass.getConnection();
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    lo = orderpojo.getList(rs, ogquantity);
                    con.close();
                    request.setAttribute("userinfo", userprod);
                    request.setAttribute("productdetials", lo);
                    System.out.println("size for test " + lo.size());
                    request.setAttribute("pid", id);
                    request.setAttribute("tablename", tablename);
                    request.setAttribute("quantity", quantity);
                    request.setAttribute("uname", username);
                    request.getRequestDispatcher("Posbooking.jsp").forward(request, response);

                } catch (SQLException ex) {
                    Logger.getLogger(BookProduct.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

    public static List<cartHelperPojo> getcartpojo() {
        List<cartHelperPojo> chplist = new ArrayList<>();
        chplist.clear();
        cartHelperPojo chp = new cartHelperPojo();
        chp.setLo(lo);
        chp.setId(productid);
        chp.setQuantity(quantity);
        chp.setUsername(username);
        chp.setCompanyname(tablename);
        chplist.add(chp);
        return chplist;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String fname = request.getParameter("fName");
        String lname = request.getParameter("lname");
        String uname = request.getParameter("uName");
        String email = request.getParameter("eMail");
        String address1 = request.getParameter("aDdress1");
        String address2 = request.getParameter("aDdress2");
        String country = request.getParameter("cOuntry");
        String state = request.getParameter("sTate");
        String zipcode = request.getParameter("zIpcode");
        String rcode = request.getParameter("rCode");
        String genericname = request.getParameter("gEnericname");
        String productprice = request.getParameter("pPrice");
        System.out.println(fname + "" + lname + "" + uname + "" + email + "" + address1 + "" + address2 + "" + country + "" + state + "" + zipcode + "" + rcode
                + "" + genericname + "" + productprice);
    }

    private void updateshow(String username, int id) {
        try {
            String query = "update " + username + " set show='order' where id=" + id + "";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(BookProduct.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
