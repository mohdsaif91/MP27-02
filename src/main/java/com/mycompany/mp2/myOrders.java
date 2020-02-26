package com.mycompany.mp2;

/*
 * 

 * CopyRight cosmos
 */

import java.io.File;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.mycompany.mp2.modal.myOrderPojo;

/**
 *
 * @author saif
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
public class myOrders extends HttpServlet {

    HttpSession session;
    String ab = "order";
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    String username;
    private static final String SAVE_DIR2 = "CompanyName";

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String deleteprroduct = request.getParameter("deletecate");
            if (deleteprroduct == null) {
                session = request.getSession();
                username = (String) session.getAttribute("username");
                if (username == null) {
//                session.setAttribute("abcd", "You Haven't Signed In ! ");
                    response.sendRedirect("signin.jsp");
                } else {
                    System.out.println(username);
                    String query = "select productid,id,companyname,price,packaging,quantity,image,productname from "
                            + username + " where show='" + ab + "'";
                    System.out.println(query);
                    con = ConnectionClass.getConnection();
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    request.setAttribute("allvalue", myOrderPojo.getList(rs));
                    con.close();
                    request.getRequestDispatcher("myorder.jsp").forward(request, response);
                }
            } else {
                String id = request.getParameter("id");
                int ogid = Integer.parseInt(id);
                String categoryName = request.getParameter("categoryName");
                String imageName = getImagename(ogid);
                File fi = new File("E:/java project/NetBeansProjects/JackandJill/web/CompanyName/" + imageName);
                fi.delete();
                deleteMainComany(categoryName);
                String ogname = categoryName.replaceAll(" ", "");
                String query = "drop table " + ogname + "";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
            }
        } catch (SQLException ex) {
            Logger.getLogger(myOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {

            String deletecate = request.getParameter("type");
            System.out.println("calledMatterehaknasdkansdkjasdkjb " + deletecate);
            if (deletecate == null) {
                response.setContentType("text/html;charset+UTF-8");
                String id = request.getParameter("cateid");
                int ogid = Integer.parseInt(id);
                String imagename = getimagename(ogid);
                File fi = new File("E:/java project/NetBeansProjects/JackandJill/web/CompanyName/" + imagename);
                fi.delete();
                String savePath = "E:/java project/NetBeansProjects/JackandJill/web/" + File.separator + SAVE_DIR2;
                Part part = request.getPart("imagenamecate");
                String comString = request.getParameter("companyname");
                String partimagename = getImmagename(part);
                part.write(savePath + File.separator + partimagename);
                String query = "update maincompany set companyimagename='" + partimagename + "',companyname='"
                        + comString + "' where id=" + ogid + "";
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
                response.setContentType("text/plain");
                response.getWriter().write("UPdated !");
            } else {
                String id = request.getParameter("id");
                String catename = request.getParameter("catename");
                int ogid = Integer.parseInt(id);
                String imagename = getImageName(ogid, catename);
                System.out.println(imagename + " deleted<<---");
                File fi = new File("E:/java project/NetBeansProjects/JackandJill/web/medicineimage/" + imagename);
                fi.delete();
                String query = "delete from " + catename + " where id=" + ogid + "";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.executeUpdate();
                con.close();
                response.setContentType("text/plain");
                response.getWriter().write("Deleted !");
            }
        } catch (SQLException ex) {
            Logger.getLogger(myOrders.class.getName()).log(Level.SEVERE, null, ex);
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

    private String getimagename(int ogid) {
        String imaename = "";
        try {
            String query = "select companyimagename from maincompany where id=" + ogid + "";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                imaename = rs.getString("companyimagename");
            }
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(myOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imaename;
    }

    private String getImageName(int ogid, String catename) {
        String categoryName = "";
        try {
            String query = "select imagename from " + catename + " where id=" + ogid + "";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                categoryName = rs.getString("imagename");
            }
        } catch (SQLException ex) {
            Logger.getLogger(myOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return categoryName;
    }

    private String getImagename(int ogid) {
        String imagename = "";
        try {
            String query = "select companyimagename from maincompany where id=" + ogid + "";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                imagename = rs.getString("companyImagename");
            }
        } catch (SQLException ex) {
            Logger.getLogger(myOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
        return imagename;
    }

    private void deleteMainComany(String categoryName) {
        try {
            String query = "delete from maincompany where companyname='" + categoryName + "'";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(myOrders.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
