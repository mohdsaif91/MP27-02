package com.mycompany.mp2;

/*
 * 
 * CopyRight cosmos
 */

import java.io.IOException;
import java.lang.reflect.Type;
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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.mycompany.mp2.modal.AllProduct;

/**
 *
 * @author saif
 */
public class getSingleProduct extends HttpServlet {

    Connection con = null;
    ResultSet rs;
    PreparedStatement ps = null;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<AllProduct> alllist = new ArrayList<>();
        String onchangetext = request.getParameter("text");
        String ogstring = onchangetext.replaceAll(" ", "");
        String ogtext = ogstring.toUpperCase();
        try {
            String query1 = "select * from producttable where brandname='" + ogtext + "'";
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query1);
            rs = ps.executeQuery();
            alllist = AllProduct.getList(rs);
            if (alllist.isEmpty()) {
                con.close();
                response.getWriter().write("No Product Found !");
            } else {
                Gson gson = new Gson();
                JsonElement jelement = gson.toJsonTree(alllist, (Type) new TypeToken<List<AllProduct>>() {
                }.getType());
                con.close();
                JsonArray ja = jelement.getAsJsonArray();
                response.setContentType("application/json");
                response.getWriter().print(ja);
            }
        } catch (SQLException s) {

        }

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }

}
