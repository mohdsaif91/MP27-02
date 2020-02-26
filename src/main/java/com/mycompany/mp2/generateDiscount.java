package com.mycompany.mp2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author saif
 */
public class generateDiscount extends HttpServlet {

	String alphanum = "";
	String AlphNumeric = "ABCDEFGHIJKLMNOPRSTUVWXYZ01234567890abcdefghijklmnopqstuvwxyz";
	int length = 15;
	DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy");
	StringBuilder sb = new StringBuilder(length);
	int intdata = 0;
	String e = "";
	String data = "";
	int discount = 0;
	String msg = "";
	Connection con;
	PreparedStatement ps;
	ResultSet rs;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			sb = new StringBuilder();
			e = LocalDate.now().format(formatter);
			data = request.getParameter("data");
			intdata = Integer.parseInt(data);
			System.out.println(e + " " + data + " " + intdata);
			for (int i = 0; i < length; i++) {
				int index = (int) (AlphNumeric.length() * Math.random());
				sb.append(AlphNumeric.charAt(index));
			}
			System.out.println(sb.toString());
			String query = "insert into discountCode(code,discount,dt,used)values('" + sb.toString() + "'," + intdata
					+ ",'" + e + "','false')";
			System.out.println(query);
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(query);
			ps.execute();
			con.close();
			response.setContentType("text/plain");
			response.getWriter().print(sb.toString());
		} catch (SQLException ex) {
			Logger.getLogger(generateDiscount.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			String total = request.getParameter("total");
			double inttotal = Double.parseDouble(total);
			String promocode = request.getParameter("promocode");
			String query = "select discount from discountcode where code='" + promocode.trim() + "' and used=" + false
					+ "";
			System.out.println(query);
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				discount = rs.getInt("discount");
			}
			con.close();
			if (discount == 0) {
				msg = "no promocode found";
			} else {
				double finaldiscount = inttotal - (inttotal * discount) / 100;
				msg = String.valueOf(finaldiscount);
				updatetable(promocode.trim());
			}
			response.setContentType("text/plain");
			System.out.println("Discout ->" + msg);
			response.getWriter().write(msg);

		} catch (SQLException ex) {
			Logger.getLogger(generateDiscount.class.getName()).log(Level.SEVERE, null, ex);
		}

	}

	private void updatetable(String trim) throws SQLException {
		try {
			String query = "select discount from discountcode where code='" + trim.trim() + "'";
			System.out.println(query);
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(query);
			int result = ps.executeUpdate();
			if (result != 0) {
				System.out.println("deleted");
			} else {
				System.out.println("Not ");
			}
		} catch (SQLException ex) {
			Logger.getLogger(generateDiscount.class.getName()).log(Level.SEVERE, null, ex);
		} finally {
			con.close();
		}

	}

}
