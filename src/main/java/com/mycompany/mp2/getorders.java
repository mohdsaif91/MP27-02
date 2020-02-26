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
import java.util.Arrays;
import java.util.List;
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
public class getorders extends HttpServlet {

	Connection con;
	ResultSet rs;
	PreparedStatement ps;
	int preorder = 0;
	int postorder = 0;
	int packaging = 0;

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		Thread th = new Thread(() -> {
			getAllCount();
		});
		th.start();
		System.out.println(preorder + "-" + postorder + "-" + packaging);
		request.setAttribute("preorder", preorder);
		request.setAttribute("postorder", postorder);
		request.setAttribute("packageorder", packaging);
		request.getRequestDispatcher("adminhome.jsp").forward(request, response);
	}

	private void getAllCount() {
		List<Integer> listInt = new ArrayList<>();
		try {
			List<String> tableList = Arrays.asList("adminordertable", "packagepojo");
			String[] yesno = { "no", "yes" };
			for (int i = 0; i <= 2; i++) {
				if (i < 2) {
					String query = "select count(*) from " + tableList.get(0) + " where paymentdoen='" + yesno[i] + "'";
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
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	}

}
