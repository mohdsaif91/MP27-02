package com.mycompany.mp2.modal;

import java.util.ArrayList;
import java.util.List;
import lombok.Data;

/**
 * @author saif
 */
@Data
public class AllDataPojo {

	List<adminordertable> adminlist = new ArrayList<adminordertable>();
	List<PaymentPojo> paylist = new ArrayList<PaymentPojo>();

}
