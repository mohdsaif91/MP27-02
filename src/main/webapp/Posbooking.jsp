<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html lang="en">
    <head>
        <title>Matrix Pharmacy Booking</title>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
        <link href="https://fonts.googleapis.com/css?family=Rubik:400,700|Crimson+Text:400,400i" rel="stylesheet">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" href="fonts/icomoon/style.css">

        <link rel = "icon" href =  
              "CompanyLog/icons8-medical-bag-96.png" 
              type = "image/x-icon"> 

        <link rel="stylesheet" href="css/bootstrap.min.css">
        <link rel="stylesheet" href="css/magnific-popup.css">
        <link rel="stylesheet" href="css/jquery-ui.css">
        <link rel="stylesheet" href="css/owl.carousel.min.css">
        <link rel="stylesheet" href="css/owl.theme.default.min.css">
        <link rel="stylesheet" href="css/aos.css">
        <link rel="stylesheet" href="css/style.css">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <script src="js/jquery-3.3.1.min.js"></script>
        <script src="js/main.js"></script>
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

        <style>
            [type=radio] { 
                position: absolute;
                opacity: 0;
                width: 0;
                height: 0;
            }

            /* IMAGE STYLES */
            [type=radio] + img {
                cursor: pointer;
            }

            /* CHECKED STYLES */
            [type=radio]:checked + img {
                outline: 2px solid #f00;
            }
        </style>
    </head>
    <body>
        <div class="site-wrap">
            <div class="site-navbar py-2">
                <div class="search-wrap">
                    <div class="container">
                        <a href="#" class="search-close js-search-close"><span class="icon-close2"></span></a>
                        <input type="text" id="searchproduct" class="form-control" placeholder="Search product name and hit enter...">
                    </div>
                </div>
                <div class="container">
                    <div class="d-flex align-items-center justify-content-between">
                        <div class="logo">
                            <div class="site-logo">
                                <a href="homeController" class="js-logo-clone"><img src="CompanyLog/logo .png"/></a>
                            </div>
                        </div>

                        <div class="main-nav d-none d-lg-block">
                            <nav class="site-navigation text-right text-md-center" role="navigation">
                                <ul class="site-menu js-clone-nav d-none d-lg-block">
                                    <li><a href="homeController">Home</a></li>
                                    <li><a href="product">Products</a></li>
                                    <li><a href="myOrders">My Orders</a></li>
                                    <li><a href="about.jsp">About</a></li>
                                    <li><a href="contact.html">Contact</a></li>
                                    <li><b>${username}</b></li>
                                </ul>
                            </nav>
                        </div>
                        <div class="icons">
                            <a href="#" id="searchwords" class="icons-btn d-inline-block js-search-open"><span class="icon-search"></span></a>
                            <a href="CartShow" class="icons-btn d-inline-block bag">
                                <span class="icon-shopping-bag"></span>
                            </a>
                            <a href="#" class="site-menu-toggle js-menu-toggle ml-3 d-inline-block d-lg-none"><span
                                    class="icon-menu"></span></a>

                            <a class="btn btn-primary dropdown-toggle" href="#" role="icon" id="dropdownMenuLink" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            </a>
                            <div class="dropdown-menu " aria-labelledby="dropdownMenuLink">
                                <a class="dropdown-item" href="signin.jsp">Sign In</a>
                                <a class="dropdown-item" href="signin.jsp">Log Out</a>
                            </div>  
                        </div>
                    </div>
                </div>
            </div>
            <div class="site-section">
                <div class="container">
                    <ul class="nav nav-pills nav-fill">
                        <li class="nav-item active disabled" id="idship">
                            <a class="nav-link" data-toggle="tab" href="#shipping" aria-disabled="true"><h4>Shipping</h4></a>
                        </li>
                        <li class="nav-item" id="idpay">
                            <a class="nav-link" href="#payment" data-toggle="tab" aria-disabled="true"><h4>Payment Method</h4></a>
                        </li>
                        <li class="nav-item" id="idreview">
                            <a class="nav-link" href="#review" data-toggle="tab" aria-disabled="true"><h4>Review</h4></a>
                        </li>
                    </ul>
                    <div class="tab-content" id="tabs">
                        <div class="tab-pane active" id="shipping" >
                            <div class="row">
                                <div class="col-md-4 order-md-2 mb-4">
                                    <h4 class="d-flex justify-content-between align-items-center mb-3">
                                        <span class=" text-primary">Your cart</span>
                                    </h4>
                                    <c:forEach items="${productdetials}" var="lp">
                                        <ul class="list-group mb-3  h5 text-black">
                                            <li class="list-group-item d-flex justify-content-between lh-condensed">
                                                <div>
                                                    <h6 class="my-0" id="tablename">${tablename}</h6>
                                                    <small class="text-muted" id="genericname">${lp.brandname}</small>
                                                </div>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>Price (USD)</span>
                                                <strong ><span class="text-muted" id="productprice"><l>$</l>${lp.productprice}</span></strong>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span><h6 class="my-0" >Quantity- <kl class="text-danger" id="quantity">${quantity}</kl></h6>
                                                </span>
                                                <strong ><h6 class="my-0"> Product Id- <lo class="text-danger" id="productid">${pid}</lo></h6></strong>
                                            </li>
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>Total (USD)</span>
                                                <strong >$<jkl id="jkl">${lp.total}</jkl></strong>
                                            </li>
                                        </ul>
                                        <ul class="mt-2" id="discounttable">
                                            <li class="list-group-item d-flex justify-content-between">
                                                <span>After Discount</span>
                                                <strong><pqr id="pqr"></pqr> $<jkl id="mno"></jkl></strong>
                                            </li>
                                        </ul>
                                        <div class="card p-2">
                                            <div class="input-group">
                                                <input type="text" class="form-control"  id="redemcode" placeholder="Promo code" >
                                                <div class="input-group-append">
                                                    <button  id="getdiscount" class="btn btn-secondary">Redeem</button>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                    <div id="loadingbuffer">
                                        <h4>Processing....</h4>
                                        <div class="spinner-border text-dark mt-2" > </div>
                                    </div>
                                </div>
                                <div class="col-md-8 order-md-1">
                                    <form>
                                        <div class="mb-4">
                                            <b>Personal Details</b>
                                            <hr class="solid" />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="firstName" class=" h5 text-black">First name</label>
                                                <label style="float: right">Required</label>
                                                <input type="text" class="form-control" id="firstName" placeholder=""  required />
                                                <div class="invalid-feedback">
                                                    Valid first name is required.
                                                </div>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label for="lastName" class=" h5 text-black">Last name</label>
                                                <label style="float: right">Required</label>
                                                <input type="text" class="form-control" id="lastName"   required/>
                                                <div class="invalid-feedback">
                                                    Valid last name is required.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 mb-3">
                                                <label for="username" class=" h5 text-black">Username</label>
                                                <label style="float: right">Required</label>
                                                <input type="text" value="${uname}" class="form-control" id="username"/>
                                                <div class="invalid-feedback" style="width: 100%;">
                                                    Your username is required.
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mb-4">
                                            <b>Address Details</b>
                                            <hr class="solid" />
                                        </div>
                                        <div class="mb-3">
                                            <label style="float: right">Required</label>
                                            <label for="address" class=" h5 text-black">Address</label>
                                            <input type="text" class="form-control" id="address1"  required />
                                        </div>
                                        <div class="mb-3">
                                            <label for="address2" class=" h5 text-black">Address 2 <span class="text-muted">(Optional)</span></label>
                                            <input type="text" class="form-control" id="address2"  required />
                                        </div>
                                        <div class="row">
                                            <div class="col-md-3 mb-3">
                                                <label style="float: right">Required</label>
                                                <label for="zip" class=" h5 text-black">Zip</label>
                                                <input type="text" class="form-control"  id="zipcode" required/>
                                            </div>
                                            <div class="col-md-5 mb-3">
                                                <label style="float: right">Required</label>
                                                <label for="country" class=" h5 text-black">City</label>
                                                <input type="text" class="form-control" value="" id="city"  required/>
                                            </div>
                                            <div class="col-md-4 mb-3">
                                                <label style="float: right">Required</label>
                                                <label for="state" class=" h5 text-black">State</label>
                                                <input type="text" class="form-control" value="" id="state"  required/>
                                            </div>
                                            <div class="col-md-6 mb-3">
                                                <label style="float: right">Required</label>
                                                <label for="country" class=" h5 text-black">Country</label>
                                                <input type="text" class="form-control" value="" id="country"  required/>
                                            </div>
                                        </div>
                                        <hr class="mb-4">
                                        <button class="btn btn-primary"  data-toggle="tab" id="payingref" href="#payment" aria-disabled="true"><h4>Payment</h4></button>
                                    </form>
                                </div>
                            </div>
                        </div>
                        <div class="tab-pane" id="payment">
                            <div class="row">
                                <div class="col-12" style="height: 35px;"></div>

                                <div class="col-3 col-sm-3">
                                    <label class="select" id="displaypaypal">
                                        <input type="radio" id="paypal" name="test" value="paypal" checked>
                                        <img class="img-thumbnail" src="medicineimage/icons8-paypal-64.png">
                                        <center>Paypal</center>
                                    </label>
                                </div>
                                <div class="col-3 col-sm-3">
                                    <label class="select" id="displaygpay">
                                        <input type="radio" id="gpay" name="test" value="gpay" >
                                        <img class="img-thumbnail" src="medicineimage/icons8-google-pay-64.png">
                                        <center>Google Pay</center>
                                    </label>
                                </div>
                                <div class="col-3 col-sm-3" id="displayzelle">
                                    <label class="select">
                                        <input type="radio" id="zelle" name="test" value="zelle" >
                                        <img style="height:80px;width: 80px;" class="img-thumbnail" src="medicineimage/3571631-com.minny.zellpay.png">
                                        <center>Zelle</center>
                                    </label>
                                </div>
                                <div class="col-3 col-sm-3">
                                    <label class="select" id="displaycreditcard">
                                        <input type="radio" id="creditcard" name="test" value="creditcard" >
                                        <img class="img-thumbnail" src="medicineimage/icons8-credit-card-64.png">
                                        <center>Credit Card</center>
                                    </label>
                                </div>
                                <div class="col-12" style="height: 35px"></div>
                            </div>
                            <div class="row panel panel-default align-items-center" style="opacity: 0.8;">
                                <div class="row"  id="paypalhide">
                                    <div class="col-12 text-black text-center mb-2">
                                        <b>You will receive payment request on PayPal . Post payment product will dispatched </b>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <label for="mobilennum">Mobile Number</label>
                                        <label style="float: right">Required</label>
                                        <input type="text" class="form-control" id="paypalmobilenum" required>
                                        <div class="invalid-feedback">
                                            Valid Mobile number is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <label for="mobilennum">Email Id</label>
                                        <label style="float: right">Required</label>
                                        <input type="text" class="form-control" id="paypalemailid"  required>
                                        <div class="invalid-feedback">
                                            Valid Mobile number is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <h4 class="getajaxstatuspaypal"></h4>
                                    </div>

                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6" style="padding-top: 30px;">
                                            <button class="btn btn-danger" id="btnpaypal">Get Request By Paypal </button>
                                        </div>
                                        <div class="col-3">
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <h4 class="msgempty"></h4>
                                        <div id="loadingbufferpaypal">
                                            <h4>Processing....</h4>
                                            <div class="spinner-border text-dark mt-2" > </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row " id="gpayhide">
                                    <div class="col-12 text-black text-center mb-2">
                                        <b>You will receive payment request on Google Pay . Post payment product will dispatched </b>
                                    </div>
                                    <div class="col-md-6 mb-3" style="padding-left: 40px;">
                                        <label for="mobilennum">Mobile Number</label>
                                        <input type="text" class="form-control" id="gpaymobilenum" placeholder="1234567890" value="" required>
                                        <div class="invalid-feedback">
                                            Valid Mobile number is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="lastName">Email Id</label>
                                        <input type="text" class="form-control" id="gpayemail" placeholder="" value="${op.lastname}" required>
                                        <div class="invalid-feedback">
                                            Valid last name is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <h4 class="getajaxstatuspaypal"></h4>
                                        <div id="loadingbuffergpay">
                                            <h4>Processing....</h4>
                                            <div class="spinner-border text-dark mt-2" > </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <button class="btn btn-danger" id="btngpay">Get Request On Google Pay </button>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                </div>
                                <div class="row" id="zellehide">
                                    <div class="col-12 text-black text-center mb-2">
                                        <b>You will receive payment request on Zelle . Post payment product will dispatched </b>
                                    </div>
                                    <div class="col-md-6 mb-3"  style="padding-left: 40px;">
                                        <label for="mobilennum">Zelle App Mobile Number</label>
                                        <input type="text" class="form-control" id="zellemobilenum" placeholder="1234567890" value="" required>
                                        <div class="invalid-feedback">
                                            Valid Mobile number is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3">
                                        <label for="lastName">Email Id</label>
                                        <input type="text" class="form-control" id="zelleemail" placeholder=""  required>
                                        <div class="invalid-feedback">
                                            Valid last name is required.
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <h4 class="getajaxstatuspaypal"></h4>
                                        <div id="loadingbufferzell">
                                            <h4>Processing....</h4>
                                            <div class="spinner-border text-dark mt-2" > </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <button class="btn btn-danger" id="btnzelle">Get Request On Zelle </button>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                    <div class="col-1"></div>
                                </div>
                                <div class="row" id="creditcardhide"  style="padding-left: 40px;">
                                    <div class="col-12 text-black text-center mb-2">
                                        <b>By providing your credit card details we will process the payment . Post payment product will dispatched </b>
                                    </div>
                                    <div class="col-6 col-md-6 mb-3">
                                        <label for="mobilennum">Credit Card Holder Name </label>
                                        <input type="text" class="form-control" id="namecreditcard"  required="">
                                        <div class="invalid-feedback">
                                            Credit card number invalid. 
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 mb-3">
                                        <label for="mobilennum">Credit Card Number </label>
                                        <input type="text" class="form-control" id="creditcardnum"  required="">
                                        <div class="invalid-feedback">
                                            Credit card number invalid. 
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 mb-3">
                                        <label for="lastName">CVV Number</label>
                                        <input type="text" class="form-control" id="cvvnumber"  required="">
                                        <div class="invalid-feedback">
                                            CVV number not valid
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 mb-3">
                                        <label for="lastName">Expiry Date MM/YYYY </label>
                                        <input type="text" class="form-control" id="expiryDate"  required="">
                                        <div class="invalid-feedback">
                                            Expiry Date invalid
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 mb-3">
                                        <label for="lastName">Email Id</label>
                                        <input type="email" class="form-control" id="creditemail"  required="">
                                        <div class="invalid-feedback">
                                            Expiry Date invalid
                                        </div>
                                    </div>
                                    <div class="col-6 col-md-6 mb-3">
                                        <label for="lastName">Mobile Number </label>
                                        <input type="text" class="form-control" id="creditmobile"  value="" required="">
                                        <div class="invalid-feedback">
                                            Expiry Date invalid
                                        </div>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <h4 class="getajaxstatuspaypal"></h4>
                                    </div>
                                    <div class="col-md-6 mb-3" id="display"style="padding-left: 35px;">
                                        <h4 class="getajaxstatuspaypal"></h4>
                                        <div id="loadingbuffercc">
                                            <h4>Processing....</h4>
                                            <div class="spinner-border text-dark mt-2" > </div>
                                        </div>
                                    </div>
                                    <div class="row">
                                        <div class="col-3"></div>
                                        <div class="col-6">
                                            <button class="btn btn-danger" id="btncreditcard">Pay Using Credit Card </button>
                                        </div>
                                        <div class="col-3"></div>
                                    </div>
                                </div>
                                <div class="col-1"></div>
                                <div class="col-12" style="height35px"></div>
                            </div>
                            <div class="col-3" style="padding-top: 35px">
                                <button class="btn btn-primary" data-toggle="tab" id="reviewing" href="#review" aria-disabled="true"><h4>Review</h4></button>
                            </div>
                        </div>
                        <!------------------------------------------------------->
                        <div class="tab-pane" id="review">
                            <div class="container">
                                <div class="row">
                                    <div class="well col-xs-12 col-sm-12 col-md-12 ">
                                        <div class="row">
                                            <div class="col-xs-6 col-sm-6 col-md-6">
                                                Name:-<strong id="fullname"></strong><br/>
                                                <div class="d-flex" style="flex-direction: column">
                                                    Address:-<address id="addressdata1"></address>                                                   </address>
                                                    <address id="addressdata2"></address>
                                                </div>
                                            </div>
                                            <div class="col-xs-6 col-sm-6 col-md-6 text-right">
                                                <p>
                                                    Date:-<em id="datedata"></em>
                                                </p>
                                                <p>
                                                    Receipt #: <b id="iddata"></b>
                                                </p>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="text-center">
                                                <h1>Receipt</h1>
                                            </div>
                                            <table class="table table-hover">
                                                <thead>
                                                    <tr>
                                                        <th>Product</th>
                                                        <th>#</th>
                                                        <th class="text-center">Price</th>
                                                        <th class="text-center">Total</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td class="col-md-9"><em id="productnamedata"></em></td>
                                                        <td class="col-md-1" id="quantitydata" style="text-align: center"> 2 </td>
                                                        <td class="col-md-1 text-center" id="pricedata"></td>
                                                        <td class="col-md-1 text-center" id="totaldata"></td>
                                                        <td class="col-md-1 text-center" id="emailid"></td>
                                                        <td class="col-md-1 text-center" id="mobilenum"></td>
                                                    </tr>
                                                </tbody>
                                            </table>


                                        </div>
                                        <div class="row">
                                            <div class="col-4 col-sm-4">
                                                <b class="text-center">Payment Information</b><br/>
                                                <address>
                                                    <h4 style="text-transform:uppercase" id="paymentdata"></h4>
                                                </address>

                                            </div>
                                            <div class="col-4 col-sm-4">
                                                <h6>Product Will Be Delivered Within 15-20 Working days From The Date </h6>
                                                <h6>Of Payment Made Package Will Be Send From USPS</h6>
                                            </div>
                                            <button type="button" id="homecontroller" class="btn btn-success btn-lg btn-block">
                                                Continue Shopping   <span class="glyphicon glyphicon-chevron-right"></span>
                                            </button>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!------------------------------->
                    </div>
                </div>
            </div>
            <footer class="site-footer">
                <div class="container">
                    <div class="row">
                        <div class="col-md-6 col-lg-3 mb-4 mb-lg-0">

                            <div class="block-7">
                                <h3 class="footer-heading mb-4">About Us</h3>
                                <p>A medicine cat has no time for doubt. Put your energy into today and stop worrying about the past.</p>
                            </div>

                        </div>
                        <div class="col-lg-3 mx-auto mb-5 mb-lg-0">
                            <h3 class="footer-heading mb-4">Quick Links</h3>
                            <ul class="list-unstyled">
                                <li class="active"><a href="index.jsp">Home</a></li>
                                <li><a href="myOrders">My Orders</a></li>
                                <li><a href="signin.jsp">Sign In</a></li>
                                <li><a href="about.jsp">About</a></li>
                                <li><a href="contact.jsp">Contact</a></li>
                            </ul>
                        </div>

                        <div class="col-md-6 col-lg-3">
                            <div class="block-5 mb-5">
                                <h3 class="footer-heading mb-4">Contact Info</h3>
                                <ul class="list-unstyled">
                                    <li class="phone"><a href="tel://+918886821109">+91 8886821109</a></li>
                                </ul>
                            </div>


                        </div>
                    </div>
                    <div class="row pt-5 mt-5 text-center">
                        <div class="col-md-12">
                            <p>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                                Copyright &copy;
                                <script>document.write(new Date().getFullYear());</script> All rights reserved | This template is made
                                with <i class="icon-heart" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank"
                                                                                         class="text-primary">Colorlib</a>
                                <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
                            </p>
                        </div>

                    </div>
                </div>
            </footer>
        </div>
    </body> 
    <script>
        $('#getdiscount').click(function () {
            $('#loadingbuffer').show();
            var total = $('#jkl').text();
            var code = $('#redemcode').val();
            if (code !== '') {
                $.ajax({
                    url: 'generateDiscount',
                    type: 'post',
                    data: {
                        total: total,
                        promocode: code
                    }, success: function (response) {
                        $('#getdiscount').attr("disabled", true);
                        $('#discounttable').show();
                        $('#loadingbuffer').hide();
                        $('#jkl').text(response);
                        var txt2 = $("<del></del>").text(total);
                        var txt1 = $("<pqr></pqr>").text(response);
                        $('#mno').append(txt2);
                        $('#pqr').append(txt1);
                    }
                });
            } else {
                $('#loadingbuffer').hide();
                alert("Code is Null");
            }
        });
        $(document).ready(function () {
            $('#discounttable').hide();
            $('#gpayhide').hide();
            $('#creditcardhide').hide();
            $('#zellehide').hide();
            $('#loadingbuffer').hide();
            $('#loadingbufferpaypal').hide();
            $('#loadingbuffergpay').hide();
            $('#loadingbufferzell').hide();
            $('#loadingbuffercc').hide();
            var jo = $('#jkl').text();
            $('#jkl').text(parseFloat(jo).toFixed(2));
        });
        $('#displayzelle').click(function () {
            $('#creditcardhide').hide();
            $('#zellehide').show();
            $('#paypalhide').hide();
            $('#gpayhide').hide();
        });
        $('#displaygpay').click(function () {
            $('#creditcardhide').hide();
            $('#zellehide').hide();
            $('#paypalhide').hide();
            $('#gpayhide').show();
        });
        $('#displaypaypal').click(function () {
            $('#paypalhide').show();
            $('#creditcardhide').hide();
            $('#zellehide').hide();
            $('#gpayhide').hide();
        });
        $('#displaycreditcard').click(function () {
            $('#creditcardhide').show();
            $('#zellehide').hide();
            $('#paypalhide').hide();
            $('#gpayhide').hide();
        });
        $('#payingref').click(function () {
            senddatausingajax();
            $('#idship').removeClass('active');
            $('#idpay').addClass('active');
        });
        $('#reviewing').click(function () {
            $('#idpay').removeClass('active');
            $('#idreview').addClass('active');
        });
        $('#btnpaypal').click(function () {
            $('#loadingbufferpaypal').show();
            var paypalmob = $('#paypalmobilenum').val();
            var paypalemailid = $('#paypalemailid').val();
            $.ajax({
                url: 'Userinputfordelivery',
                type: "get",
                data: {
                    tablename: 'paypal',
                    mobile: paypalmob,
                    emailid: paypalemailid
                }, success: function (responseText) {
                    $('.getajaxstatuspaypal').text(responseText);
                    $('#reviewing').click();
                }
            });
        });
        $('#homecontroller').click(function () {
            document.location.href = 'homeController';
        });
        $('#btngpay').click(function () {
            $('#loadingbuffergpay').show();
            var gpaymob = $('#gpaymobilenum').val();
            var gpayemail = $('#gpayemail').val();
            $.ajax({
                url: 'Userinputfordelivery',
                type: "get",
                data: {
                    tablename: 'gpay',
                    mobile: gpaymob,
                    emailid: gpayemail
                }, success: function (responseText) {
                    $('.getajaxstatuspaypal').text(responseText);
                    $('#reviewing').click();
                }
            });
        });
        $('#reviewing').click(function () {
            $.get('Userinputfordelivery', {tablename: 'review'}, function (responseText) {
                if (responseText !== null) {
                    $.each(responseText, function (key, value) {
                        var id = value.id;
                        var fname = value.firstname;
                        var lname = value.lastname;
                        var date = value.yyyy_mm_dd;
                        var address1 = value.address1;
                        var address2 = value.address2;
                        var genericname = value.genericname;
                        var brandname = value.brandname;
                        var quantity = value.quantity;
                        var price = value.productprice;
                        var ogprice = parseFloat(price).toFixed(2);
                        var total = ogprice;
                        var payment = value.paymentoption;
                        var emailid = value.emailid;
                        var mobilenum = value.mobilenum;
                        $('#fullname').text(fname + lname);
                        $('#iddata').text(id);
                        $('#addressdata1').text(address1);
                        $('#addressdata2').text(address2);
                        $('#datedata').text(date);
                        $('#productnamedata').text('GenericName-' + genericname + ' Brandname-' + brandname);
                        $('#quantitydata').text(quantity);
                        $('#pricedata').text(ogprice);
                        $('#totaldata').text(total);
                        $('#paymentdata').text(payment);
                        $('#emailid').text(emailid);
                        $('#mobilenum').text(mobilenum);
                    });
                }
            });
        });
        $('#btnzelle').click(function () {
            $('#loadingbufferzell').show();
            var zellemob = $('#zellemobilenum').val();
            var zelleemail = $('#zelleemail').val();
            $.ajax({
                url: 'Userinputfordelivery',
                type: "get",
                data: {
                    tablename: 'zelle',
                    mobile: zellemob,
                    emailid: zelleemail
                }, success: function (responseText) {
                    $('.getajaxstatuspaypal').text(responseText);
                    $('#reviewing').click();
                }
            });
        });
        $('#btncreditcard').click(function () {
            $('#loadingbuffercc').show();
            var name = $('#namecreditcard').val();
            var creditcardnum = $('#creditcardnum').val();
            var cvv = $('#cvvnumber').val();
            var expirydate = $('#expiryDate').val();
            var emailid = $("#creditemail").val();
            var mobile = $("#creditmobile").val();
            alert(name + creditcardnum + cvv + expirydate + emailid + mobile);
            if (name !== '' && creditcardnum !== '' && expirydate !== '' && emailid !== '' && mobile !== '') {
                $.ajax({
                    url: 'Userinputfordelivery',
                    type: "get",
                    data: {
                        tablename: 'creditcard',
                        name: name,
                        creditcard: creditcardnum,
                        cvv: cvv,
                        expirydate: expirydate,
                        emialid: emailid,
                        mobilenum: mobile
                    }, success: function (responseText) {
                        $('.getajaxstatuspaypal').text(responseText);
                        $('#reviewing').click();
                    }
                });
            } else {
                alert("value is null");
            }
        });
        function senddatausingajax() {
            $('#loadingbuffer').show();
            var productid = document.getElementById("productid").textContent;
            var fname = $('#firstName').val();
            var lname = $('#lastName').val();
            var uname = $('#username').val();
            var email = $('#email').val();
            var address1 = $('#address1').val();
            var address2 = $('#address2').val();
            var country = $('#country').val();
            var state = $('#state').val();
            var zipcode = $('#zipcode').val();
            var rcode = $('#redemcode').val();
            var city = $('#city').val();
            var mobilenum = $('#mobilenum').val();
            var quantity = document.getElementById('quantity').textContent;
            var genericname = document.getElementById('genericname').textContent;
            var tablename = document.getElementById('tablename').textContent;
            var pprice = document.getElementById('jkl').textContent;
            if ($.isNumeric(pprice) && fname !== '' && lname !== '' && uname !== '' && address1
                    !== '' && country !== '' && zipcode !== '' && country !== '' && city !== '') {
                $.ajax({
                    url: 'Userinputfordelivery',
                    type: "post",
                    data: {
                        id: productid,
                        tablename: tablename,
                        fName: fname,
                        lname: lname,
                        uName: uname,
                        aDdress1: address1,
                        aDdress2: address2,
                        cOuntry: country,
                        sTate: state,
                        zIpcode: zipcode,
                        rCode: rcode,
                        gEnericname: genericname,
                        pPrice: pprice,
                        city: city,
                        quantity: quantity
                    }, success: function (status) {
                    }
                });
            } else {
                alert("Values are not filed");
                location.reload(true);
            }
        }
    </script>
</html>