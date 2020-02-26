package com.mycompany.mp2;

/*
 * 

 * CopyRight cosmos
 */
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
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

import com.mycompany.mp2.modal.AllDataPojo;
import com.mycompany.mp2.modal.PackagePojo;
import com.mycompany.mp2.modal.PaymentPojo;
import com.mycompany.mp2.modal.adminordertable;

/**
 *
 * @author saif
 */
public class PaymentRequestSend extends HttpServlet {

    String msg = "";
    HttpSession hsession = null;
    List<adminordertable> adminList = new ArrayList<>();
    List<PaymentPojo> payList = new ArrayList<>();
    List<PackagePojo> packList = new ArrayList<>();
    adminordertable oa;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;

    Calendar cal = Calendar.getInstance();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String id = request.getParameter("orderid");
        String payed = request.getParameter("payed");
        if (id != null && payed.equals("no")) {
            try {
                java.sql.Date date = new java.sql.Date(cal.getTime().getTime());
                String ogid = id.trim();
                String querys = "update adminordertable set paymentdoen='yes',yyyy_mm_dd='" + date + "' where id='"
                        + ogid + "'";
                System.out.println(querys);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(querys);
                int result = ps.executeUpdate();
                System.out.println("Query " + querys + "--" + id);
                if (result != 0) {
                    msg = "Order Moved To Post Payment Table";
                } else {
                    msg = "Problem";
                }
                con.close();
                hsession = request.getSession();
                hsession.setAttribute("msg", msg);
                response.sendRedirect("getorders");
            } catch (SQLException ex) {
                Logger.getLogger(PaymentRequestSend.class.getName()).log(Level.SEVERE, null, ex);
            }
        } else if (id != null && payed.equals("yes")) {
            AllDataPojo pp = singin.getPackage();
            adminList = pp.getAdminlist();
            payList = pp.getPaylist();
            System.out.println("condition" + id);
            String ogid = id.trim();
            System.out.println("condition  " + id);
            List<adminordertable> collectAdminList = adminList.stream()
                    .filter((adminordertable op) -> op.id.equals(ogid)).collect(Collectors.toList());

            List<PaymentPojo> collectPaymentList = payList.stream().filter((PaymentPojo papo) -> papo.id.equals(ogid))
                    .collect(Collectors.toList());
            System.out.println("------------------------------------------------------------OUTTTTTTT");
            System.out.println(
                    payList.size() + "<-size------------------------------------------------------------OUTTTTTTT");
            payList.forEach(s -> {
                System.out.println("------------------------------------------------------------");
                System.out.println("Mobile Num " + s.getMobilenum());
                System.out.println("Email Id " + s.getEmailid());
                System.out.println("------------------------------------------------------------");
            });
            Thread th2 = new Thread(() -> {
                updateFinalTable(collectAdminList, collectPaymentList);
            });
            th2.start();
            OrderDelete(id);
            response.sendRedirect("getorders");

        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    }

    private void updateFinalTable(List<adminordertable> l1, List<PaymentPojo> l2) {

        try {
            String id = null;
            String productid = null;
            String productprice = null;
            String quantity = null;
            String imagename = null;
            String companyname = null;
            String packaging = null;
            String brandname = null;
//    public String userid;
            String genericname = null;
            String firstname = null;
            String lastname = null;
            String username = null;
            String address1 = null;
            String address2 = null;
            Date yyyy_mm_dd = null;
            String city = null;
            String state = null;
            String country = null;
            String paymentdoen = null;
//    ---------------------------------------------------
            String cardHoldeName = null;
            String cardNumber = null;
            short cvvNumber = 0;
            String expiryDate = null;
            String emailid = null;
            String mobilenum = null;
            String paymentoption = null;
            String zipcode = null;
            for (PaymentPojo e : l2) {
                cardHoldeName = e.getCardHoldeName();
                cardNumber = e.getCardNumber();
                cvvNumber = e.getCvvNumber();
                expiryDate = e.getExpiryDate();
                mobilenum = e.getMobilenum();
                emailid = e.getEmailid();
                paymentoption = e.getPaymentoption();
            }
            for (adminordertable s : l1) {
                id = s.getId();
                genericname = s.getGenericname();
                firstname = s.getFirstname();
                yyyy_mm_dd = s.getYyyy_mm_dd();
                country = s.getCountry();
                companyname = s.getCompanyname();
                city = s.getCity();
                brandname = s.getBrandname();
                address1 = s.getAddress1();
                address2 = s.getAddress2();
                username = s.getUsername();
                state = s.getState();
                quantity = s.getQuantity();
                productprice = s.getProductprice();
                productid = s.getProductid();
                packaging = s.getPackaging();
                lastname = s.getLastname();
                imagename = s.getImagename();
                zipcode = s.getZipcode();
            }
            String query = " INSERT INTO public.packagepojo(id, address1, address2, brandname, cardholdename, cardnumber,"
                    + "            city, companyname, country, cvvnumber, emailid, expirydate, firstname,"
                    + "            genericname, imagename, lastname, mobilenum, packaging, paymentdoen,"
                    + "            paymentoption, productid, productprice, quantity, state, username,yyyy_mm_dd,\"Zipcode\")"
                    + "    VALUES ('" + id + "', '" + address1 + "','" + address2 + "','" + brandname + "','"
                    + cardHoldeName + "','" + cardNumber + "'," + "            '" + city + "','" + companyname + "','"
                    + country + "'," + cvvNumber + ",'" + emailid + "','" + expiryDate + "','" + firstname + "',"
                    + "            '" + genericname + "', '" + imagename + "','" + lastname + "','" + mobilenum + "','"
                    + packaging + "','" + paymentdoen + "'," + "            '" + paymentoption + "','" + productid
                    + "','" + productprice + "','" + quantity + "','" + state + "'," + "            '" + username
                    + "','" + yyyy_mm_dd + "','" + zipcode + "');";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.execute();
            con.close();
        } catch (SQLException ex) {
            Logger.getLogger(PaymentRequestSend.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void OrderDelete(String id) {
        Connection con;
        PreparedStatement ps;
        for (int i = 0; i < 2; i++) {
            if (i == 0) {
                try {
                    String ogid = id.trim();
                    String query = "delete from adminordertable where id='" + ogid + "'";
                    con = ConnectionClass.getConnection();
                    ps = con.prepareStatement(query);
                    System.out.println(query);
                    ps.executeUpdate();
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PaymentRequestSend.class.getName()).log(Level.SEVERE, null, ex);
                }
            } else {
                try {
                    String ogid = id.trim();
                    String query = "delete from paymentpojo where id='" + ogid + "'";
                    con = ConnectionClass.getConnection();
                    ps = con.prepareStatement(query);
                    System.out.println(query);
                    ps.executeUpdate();
                    con.close();
                } catch (SQLException ex) {
                    Logger.getLogger(PaymentRequestSend.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }

}
