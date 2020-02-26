package com.mycompany.mp2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;

import com.mycompany.mp2.modal.orderpojo;

/*
 * 
 * CopyRight cosmos
 */
/**
 * @author saif
 */
public class GetProductinfo {

	public static List<orderpojo> getdetials(String id, String tablename) {
		List<orderpojo> productList = new ArrayList<>();
		productList.clear();
		Connection con = null;
		ResultSet rs;
		PreparedStatement ps = null;
		try {
			String query = "select brandname,imagename,genericname,productprice,packaging from " + tablename
					+ " where  id=" + id;
			System.out.println(query);
			con = ConnectionClass.getConnection();
			ps = con.prepareStatement(query);
			rs = ps.executeQuery();
			while (rs.next()) {
				orderpojo op = new orderpojo();
				op.setCompanyname(tablename);
				op.setGenericname(rs.getString("genericname"));
				op.setImagename(rs.getString("imagename"));
				op.setBrandname(rs.getString("brandname"));
				op.setPackaging(rs.getString("packaging"));
				op.setProductprice(rs.getString("productprice"));
				productList.add(op);
			}
			con.close();
		} catch (SQLException ex) {
			Logger.getLogger(GetProductinfo.class.getName()).log(Level.SEVERE, null, ex);
		}
		return productList;
	}
}
