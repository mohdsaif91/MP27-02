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
import java.util.List;
import java.util.concurrent.TimeUnit;
import java.util.logging.Level;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mycompany.mp2.modal.HelperPackagePojo;
import com.mycompany.mp2.modal.PackagePojo;
import com.mycompany.mp2.modal.adminordertable;

/**
 *
 * @author saif
 */
public class AdminOrder extends HttpServlet {

	Connection con;
	PreparedStatement ps;
	ResultSet rs;
	List<adminordertable> lo = new ArrayList<>();
	static List<PackagePojo> plo = new ArrayList<>();

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String pay = request.getParameter("pay");
		if (pay.equals("per")) {
			try {
				String querypre = "select * from adminordertable where paymentdoen='no' order by yyyy_mm_dd DESC ";
				System.out.println(querypre);
				con = ConnectionClass.getConnection();
				ps = con.prepareStatement(querypre);
				rs = ps.executeQuery();
				lo = adminordertable.getAllColumn(rs);
				con.close();
				int size = lo.size();
				if (size == 0) {
					request.setAttribute("noorder", "There are no Orders For Delivery");
				}
				request.setAttribute("paymsg", "Payment Not Doen");
				request.setAttribute("orderList", lo);
				singin.populate(lo);
				request.getRequestDispatcher("AdminOrder.jsp").forward(request, response);
			} catch (SQLException ex) {
				Logger.getLogger(AdminOrder.class.getName()).log(Level.SEVERE, null, ex);
			}
		} else if (pay.equals("post")) {
			try {
				String querypre = "select * from adminordertable where paymentdoen='yes' order by yyyy_mm_dd DESC ";
				System.out.println(querypre);
				con = ConnectionClass.getConnection();
				ps = con.prepareStatement(querypre);
				rs = ps.executeQuery();
				lo = adminordertable.getAllColumn(rs);
				con.close();
				singin.populate(lo);
				int size = lo.size();
				if (size == 0) {
					request.setAttribute("noorder", "There are no Orders For Delivery");
				}
				request.setAttribute("paymsg", "Payment Doen");
				request.setAttribute("orderList", lo);
				request.getRequestDispatcher("AdminOrder.jsp").forward(request, response);
			} catch (SQLException ex) {
				Logger.getLogger(AdminOrder.class.getName()).log(Level.SEVERE, null, ex);
			}
		} else if (pay.equals("pack")) {
			try {
				String querypre = "select * from PackagePojo order by yyyy_mm_dd DESC ";
				System.out.println(querypre);
				con = ConnectionClass.getConnection();
				ps = con.prepareStatement(querypre);
				rs = ps.executeQuery();
				plo = PackagePojo.getAllColumn(rs);
				con.close();
				int size = plo.size();
				if (size == 0) {
					request.setAttribute("Packagemsg", "No Order to display");
				}
				packageHelper();
				deletefrompackage(plo);
				request.setAttribute("packageList", plo);
				request.getRequestDispatcher("PackageDisplay.jsp").forward(request, response);
			} catch (SQLException ex) {
				Logger.getLogger(AdminOrder.class.getName()).log(Level.SEVERE, null, ex);
			}
		}
	}

	public static List<PackagePojo> packageHelper() {
		HelperPackagePojo hpp = new HelperPackagePojo();
		hpp.setLi(plo);
		return plo;
	}

	private void deletefrompackage(List<PackagePojo> pList) {
		int days = getDays();
		System.out.println("Days for deleting " + days);
		Calendar cal = Calendar.getInstance();
		java.sql.Date date = new java.sql.Date(cal.getTime().getTime());
		List<PackagePojo> ldata = new ArrayList<>();
		pList.forEach(s -> {
			long diffday = s.getYyyy_mm_dd().getTime() - date.getTime();
			String fordelete = s.getId();
			System.out.println(
					s.getYyyy_mm_dd() + "<- " + TimeUnit.DAYS.convert(diffday, TimeUnit.MILLISECONDS) + " ->" + date);
			int ogdate = (int) diffday;
			int day = (int) Math.abs(TimeUnit.DAYS.convert(diffday, TimeUnit.MILLISECONDS));
			if (day >= days) {
				try {
					System.out.println(s.toString());
					System.out.println("to Delete");
					String query = "delete from PackagePojo where id='" + fordelete + "'";
					System.out.println("-----------------------");
					System.out.println(query);
					System.out.println("-----------------------");
					con = ConnectionClass.getConnection();
					ps = con.prepareStatement(query);
					ps.executeUpdate();
					con.close();
					System.out.println("<>><><><<>><<>><><for deletig " + fordelete + " <>><><<><>><><><");
					System.out.println(TimeUnit.DAYS.convert(diffday, TimeUnit.MILLISECONDS) <= 30);
				} catch (SQLException ex) {
					Logger.getLogger(AdminOrder.class.getName()).log(Level.SEVERE, null, ex);
				}

			} else {
				System.out.println("|||||||||||||||||||||");
				System.out.println(s.toString());
				System.out.println(TimeUnit.DAYS.convert(diffday, TimeUnit.MILLISECONDS) <= 30);
				System.out.println("not to delete " + s.getYyyy_mm_dd());
			}
		});
		System.out.println(ldata.size());
	}

	private int getDays() {
		int days = 0;
		try {
			String query = "select days from daystable";
			System.out.println(query);
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				days = Integer.parseInt(rs.getString("days"));
			}
			con.close();
		} catch (SQLException ex) {
			Logger.getLogger(AdminOrder.class.getName()).log(Level.SEVERE, null, ex);
		}
		return days;
	}
}
