<!DOCTYPE html>
<html lang="en">
    <head>
        <title>Login</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <script src="http://code.jquery.com/jquery-latest.js"></script>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
        <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
        <style>
            .login,
            .image {
                min-height: 100vh;
            }
            .jack{
                background-color: #C0FEF8;
            }

            .bg-image {
                background-image: url('medicineimage/images/signuppharmacy.jpg');
                background-size: cover;
                background-position: center center;
            }
        </style>
    </head>
    <body>
        <div class="container-fluid">
            <div class="row ">
                <!-- The image half -->
                <div class="col-md-6 d-md-flex bg-image">
                </div>
                <!-- The content half -->
                <div class="col-md-6 bg-light  ">
                    <div class="login d-flex  py-5">
                        <!-- Demo content-->
                        <div class="container">
                            <div class="row">
                                <div class="col-lg-10 col-xl-7 mx-auto">
                                    <h3 class="display-4">Pharmacy</h3>
                                    <p class="text-muted mb-4"></p>
                                    <form action="BuyNow" method="post">
                                        <div class="form-group mb-3">
                                            <input type="text" name="firstname" class="form-control" id="inputGroupFile01" required="can't be null" placeholder="First Name">
                                        </div>
                                        <div class="form-group mb-3">
                                            <input type="text" name="lastname" class="form-control" id="inputGroupFile01" required="can't be null" placeholder="Last Name">
                                        </div>
                                        <div class="form-group mb-3">
                                            <input type="text" name="username" class="form-control" id="username" required="can't be null" placeholder="User name">
                                        </div>
                                        <div class="form-group mb-3">
                                            <input type="password" id="password" name="passsword" class="form-control" required="can't be null"  placeholder="Password">
                                        </div>
                                        <div class="form-group mb-3">
                                            <input type="password" id="conform_password" name="Conform Password" required="can't be null" class="form-control"  placeholder="Conform Password ">
                                            <span id='message'></span>
                                        </div>
                                        <button type="submit" class="btn btn-danger btn-block text-uppercase mb-2 rounded-pill shadow-sm" id="fan">Sign Up</button>
                                    </form>
                                    <button type="submit" class="btn btn-primary btn-block text-uppercase mb-2 rounded-pill shadow-sm" id="signin">Sign in</button>
                                </div>
                            </div>
                            <center>${msgs}</center>
                        </div>
                    </div><!-- End -->

                </div>
            </div><!-- End -->

        </div>
    </div>
</body>
<script src="js/jquery-3.3.1.min.js"></script>
<script src="js/jquery-ui.js"></script>
<script src="js/popper.min.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/owl.carousel.min.js"></script>
<script src="js/jquery.magnific-popup.min.js"></script>
<script src="js/aos.js"></script>
<script>
    $('#password, #conform_password').on('keyup', function () {
        if ($('#password').val() === $('#conform_password').val()) {
            $('#message').html('Matching').css('color', 'green');
        } else
            $('#message').html('Not Matching').css('color', 'red');
    });
    $('#signin').click(function(){
       document.location.href="signin.jsp";
    });


</script>

<script src="js/main.js"></script>
</html>