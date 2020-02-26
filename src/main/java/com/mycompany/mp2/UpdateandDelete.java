package com.mycompany.mp2;

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

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;

import com.mycompany.mp2.modal.MainCompany;
import com.mycompany.mp2.modal.UpdateAndDeletePojo;
import com.mycompany.mp2.modal.subcategorypojo;

/**
 *
 * @author saif
 */
public class UpdateandDelete extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    static List<MainCompany> li = new ArrayList<>();
    static List<subcategorypojo> lisub = new ArrayList<>();

    public static void setCate() {
        UpdateAndDeletePojo uad = new UpdateAndDeletePojo();
        uad.setCatli(li);
    }

    public static UpdateAndDeletePojo setsubcate() {
        UpdateAndDeletePojo uad = new UpdateAndDeletePojo();
        uad.setSubli(lisub);
        return uad;
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String data = request.getParameter("data");
        String subname = request.getParameter("subname");
        String tablename = request.getParameter("tablename");
        System.out.println(data+" "+subname+" "+tablename+" <><>><><><><><");
        if (data != null && subname != null && tablename != null) {
            try {
                String ogtablename = tablename.replace(" ", "");
                String query = "select * from " + ogtablename + " where brandname='" + subname + "'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                con.close();
                List<subcategorypojo> sublist = subcategorypojo.getAllListforproduct(rs);
                Gson gs = new Gson();
                JsonElement je = gs.toJsonTree(sublist, new TypeToken<List<subcategorypojo>>() {
                }.getType());
                JsonArray ja = je.getAsJsonArray();
                response.setContentType("application/json");
                response.getWriter().print(ja);
            } catch (SQLException ex) {
                Logger.getLogger(UpdateandDelete.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            try {
                String query = "select * from maincompany";
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                List<MainCompany> li = MainCompany.getCate(rs);
                con.close();
                request.setAttribute("category", li);
                setCate();
                request.getRequestDispatcher("updateanddelete.jsp").forward(request, response);
            } catch (SQLException s) {

            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String tabname = request.getParameter("tablename");
            String ogf = request.getParameter("tabname");

            if (tabname != null && ogf == null) {
                String og = tabname.toLowerCase();
                String ogname = og.replaceAll(" ", "");
                String query = "select * from " + ogname + "";
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                con.close();
                lisub = subcategorypojo.getAllList(rs);
                setsubcate();
                Gson g = new Gson();
                JsonElement je = g.toJsonTree(lisub, new TypeToken<List<subcategorypojo>>() {
                }.getType());
                JsonArray Ja = je.getAsJsonArray();
                response.setContentType("application/json");
                response.getWriter().print(Ja);
            } else {
                String query2 = "select * from maincompany where companyname='" + ogf + "'";
                System.out.println(query2);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query2);
                rs = ps.executeQuery();
                List<MainCompany> mList = MainCompany.getCate(rs);
                con.close();
                System.out.println("------------------->" + mList.size());
                Gson gs = new Gson();
                JsonElement je = gs.toJsonTree(mList, new TypeToken<List<MainCompany>>() {
                }.getType());
                JsonArray ja = je.getAsJsonArray();
                response.setContentType("application/json");
                response.getWriter().print(ja);
            }
        } catch (SQLException ex) {
            Logger.getLogger(UpdateandDelete.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
