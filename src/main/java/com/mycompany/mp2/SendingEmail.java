package com.mycompany.mp2;

import com.mycompany.mp2.modal.AllDataPojoClass;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Properties;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;


/*
 * 
 * CopyRight cosmos
 */
/**
 * @author saif
 */
public class SendingEmail {

    String id;
    String productid;
    String productprice;
    String quantity;
    String imagename;
    String companyname;
    String packaging;
    String brandname;
    String genericname;
    public String firstname;
    public String lastname;
    public String username;
    public String address1;
    public String address2;
    public String mobilenum;
    public Date yyyy_mm_dd;
    public String city;
    public String state;
    public String country;
    String cardHoldeName;
    String cardNumber;
    short cvvNumber;
    String expiryDate;
    String emailid;
    String paymentoption;
    Connection con;
    PreparedStatement ps;
    ResultSet rs;
//    -----------------------
    String recipeant = "";// sameersubhani.s@gmail.com in prod
    static String myaccount = "";
    static String password = "";
    Properties properties = new Properties();
    Session session;
    List<String> recipeantList = new ArrayList<>();
    final List<String> subjectList = new ArrayList<>();

    static List<AllDataPojoClass> emailList = new ArrayList<>();

    public void sendmail(List<AllDataPojoClass> lp, String sendEmailId) {
        Thread tg = new Thread(() -> {
            System.out.println("lo aya mail id ->>>>" + sendEmailId);
            recipeantList.clear();
            subjectList.add("Order Of Cusotmer");
            subjectList.add("Matrix Pharmacy Order Detials");
            try {
                String query = "select * from \"emailTable\"";
                System.out.println(query);
                con = ConnectionClass.getConnection();
                ps = con.prepareStatement(query);
                rs = ps.executeQuery();
                while (rs.next()) {
                    recipeant = rs.getString("email");
                    myaccount = rs.getString("email");
                    password = rs.getString("password");
                }
                con.close();
                recipeantList.add(recipeant);
                recipeantList.add(sendEmailId);
                lp.forEach(s -> {
                    id = s.getId();
                    productid = s.getProductid();
                    productprice = s.getProductprice();
                    quantity = s.getQuantity();
                    imagename = s.getImagename();
                    companyname = s.getCompanyname();
                    packaging = s.getPackaging();
                    brandname = s.getBrandname();
                    genericname = s.getGenericname();
                    firstname = s.getFirstname();
                    lastname = s.getLastname();
                    username = s.getUsername();
                    address1 = s.getAddress1();
                    address2 = s.getAddress2();
                    mobilenum = s.getMobilenum();
                    yyyy_mm_dd = s.getYyyy_mm_dd();
                    city = s.getCity();
                    state = s.getState();
                    country = s.getCountry();
                    cardHoldeName = s.getCardHoldeName();
                    cardNumber = s.getCardNumber();
                    cvvNumber = s.getCvvNumber();
                    expiryDate = s.getExpiryDate();
                    emailid = s.getEmailid();
                    paymentoption = s.getPaymentoption();
                });
                preparemsg(myaccount, recipeantList, password);
            } catch (SQLException ex) {
                Logger.getLogger(SendingEmail.class.getName()).log(Level.SEVERE, null, ex);
            }
        });
        tg.start();
    }

    private void preparemsg(String myaccount, List<String> recipent, String passwordinside) {
        Thread th = new Thread(() -> {
            // SMTP server information
            String host = "smtp.gmail.com";
            String port = "587";
// outgoing message information
            String subject = "Order Of customer.";
            String message = "<b><font size='7' color=red>User Name- " + username + "</font></b><br>";
            message += "<b><font size='5'>Product Id- " + productid + "</font></b><br>";
            message += "<b><font size='5' color=red>Brand Name- " + brandname + "</font></b><br>";
            message += "<b><font size='5'>Company Name- " + companyname + "</font></b><br>";
            message += "<b><font size='5' color=red>Quantity- " + quantity + "</font></b><br>";
            message += "<b><font size='5'>Generic Name- " + genericname + "</font></b><br>";
            message += "<b><font size='5' color=red>Produc Price- " + productprice + " $</font></b><br>";
            message += "<b><font size='5'>Packaging- " + packaging + "</font></b><br>";
            message += "<b><font size='5' color=red>FirstName- " + firstname + "</font></b><br>";
            message += "<b><font size='5'>LastName- " + lastname + "</font></b><br>";
            message += "<b><font size='5' color=red>Address Line 1- " + address1 + "</font></b><br>";
            message += "<b><font size='5'>Address Line 2- " + address2 + "</font></b><br>";
            message += "<b><font size='5' color=red>Mobile Num- " + mobilenum + "</font></b><br>";
            message += "<b><font size='5'>Order date- " + yyyy_mm_dd + "</font></b><br>";
            message += "<b><font size='5' color=red>City- " + city + "</font></b><br>";
            message += "<b><font size='5'>State- " + state + "</font></b><br>";
            message += "<b><font size='5' color=red>Country- " + country + "</font></b><br>";
            message += "<b><font size='5'>Card Holder- " + cardHoldeName + "</font></b><br>";
            message += "<b><font size='5' color=red>Card Number- " + cardNumber + "</font></b><br>";
            message += "<b><font size='5'>Cvv Number- " + cvvNumber + "</font></b><br>";
            message += "<b><font size='5' color=red>Expiry Date- " + expiryDate + "</font></b><br>";
            message += "<b><font size='5'>Email Id- " + emailid + "</font></b><br>";
            message += "<b><font size='5' color=red>Order date- " + yyyy_mm_dd + "</font></b><br>";
            message += "<b><font size='5'>Payment Option- " + paymentoption + "</font></b><br>";
            for (int i = 0; i <= 1; i++) {
                try {
                    System.out.println(host + " " + port + " " + myaccount + " " + passwordinside + " " + recipeantList.get(i) + " " + subjectList.get(i) + " " + message);
                    sendHtmlEmail(host, port, myaccount, passwordinside, recipent.get(i), subjectList.get(i), message);
                    System.out.println("Message Send");
                } catch (MessagingException ex) {
                    Logger.getLogger(SendingEmail.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        });
        th.start();

    }

    public void sendHtmlEmail(String host, String port, final String userName, final String password, String toAddress,
            String subject, String message) throws AddressException, MessagingException {
        Thread tho = new Thread(() -> {
            try {
                properties.put("mail.smtp.host", host);
                properties.put("mail.smtp.port", port);
                properties.put("mail.smtp.auth", "true");
                properties.put("mail.smtp.starttls.enable", "true");
                Authenticator auth = new Authenticator() {
                    @Override
                    public PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(userName, password);
                    }
                };
                Session session = Session.getDefaultInstance(properties, auth);
                //
                Message msg = new MimeMessage(session);
                System.out.println(session+"<>");
                System.out.println(msg+"<>");
                msg.setFrom(new InternetAddress(userName));
                System.out.println(userName+"<>");
                InternetAddress[] toAddresses = {new InternetAddress(toAddress)};
                System.out.println(toAddress+"<>");
                msg.setRecipients(Message.RecipientType.TO, toAddresses);
                System.out.println(toAddress+"<>");
                msg.setSubject(subject);
                msg.setSentDate(new Date());
                // set plain text message
                msg.setContent(message, "text/html");
                // sends the e-mail
                Transport.send(msg);
            } catch (AddressException ex) {
                Logger.getLogger(SendingEmail.class.getName()).log(Level.SEVERE, null, ex);
            } catch (MessagingException ex) {
                Logger.getLogger(SendingEmail.class.getName()).log(Level.SEVERE, null, ex);
            }
        });
        tho.start();
    }

}
