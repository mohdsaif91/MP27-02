
package com.mycompany.mp2;
/*
 * 
 
* CopyRight cosmos
 */

import java.io.IOException;
import java.util.List;
import java.util.stream.Collectors;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import com.mycompany.mp2.modal.PackagePojo;

/**
 *
 * @author saif
 */
public class PackageDisplay extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String orderid = request.getParameter("orderid");
		String ogid = orderid.trim();
		List<PackagePojo> pList = AdminOrder.packageHelper();
		System.out.println("Size of he list " + pList.size());
		List<PackagePojo> uniqueDataById = pList.stream().filter(s -> s.id.equals(ogid)).collect(Collectors.toList());
		request.setAttribute("packageList", uniqueDataById);
		request.getRequestDispatcher("displayPackage.jsp").forward(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
