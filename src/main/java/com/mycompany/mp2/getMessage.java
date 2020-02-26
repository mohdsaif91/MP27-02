package com.mycompany.mp2;

/*
 * 

 * CopyRight cosmos
 */
import com.mycompany.mp2.modal.contactPojo;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saif
 */
public class getMessage extends HttpServlet {

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    List<contactPojo> cplist = new ArrayList<>();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String getid = request.getParameter("getmsg");
        if (getid == null) {
            try {
                String query = "select * from contactPojo2 where read='no'";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                con.close();
                cplist = contactPojo.getList(rs);
                request.setAttribute("usermessage", cplist);
                request.getRequestDispatcher("messageshow.jsp").forward(request, response);
            } catch (SQLException ex) {
                Logger.getLogger(getMessage.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else {
            int id = Integer.parseInt(request.getParameter("id"));
            Thread th = new Thread(() -> {
                update(id);
            });
            th.start();
            List<contactPojo> newlist = cplist.stream().filter(s -> s.getId() == id).collect(Collectors.toList());
            System.out.println(newlist);
            request.setAttribute("mesgd", newlist);
            request.getRequestDispatcher("Messagedisplay.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void update(int id) {
        try {
            String query = "update contactpojo set read='yes' where id=" + id + "";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.executeUpdate();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(getMessage.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
