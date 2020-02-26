/*
 * 
 * CopyRight cosmos
 */
package com.mycompany.mp2.modal;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import lombok.Data;

/**
 * @author saif
 */
@Data

public class AllProduct {

	int id;
	String imagename;

	String productdescription;
	String productprice;
	String brandname;
	String genericname;
	String packaging;
	String company;

	public static List<AllProduct> getList(ResultSet rs) throws SQLException {
		List<AllProduct> getAll = new ArrayList<>();
		getAll.clear();
		while (rs.next()) {
			AllProduct ap = new AllProduct();
			ap.id = rs.getInt("id");
			ap.imagename = rs.getString("imagename");
			ap.productdescription = rs.getString("productdescription");
			ap.productprice = rs.getString("productprice");
			ap.brandname = rs.getString("brandname");
			ap.genericname = rs.getString("genericname");
			ap.packaging = rs.getString("packaging");
			ap.company = rs.getString("company");
			getAll.add(ap);
		}
		return getAll;
	}
}
