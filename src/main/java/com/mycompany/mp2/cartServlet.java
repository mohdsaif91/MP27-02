package com.mycompany.mp2;

/*
 * 
 * CopyRight cosmos
 */
/**
 *
 * @author saif
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

public class cartServlet extends HttpServlet {

    /*
 * 
 * CopyRight cosmos
     */
    /**
     *
     * @author saif
     */
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String tablename = "";
    String brandname = "";
    String quantity = "";
    HttpSession jacksession;
    String username = "";
    String id = "";
    String imagename;
    String productprice;
    String packaging;
    String genericname;
    String medidescription;
    Cartpojo cp = new Cartpojo();
    List<Cartpojo> clist = new ArrayList<>();

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
                tablename = request.getParameter("tablename");
                cp.setTablename(tablename);
                brandname = request.getParameter("brandname");
                cp.setBrandname(brandname);
                quantity = request.getParameter("qun");
                cp.setQuantity(quantity);
                id = request.getParameter("id");
                System.out.println(tablename + "" + brandname + "" + id + "" + quantity);
                int og = Integer.parseInt(id);
                cp.setId(og);
                String query = "select genericname,imagename,mdeidescription,productprice,packaging from " + tablename + " where id=" + og + "";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    imagename = rs.getString("imagename");
                    cp.setImagename(imagename);
                    productprice = rs.getString("productprice");
                    cp.setProductprice(productprice);
                    packaging = rs.getString("packaging");
                    cp.setPackagig(packaging);
                    genericname = rs.getString("genericname");
                    cp.setGenericname(genericname);
                    medidescription = rs.getString("mdeidescription");
                    cp.setMedeidescription(medidescription);
                }
                con.close();
                clist.add(cp);
                Thread th = new Thread(() -> {
                    insert(tablename, brandname, quantity, id, imagename, productprice, packaging, username);
                });
                th.start();
                request.setAttribute("brandname", brandname);
                request.setAttribute("tabename", tablename);
                request.setAttribute("productvalue", clist);
                System.out.println("The size ofthe LLLIst " + clist.size());
                request.setAttribute("updatemessage", "Your Product is Added to Cart.");
                request.getRequestDispatcher("shopsingle2.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(cartServlet.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

    private void insert(String tablename, String brandname, String quantity, String id, String imagename,
            String productprice, String packaging, String username) {
        try {
            String query = "insert into " + username + "(productid,companyname,price,packaging,quantity,productname,show,image)"
                    + "values('" + id + "','" + tablename + "','" + productprice + "','" + packaging + "','" + quantity + "','" + brandname + "','cart','" + imagename + "')";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(cartServlet.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
