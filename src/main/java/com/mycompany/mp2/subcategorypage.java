package com.mycompany.mp2;

import com.mycompany.mp2.modal.numpojo;
import com.mycompany.mp2.modal.subcategorypojo;
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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saif
 */
@WebServlet(urlPatterns = {"/subcategorypage"})
public class subcategorypage extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    List<numpojo> numlist = new ArrayList<>();
    List<subcategorypojo> list = new ArrayList<>();
    List<subcategorypojo> mainlist = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int start = 0;
        int end = 10;
        try {
            // getting imagename,brandnameand id of all the sub product of same company.
            list.clear();
            String subcatename = request.getParameter("subcatename");
            String ogname = subcatename.replaceAll(" ", "");
            String query = "select id,brandname,imagename from " + ogname + "";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            list = subcategorypojo.getAllList(rs);
            System.out.println(list);
            int size = list.size();
            if (size <= 10) {
                end = list.size();
            } else {
                end = 10;
            }
            double d = size / 10;
            int ognum = (int) d + 1;
            System.out.println(ognum + " kinjndfd size " + size);
            numlist.clear();
            for (int i = 1; i <= ognum; i++) {
                numpojo np = new numpojo();
                np.setNum(i);
                numlist.add(np);
            }
            String paginationnumber = request.getParameter("number");
            if (paginationnumber != null) {
                int ogpagination = Integer.parseInt(paginationnumber);
                if (ogpagination == 1) {
                    start = 0;
                    end = 10;
                } else {
                    int finalnum = ogpagination - 1;
                    start = finalnum * 10 + 1 - 1;
                    int checkend = 10 * ogpagination;
                    if (checkend >= list.size()) {
                        System.out.println("y1");
                        end = list.size();
                    } else {
                        System.out.println("y2");
                        end = checkend;
                    }
                    System.out.println(start + " <-s 2nd e-> " + end);
                    mainlist = list.subList(start, end);
                }
            } else {
                System.out.println(start + " <-s e-> " + end);
                mainlist = list.subList(start, end);
            }

            con.close();
            request.setAttribute("companyname", subcatename);
            request.setAttribute("paginationlist", numlist);
            request.setAttribute("subcategory", mainlist);
            request.getRequestDispatcher("shop.jsp").forward(request, response);
        } catch (SQLException ex) {
            Logger.getLogger(subcategorypage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
