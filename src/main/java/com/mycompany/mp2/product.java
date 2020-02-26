package com.mycompany.mp2;

/*
 * 
 
* CopyRight cosmos
 */

import com.mycompany.mp2.modal.MainCompany;
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
public class product extends HttpServlet {

    Connection con = null;
    ResultSet rs;
    PreparedStatement ps = null;
    List<MainCompany> mainList = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String query = "select * from maincompany";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            mainList = MainCompany.getCate(rs);
            con.close();
            request.setAttribute("category", mainList);
            request.getRequestDispatcher("help.jsp").forward(request, response);
        } catch (SQLException s) {

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

}
