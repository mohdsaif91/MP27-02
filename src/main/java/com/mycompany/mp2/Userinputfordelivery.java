package com.mycompany.mp2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import java.util.UUID;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonElement;
import com.google.gson.reflect.TypeToken;
import com.mycompany.mp2.modal.AllDataPojoClass;
import com.mycompany.mp2.modal.cartHelperPojo;
import com.mycompany.mp2.modal.orderpojo;

/**
 *
 * @author saif
 */
public class Userinputfordelivery extends HttpServlet {

    HttpSession session;
    Calendar cal = Calendar.getInstance();
    List<orderpojo> lop = new ArrayList<>();
    String companyname;
//    String genericname;
    String imagename;
    String packaging;
    String brandname;
    String orderid = "";
    String cardHoldeName = "";
    String cardNumber = "";
    short cvvNumber = 000;
    String expiryDate = "";
    String emailid = "";
    String mobilenum = "";
    String sendMail = null;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
    List<AllDataPojoClass> adp = new ArrayList<>();
    AllDataPojoClass adpp = new AllDataPojoClass();
    SendingEmail sm = new SendingEmail();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String tablename = request.getParameter("tablename");
        if (tablename.equals("review")) {
            adp.forEach(s -> {
                sendMail = s.getEmailid();
            });
            sm.sendmail(adp, sendMail);
            Gson gs = new Gson();
            JsonElement jele = gs.toJsonTree(adp, new TypeToken<List<AllDataPojoClass>>() {
            }.getType());
            System.out.println(adp.toString());
            JsonArray ja = jele.getAsJsonArray();
            response.setContentType("application/json");
            response.getWriter().print(ja);
        } else {
            try {
                if (tablename.equals("gpay") || tablename.equals("zelle") || tablename.equals("paypal")) {
                    emailid = request.getParameter("emailid");
                    mobilenum = request.getParameter("mobile");
                } else {
                    System.out.println("inside the card detials-----------------------------------.,.");
                    cardHoldeName = request.getParameter("name");
                    cardNumber = request.getParameter("creditcard");
                    String cvvnum = request.getParameter("cvv");
                    System.out.println("Short num " + cvvnum);
                    cvvNumber = (short) Short.parseShort(cvvnum);
                    expiryDate = request.getParameter("expirydate");
                    emailid = request.getParameter("emailid");
                    mobilenum = request.getParameter("mobilenum");
                }
                String query = "insert into PaymentPojo(id,cardholdename,cardnumber,cvvnumber,emailid,expirydate,mobilenum,paymentoption)"
                        + "values('" + orderid + "','" + cardHoldeName + "','" + cardNumber + "'," + cvvNumber + ",'"
                        + emailid + "','" + expiryDate + "'" + ",'" + mobilenum + "','" + tablename + "')";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                ps.execute();
                con.close();
                adpp.setId(orderid);
                adpp.setPaymentoption(tablename);
                adpp.setCardHoldeName(cardHoldeName);
                adpp.setCardNumber(cardNumber);
                adpp.setCvvNumber(cvvNumber);
                adpp.setEmailid(emailid);
                adpp.setMobilenum(mobilenum);
                adpp.setExpiryDate(expiryDate);
                adp.add(adpp);
                response.setContentType("text/plain");
                System.out.println("last");
                response.getWriter().write("Updated");
            } catch (SQLException ex) {
                Logger.getLogger(Userinputfordelivery.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            adp.clear();
//        -------------------------------------------------------------------------
            System.out.println("kingkong");
            java.sql.Date date = new java.sql.Date(cal.getTime().getTime());
            String productid = request.getParameter("id");
            String tablename = request.getParameter("tablename");
            lop = GetProductinfo.getdetials(productid, tablename);
            String fname = request.getParameter("fName");
            String lname = request.getParameter("lname");
            String uname = request.getParameter("uName");
            String address1 = request.getParameter("aDdress1");
            String address2 = request.getParameter("aDdress2");
            String country = request.getParameter("cOuntry");
            String state = request.getParameter("sTate");
            String zipcode = request.getParameter("zIpcode");
            String rcode = request.getParameter("rCode");
            String city = request.getParameter("city");
            String genericname = request.getParameter("gEnericname");
            String productprice = request.getParameter("pPrice");
            String quantity = request.getParameter("quantity");
            UUID uuid = UUID.randomUUID();
            orderid = String.valueOf(uuid);
            lop.forEach((orderpojo o) -> {
                imagename = o.getImagename();
                packaging = o.getPackaging();
                brandname = o.getBrandname();
            });
            System.out.println(fname + "" + lname + "" + uname + "" + address1 + "" + address2 + "" + country + ""
                    + state + "" + zipcode + "" + rcode + "" + genericname + "" + productprice + " " + date);
            String query = "INSERT INTO adminordertable(id, address1, address2, brandname, city, companyname, country,"
                    + "            firstname, genericname, imagename, lastname, mobilenum, packaging,"
                    + "            paymentdoen, productid, productprice, quantity, state,username, yyyy_mm_dd, zipcode)"
                    + "    VALUES ('" + orderid + "', '" + address1
                    + "','" + address2 + "','" + brandname + "','" + city + "','" + tablename + "','" + country + "',"
                    + "            '" + fname + "', '" + genericname + "','" + imagename + "','" + lname + "','"
                    + mobilenum + "','" + packaging + "'," + " 'no', '" + productid + "', '" + productprice
                    + "','" + quantity + "','" + state + "' , " + "'" + uname + "', '" + date + "', '"
                    + zipcode + "');";
            System.out.println(query);
            con = ConnectionClass.getConnection();
            ps = con.prepareStatement(query);
            ps.execute();
            con.close();
            adpp.setFirstname(fname);
            adpp.setLastname(lname);
            adpp.setUsername(uname);
            adpp.setAddress1(address1);
            adpp.setAddress2(address2);
            adpp.setCountry(country);
            adpp.setCity(city);
            adpp.setYyyy_mm_dd(date);
            adpp.setMobilenum(mobilenum);
            adpp.setProductid(productid);
            adpp.setCompanyname(tablename);
            adpp.setGenericname(genericname);
            adpp.setImagename(imagename);
            adpp.setBrandname(brandname);
            adpp.setProductprice(productprice);
            adpp.setPackaging(packaging);
            adpp.setState(state);
            adpp.setQuantity(quantity);
            adpp.setZipcode(zipcode);
            adp.add(adpp);
            List<cartHelperPojo> chplist = BookProduct.getcartpojo();
            updatecart(chplist);
            response.setContentType("text/plain");
            response.getWriter().write("");
        } catch (SQLException ex) {
            Logger.getLogger(Userinputfordelivery.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    private void updatecart(List<cartHelperPojo> chplist) {
        Thread ty = new Thread(() -> {
            try {
                List<String> cartList = new ArrayList<>();
                cartList.clear();
                List<orderpojo> olist = new ArrayList<>();
                String username = "";
                String id = "";
                String quantity = "";
                String tablename = "";
                String price = "";
                String pqckaging = "";
                String productname = "";
                String cartimagename = "";
                for (cartHelperPojo c : chplist) {
                    olist = c.getLo();
                    id = c.getId();
                    quantity = c.getQuantity();
                    username = c.getUsername();
                    tablename = c.getCompanyname();
                }
                System.out.println(olist);
                for (orderpojo s : olist) {
                    price = s.getProductprice();
                    pqckaging = s.getPackaging();
                    productname = s.getBrandname();
                    cartimagename = s.getImagename();
                }

                String cartquery = "select productname from " + username + "";
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(cartquery);
                rs = ps.executeQuery();
                while (rs.next()) {
                    cartList.add(rs.getString("productname").trim());
                }
                con.close();
                if (cartList.isEmpty()) {
                    System.out.println("id =" + id + " quantuty=" + quantity + " username=" + username + " tablename=" + tablename);
                    String query = "insert into " + username + "(productid,companyname,price,packaging,quantity,productname,show,image)" + "values('" + id
                            + "','" + tablename + "','" + price + "','" + pqckaging + "','" + quantity + "','" + productname
                            + "','order','" + cartimagename + "')";
                    System.out.println(query);
                    con = ConnectionClass.getConnection();
                    ps = con.prepareStatement(query);
                    ps.executeUpdate();
                    con.close();
                } else {
                    String ans = "";
                    for (String s : cartList) {
                        if (s.equals(productname)) {
                            ans = "yes";
                            System.out.println("The Value is present<><><<<><><><>><<>");
                            break;
                        } else {
                            ans = "no";
                        }
                    }
                    if (ans.equals("no")) {
                        System.out.println("id =" + id + " quantuty=" + quantity + " username=" + username
                                + " tablename=" + tablename);
                        String query = "insert into " + username
                                + "(productid,companyname,price,packaging,quantity,productname,show,image)" + "values('"
                                + id + "','" + tablename + "','" + price + "','" + pqckaging + "','" + quantity + "','"
                                + productname + "','order','" + cartimagename + "')";
                        System.out.println(query);
                        con = ConnectionClass.getConnection();
                        ps = con.prepareStatement(query);
                        ps.executeUpdate();
                        con.close();
                    }
                }
            } catch (SQLException ex) {
                Logger.getLogger(Userinputfordelivery.class.getName()).log(Level.SEVERE, null, ex);
            }
        });
        ty.start();

    }

}
