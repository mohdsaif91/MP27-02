/*
 * 
 * CopyRight cosmos
 */
package com.mycompany.mp2.modal;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;

/**
 * @author saif
 */
@Data
public class cartHelperPojo {

	List<orderpojo> lo = new ArrayList();
	String id;
	String username;
	String quantity;
	String companyname;

}
