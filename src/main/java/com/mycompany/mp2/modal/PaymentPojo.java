package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import lombok.Data;

/*
 * 
 * CopyRight cosmos
 */
/**
 * @author saif
 */
@Data

public class PaymentPojo {

	public String id;
	String cardHoldeName;
	String cardNumber;
	short cvvNumber;
	String expiryDate;
	String emailid;
	String mobilenum;
	String paymentoption;

	public static List<PaymentPojo> getPayment(ResultSet rs) {
		List<PaymentPojo> pList = new ArrayList<>();
		pList.clear();
		try {
			PaymentPojo pp = new PaymentPojo();
			while (rs.next()) {
				pp.emailid = rs.getString("emailid");
				pp.mobilenum = rs.getString("mobilenum");
				pp.id = rs.getString("id");
				pp.paymentoption = rs.getString("paymentoption");
				pList.add(pp);
			}
		} catch (SQLException ex) {
			Logger.getLogger(PaymentPojo.class.getName()).log(Level.SEVERE, null, ex);
		}
		return pList;
	}

	public static List<PaymentPojo> getPayment2(ResultSet rs) {
		List<PaymentPojo> pList2 = new ArrayList<>();
		pList2.clear();
		try {
			PaymentPojo pp = new PaymentPojo();
			while (rs.next()) {
				pp.cardHoldeName = rs.getString("cardholdename");
				pp.cardNumber = rs.getString("cardnumber");
				pp.cvvNumber = rs.getShort("cvvnumber");
				pp.expiryDate = rs.getString("expirydate");
				pp.emailid = rs.getString("emailid");
				pp.mobilenum = rs.getString("mobilenum");
				pp.id = rs.getString("id");
				pp.paymentoption = rs.getString("paymentoption");
				pList2.add(pp);
			}
		} catch (SQLException ex) {
			Logger.getLogger(PaymentPojo.class.getName()).log(Level.SEVERE, null, ex);
		}
		return pList2;
	}
}
