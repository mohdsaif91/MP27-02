package com.mycompany.mp2;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
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

import com.mycompany.mp2.modal.UpdateAndDeletePojo;
import com.mycompany.mp2.modal.subcategorypojo;

/**
 *
 * @author saif
 */
@MultipartConfig(maxFileSize = 1024 * 1024 * 2)
@WebServlet("/UpdateImageWithAjax")
public class UpdateImageWithAjax extends HttpServlet {

    List<subcategorypojo> subcatelist = new ArrayList<>();
    String imagename = "";
    private static final String SAVE_DIR2 = "medicineimage";
    Connection con;
    ResultSet rs;
    PreparedStatement ps;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset+UTF-8");
        String companyname = request.getParameter("companyname");
        Part pr = request.getPart("imagenamecate");
        System.out.println(pr + "---" + companyname);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String id = request.getParameter("id");
            int ogid = Integer.parseInt(id);
            subcatelist = getList();
            subcatelist.forEach(s -> {
                if (s.getId() == ogid) {
                    imagename = s.getImagename();
                }
            });
            File fi = new File("E:/java project/NetBeansProjects/JackandJill/web/medicineimage/" + imagename);
            System.out.println("delete--------------------> " + fi);
            fi.delete();
            response.setContentType("text/html;charset+UTF-8");
            PrintWriter out = response.getWriter();
            Part part = request.getPart("imagenamepro");
            String savePath = "E:/java project/NetBeansProjects/JackandJill/web/" + File.separator + SAVE_DIR2;
            String partimagename = getImmagename(part);
            part.write(savePath + File.separator + partimagename);
            String companyname = request.getParameter("companyname");
            String ogcomapnyname = companyname.toLowerCase();
            String genericname = request.getParameter("genericname");
            String brandname = request.getParameter("brandname");
            String productprice = request.getParameter("productprice");
            String packaging = request.getParameter("packaging");
            String description = request.getParameter("description");
            String ogname = ogcomapnyname.replaceAll(" ", "");
            String query = "update " + ogname + "  set company='" + companyname + "'" + ",genericname='" + genericname
                    + "',imagename='" + partimagename + "',brandname='" + brandname + "'" + ",mdeidescription='"
                    + description + "',productprice='" + productprice + "',packaging='" + packaging + "' where id="
                    + ogid + "";
            System.out.println("----------------------->>>> " + query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            response.setContentType("text/plain");
            con.close();
            response.getWriter().print("Updated !");
        } catch (SQLException ex) {
            Logger.getLogger(UpdateImageWithAjax.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private List<subcategorypojo> getList() {
        UpdateAndDeletePojo upd = UpdateandDelete.setsubcate();
        return upd.getSubli();
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
}
