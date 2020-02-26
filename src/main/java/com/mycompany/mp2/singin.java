package com.mycompany.mp2;

/*
 * 
* CopyRight cosmos
 */
import com.mycompany.mp2.modal.AllDataPojo;
import com.mycompany.mp2.modal.PaymentPojo;
import com.mycompany.mp2.modal.adminordertable;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author saif
 */
public class singin extends HttpServlet {

    public String idi;
    String cardHoldeName;
    String cardNumber;
    short cvvNumber;
    String expiryDate;
    String emailidi;
    String mobilenumi;
    String paymentoption;

    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    int userid;
    // admintable
    String id;
    int productid;
    int productprice;
    int quantity;
    String imagename;
    String companyname;
    String brandname;
    public int orderid;
    public String firstname;
    public String lastname;
    public String address1;
    public String address2;
    public String mobilenum;
    public String emailid;
    public Date yyyy_mm_dd;
    public String city;
    public String state;
    String paymentName = "";
    String oid = "";
    int preorder = 0;
    int postorder = 0;
    int packaging = 0;

    static List<adminordertable> copylist = new ArrayList<>();
    static List<PaymentPojo> paylist = new ArrayList<>();

    public static void populate(List<adminordertable> lo) {
        copylist.clear();
        System.out.println("-----------------------------------------------------------------Ye called");
        copylist = lo;
        AllDataPojo pp = getPackage();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            oid = request.getParameter("orderid");
            String query = "select paymentoption from paymentpojo where id='" + oid + "'";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            rs = ps.executeQuery();
            while (rs.next()) {
                paymentName = rs.getString("paymentoption");
            }
            con.close();
            System.out.println("----------------------" + paymentName + " Sahi mai");
            if (paymentName.equals("gpay") || paymentName.equals("zelle") || paymentName.equals("paypal")) {
                paylist.clear();
                String query2 = "select emailid,mobilenum,paymentoption,id from paymentpojo where id='" + oid + "'";
                System.out.println(query2);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query2);
                rs = ps.executeQuery();
                paylist = PaymentPojo.getPayment(rs);
                paylist.forEach(s -> {
                    idi = s.getId();
                    cardHoldeName = s.getCardHoldeName();
                    cardNumber = s.getCardNumber();
                    cvvNumber = s.getCvvNumber();
                    expiryDate = s.getExpiryDate();
                    emailidi = s.getEmailid();
                    mobilenumi = s.getMobilenum();
                    paymentoption = s.getPaymentoption();
                });
                request.setAttribute("paymentinfoq", paylist);
                System.out.println("set the eq param ");
                List<adminordertable> singledata = copylist.stream().filter((adminordertable op) -> op.id.contains(oid))
                        .collect(Collectors.toList());
                con.close();
                request.setAttribute("order", singledata);
                System.out.println("last one size is also---> " + singledata.size() + " <-----");
                System.out.println("last one Payment size is also---> " + paylist.size() + " <-----");
            } else {
                paylist.clear();
                String query3 = "select * from paymentpojo where id='" + oid + "'";
                System.out.println(query3);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query3);
                rs = ps.executeQuery();
                paylist = PaymentPojo.getPayment2(rs);
                paylist.forEach(s -> {
                    idi = s.getId();
                    cardHoldeName = s.getCardHoldeName();
                    cardNumber = s.getCardNumber();
                    cvvNumber = s.getCvvNumber();
                    expiryDate = s.getExpiryDate();
                    emailidi = s.getEmailid();
                    mobilenumi = s.getMobilenum();
                    paymentoption = s.getPaymentoption();
                });
                con.close();
                request.setAttribute("paymentinfoq", paylist);
                System.out.println("set the eq param");
                List<adminordertable> singledata = copylist.stream().filter((adminordertable op) -> op.id.contains(oid))
                        .collect(Collectors.toList());
                request.setAttribute("order", singledata);
                System.out.println("last one");
            }
        } catch (SQLException ex) {
            Logger.getLogger(singin.class.getName()).log(Level.SEVERE, null, ex);
        }
        request.getRequestDispatcher("OrderDetials.jsp").forward(request, response);
    }

    public static AllDataPojo getPackage() {
        AllDataPojo pp = new AllDataPojo();
        copylist.forEach((adminordertable ad) -> {
            System.out.println("Address ------------------>" + ad.getAddress1());
        });
        pp.setAdminlist(copylist);
        paylist.forEach((PaymentPojo p) -> {
            System.out.println("Email ID ----------------------> " + p.getEmailid());
        });
        pp.setPaylist(paylist);
        return pp;
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        HttpSession session = request.getSession();
        try {
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            if (username.equals("user") && password.equals("pass")) {
                session.setAttribute("username", username);
                response.sendRedirect("homeController");
                return;
            } else {
                String uquery = "select * from usernameadnpassword2 where username='" + username
                        + "' and password='" + password + "'";
                System.out.println(uquery);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(uquery);
                rs = ps.executeQuery();
                con.close();
                if (rs.next()) {
                    session.setAttribute("userid", userid);
                    session.setAttribute("username", username);
                    request.setAttribute("userid", userid);
                    response.sendRedirect("homeController");
                } else if (!rs.next()) {
                    System.out.println(username + " " + password);
                    String query = "select username,password from admintablecredentials where username='" + username
                            + "' and" + " password='" + password + "'";
                    System.out.println(query);
                    con = ConnectionClass.getConnection();
                    ps = con.prepareStatement(query);
                    rs = ps.executeQuery();
                    con.close();
                    if (rs.next()) {
                        Thread th = new Thread(() -> {
                            getAllCount();
                        });
                        th.start();
                        request.setAttribute("preorder", preorder);
                        request.setAttribute("postorder", postorder);
                        request.setAttribute("packageorder", packaging);
                        request.getRequestDispatcher("adminhome.jsp").forward(request, response);
                    }
                } else {
                    request.setAttribute("msgs", "No user Found !");
                    request.getRequestDispatcher("signin.jsp").forward(request, response);
                }

            }
        } catch (SQLException ex) {
            Logger.getLogger(singin.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void getAllCount() {
        List<Integer> listInt = new ArrayList<>();
        Thread th = new Thread(() -> {
            try {
                List<String> tableList = Arrays.asList("adminordertable", "packagepojo");
                String[] yesno = {"no", "yes"};
                for (int i = 0; i <= 2; i++) {
                    if (i < 2) {
                        String query = "select count(*) from " + tableList.get(0) + " where paymentdoen='" + yesno[i]
                                + "'";
                        System.out.println(query);
                        con = ConnectionClass.getConnection();
                        ps = con.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            listInt.add(rs.getInt("count"));
                        }
                        con.close();
                    } else {
                        String query = "select count(*) from " + tableList.get(1);
                        con = ConnectionClass.getConnection();
                        ps = con.prepareStatement(query);
                        rs = ps.executeQuery();
                        while (rs.next()) {
                            listInt.add(rs.getInt("count"));
                        }
                        con.close();
                    }
                }
                for (int i = 0; i < listInt.size(); i++) {
                    switch (i) {
                        case 0:
                            preorder = listInt.get(i);
                            break;
                        case 1:
                            postorder = listInt.get(i);
                            break;
                        default:
                            packaging = listInt.get(i);
                            break;
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(singin.class.getName()).log(Level.SEVERE, null, ex);
            }
        });
        th.start();
    }

}
