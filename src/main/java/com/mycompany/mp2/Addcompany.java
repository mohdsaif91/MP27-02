package com.mycompany.mp2;


/*
 * 
 * CopyRight cosmos
 */
import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import com.mycompany.mp2.modal.MainCompany;
import javax.annotation.processing.FilerException;

/**
 *
 * @author saif
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, maxFileSize = 1024 * 1024 * 10, maxRequestSize = 1024 * 1024 * 50)
@WebServlet(urlPatterns = {"/Addcompany"})
public class Addcompany extends HttpServlet {

    String names;
    private static final String SAVE_DIR = "CompanyName";
    private static final String SAVE_DIR2 = "medicineimage";
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String url = "jdbc:postgresql://localhost/sherifwebdatabase";
    String user = "postgres";
    String password = "9167605650";
    String brandname;
    String genericname;
    String productdescription;
    String company;
    Part part;
    String packaging;
    String productprice;
    String partmediname;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String query = "select companyname from maincompany";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            List<MainCompany> li = MainCompany.getCate2(rs);
            request.setAttribute("companynames", li);
            con.close();
            request.getRequestDispatcher("Addcompany.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(Addcompany.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        if (request.getParameter("addcompanyproduct") != null) {
            try {
                response.setContentType("text/html;charset+UTF-8");
                brandname = request.getParameter("brandname");
                genericname = request.getParameter("genericname");
                part = request.getPart("companyImagename");
                packaging = request.getParameter("packing");
                productprice = request.getParameter("productprice");
                productdescription = request.getParameter("productdescription");
                company = request.getParameter("selectcompanyname");
                System.out.println("companyname " + company);
                String savePath = "web/WEB-INF/image/" + File.separator + SAVE_DIR2;
                partmediname = getImmagename(part);
                part.write(savePath + File.separator + partmediname);
                String query = " INSERT INTO public.producttable(brandname, company, genericname, imagename, packaging, productdescription,"
                        + " productprice)VALUES ('" + brandname + "','" + company + "', '" + genericname + "',"
                        + " '" + partmediname + "','" + packaging + "','" + productdescription + "', '" + productprice + "') ";
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.execute();
                con.close();
                insertintotable(company, productdescription, productprice, brandname, genericname, partmediname, packaging);
                response.sendRedirect("Addcompany");
            } catch (SQLException ex) {
                Logger.getLogger(Addcompany.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                response.setContentType("text/html;charset+UTF-8");
                String companyName = request.getParameter("companyname");
                Part part2 = request.getPart("companyImage");
                String partname = getImmagename(part2);
                String rootPath = System.getProperty("catalina.home");

                System.out.println(rootPath + " rootPath");
                String savePath = "web/WEB-INF/image/" + File.separator + SAVE_DIR;
                File fi = new File(savePath);
                System.out.println("Part name:-" + partname);
                try {
                    part2.write(savePath + File.separator + partname);
                    boolean be = fi.exists();
                    System.out.println("status-------------->" + be);
                } catch (FilerException fe) {
                    System.out.println("ye hai " + fe);
                }
                String query = " INSERT INTO public.maincompany(companyimagename, companyname)"
                        + "    VALUES ('" + partname + "','" + companyName + "'); ";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.execute();
                con.close();
                createtablecompany(companyName);
                response.sendRedirect("Addcompany.jsp");
            } catch (SQLException ex) {
                Logger.getLogger(Addcompany.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    private String getImmagename(Part part) {
        String contentDisp = null;
        contentDisp = part.getHeader("content-disposition");
        String[] items = contentDisp.split(";");
        for (String s : items) {
            if (s.trim().startsWith("filename")) {
                return s.substring(s.indexOf("=") + 2, s.length() - 1);
            }
        }
        return "";
    }

    private void createtablecompany(String companyName) {
        try {
            String ogname = companyName.replaceAll(" ", "");
            String query = "create table " + ogname + "(id serial,company text,genericname text,imagename text,brandname text,mdeidescription text, productprice text,packaging text)";
            System.out.println(query);
            Class.forName("org.postgresql.Driver");
            con = DriverManager.getConnection(url, user, password);
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Addcompany.class.getName()).log(Level.SEVERE, null, ex);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(Addcompany.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void insertintotable(String company, String productdescription, String productprice, String brandname, String genericname, String partmediname, String packaging) {
        try {
            String ogname = company.replaceAll(" ", "");
            String query = "insert into " + ogname + "(company,genericname,imagename,brandname,mdeidescription,productprice,packaging) values('" + company + "','" + genericname + "','" + partmediname + "','" + brandname + "','" + productdescription + "','" + productprice + "','" + packaging + "')";
            System.out.println(query);
            con = DriverManager.getConnection(url, user, password);
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(Addcompany.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
