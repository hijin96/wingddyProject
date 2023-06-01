<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">

    <!-- Mobile Metas -->
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Site Metas -->
    <title>ThewayShop - Ecommerce Bootstrap 4 HTML Template</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <meta name="author" content="">

    <!-- Site Icons -->
    <link rel="shortcut icon" href="images/favicon.ico" type="image/x-icon">
    <link rel="apple-touch-icon" href="images/apple-touch-icon.png">

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="css/bootstrap.min.css">
    <!-- Site CSS -->
    <link rel="stylesheet" href="css/style.css">
    <!-- Responsive CSS -->
    <link rel="stylesheet" href="css/responsive.css">
    <!-- Custom CSS -->
    <link rel="stylesheet" href="css/custom.css">

<meta charset="UTF-8">
<title>장바구니</title>
</head>
<body>
    <div id="app">
        <div>
            <jsp:include page="../sideBar/sideBar.jsp" />
             <div class="main-content">
                 <br><br><br><br><br><br><br>
                        
                    <!-- Start Cart  -->
                    <div class="cart-box-main">
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-12">
                                    <div class="table-main table-responsive">
                                        <table class="table">
                                            <thead>
                                                <tr>
                                                    <th>체크박스</th>
                                                    <th>Images</th>
                                                    <th>Product Name</th>
                                                    <th>Price</th>
                                                    <th>Quantity</th>
                                                    <th>Total</th>
                                                    <!-- <th>Remove</th> -->
                                                </tr>
                                            </thead>
                                            <tbody>
                                              
                                                <tr>
                                                    <td>
                                                        <input type="checkbox" value="cart-checkbox"/>
                                                    </td>
                                                    <td class="thumbnail-img">
                                                        <a href="#"> <img class="img-fluid" src="images/img-pro-03.jpg" alt="" /></a>
                                                    </td>
                                                    <td class="name-pr">
                                                        <a href="#"> Lorem ipsum dolor sit amet  </a>
                                                    </td>
                                                    <td class="price-pr">
                                                        <p>$ 30.0</p>
                                                    </td>
                                                    <td class="quantity-box"><input type="number" size="4" value="1" min="0" step="1" class="c-input-text qty text"></td>
                                                    <td class="total-pr">
                                                        <p>$ 80.0</p>
                                                    </td>
                                                    <!-- <td class="remove-pr">
                                                        <a href="#"> <i class="fas fa-times"></i></a>
                                                    </td> -->
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>

                            <div class="row my-5">
                                <div class="col-lg-6 col-sm-6">
                                    <div class="coupon-box">
                                        <!-- <div class="input-group input-group-sm">
                                            <input class="form-control" placeholder="Enter your coupon code" aria-label="Coupon code" type="text">
                                            <div class="input-group-append">
                                                <button class="btn btn-theme" type="button">Apply Coupon</button>
                                            </div>
                                        </div> -->
                                    </div>
                                </div>
                                <div class="col-lg-6 col-sm-6">
                                    <div class="update-box">
                                        <input value="Update Cart" type="submit"> 
                                    </div>
                                </div>
                            </div>

                            <div class="row my-5">
                                <div class="col-lg-8 col-sm-12"></div>
                                <div class="col-lg-4 col-sm-12">
                                    <div class="order-box">
                                        <h3>Order summary</h3>
                                        <div class="d-flex">
                                            <h4>Sub Total</h4>
                                            <div class="ml-auto font-weight-bold"> $ 130 </div>
                                        </div>
                                        <div class="d-flex">
                                            <h4>Discount</h4>
                                            <div class="ml-auto font-weight-bold"> $ 40 </div>
                                        </div>
                                        <hr class="my-1">
                                        <div class="d-flex">
                                            <h4>Coupon Discount</h4>
                                            <div class="ml-auto font-weight-bold"> $ 10 </div>
                                        </div>
                                        <div class="d-flex">
                                            <h4>Tax</h4>
                                            <div class="ml-auto font-weight-bold"> $ 2 </div>
                                        </div>
                                        <div class="d-flex">
                                            <h4>Shipping Cost</h4>
                                            <div class="ml-auto font-weight-bold"> Free </div>
                                        </div>
                                        <hr>
                                        <div class="d-flex gr-total">
                                            <h5>Grand Total</h5>
                                            <div class="ml-auto h5"> $ 388 </div>
                                        </div>
                                        <hr> </div>
                                </div>
                                <div class="col-12 d-flex shopping-box"><a href="checkout.html" class="ml-auto btn hvr-hover">Checkout</a> </div>
                            </div>

                        </div>
                    </div>
                 <!-- End Cart -->
            </div>
    
        </div>
    </div>
</body>
</html>