<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="register.aspx.cs" Inherits="Karaulians.register" %>

<!DOCTYPE html>
<html>
<head>
    <style>
        #profile_div {
            margin-left: 100px;
        }

        input.error {
            border: 2px dotted #cc5965;
        }
    </style>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <title>Registration panel</title>
    <!-- Tell the browser to be responsive to screen width -->
    <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
    <!-- Bootstrap 3.3.6 -->
    <link href="assets/css/bootstrap.min.css" rel="stylesheet" />
    <!-- Font Awesome -->
    <link rel=" stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <!-- Theme style -->
    <link href="assets/css/AdminLTE.min.css" rel="stylesheet" />
    <!-- iCheck -->
    <link href="assets/css/blue.css" rel="stylesheet" />
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body class="hold-transition login-page">
    <div class="login-box">
        <div class="login-logo">
            <a href="#"><b>Registration</b></a>
        </div>
        <!-- /.login-logo -->
        <div class="login-box-body">
            <label id="lblError">
            </label>
            <p class="login-box-msg">Sign in to start your session</p>
            <form class="m-t" id="myForm" role="form" action="javascript:;">
                <div class="form-group" id="profile_div">
                    <label title="Upload image file" for="inputImage">
                        <input type="file" accept="image/*" name="file" id="inputImage" class="hide" onchange="readURL(this);">
                        <img id='profile_pic' data-src="" src="assets/css/images/profile.png" style='cursor: pointer; height: auto; width: 100%; max-width: 120px' />
                    </label>
                </div>

                <div class="form-group has-feedback">
                    <input type="text" placeholder="Name" name="uname" class="form-control required" id="username" />

                </div>
                <div class="form-group has-feedback">
                    <input type="text" placeholder="Email" name="uemail" required="" class="form-control required" id="email" />

                </div>
                <div class="form-group has-feedback">
                    <input type="password" placeholder="Password" name="upwd" required="" class="form-control required" id="password" />

                </div>


                <div class="form-group has-feedback">
                    <input type="text" placeholder="Mobile" name="umobile" required="" class="form-control" id="umobile" />

                </div>

                <div class="row">

                    <div class="col-xs-12">
                        <button type="button" class="btn btn-primary btn-block btn-flat" id="btnRegister">Register</button>
                    </div>
                    <!-- /.col -->
                </div>
            </form>

            <div class="social-auth-links text-center">
                <p>- OR -</p>
                <a href="#" class="btn btn-block btn-social btn-facebook btn-flat">
                    <i class="fa fa-facebook"></i>Sign in using
                    Facebook
                </a>
                <a href="#" class="btn btn-block btn-social btn-google btn-flat">
                    <i class="fa fa-google-plus"></i>Sign in using
                    Google+
                </a>
            </div>
            <!-- /.social-auth-links -->
            <a href="Login.aspx">I already have a membership</a>

            <!-- /.login-box -->
            <!-- jQuery 2.2.3 -->

            <script src="assets/js/jquery.min.js"></script>
            <!-- Bootstrap 3.3.6 -->
            <script src="assets/js/bootstrap.min.js"></script>

            <!-- iCheck -->
            <script src="assets/js/icheck.min.js"></script>
            <script>
                $(function () {
                    $('input').iCheck({
                        checkboxClass: 'icheckbox_square-blue',
                        radioClass: 'iradio_square-blue',
                        increaseArea: '20%' // optional
                    });
                });
            </script>
            <script>
                $(document).ready(function () {
                    $("#lblError").text('');
                    $('#myForm').each(function () {
                        $(this).find('input').keypress(function (e) {
                            // Enter pressed?
                            if (e.which == 10 || e.which == 13) {
                                $("#btnRegister").trigger("click");
                            }
                        });
                    });
                });
                $('#btnRegister').click(function () {
                    debugger;
                    var retval = true;
                    $("#myForm .required").each(function () {
                        if (!$(this).val()) {
                            $(this).addClass("error");
                            retval = false;
                        }
                        else {
                            $(this).removeClass("error");
                        }
                    });


                    var email = $("#email").val().trim();
                    var first_name = $("#username").val().trim();
                    var mobile = $("#umobile").val().trim();

                    if (email && !isEmail(email)) {
                        $("#email").addClass("error");
                        retval = false;
                    }

                    var password = $("#password").val();
                    if (password.length < 6 || password == "") {
                        $("#password").addClass("error");
                        $("#lblError").text("The Password must be at least 6 characters long").css({ 'display': 'block', 'color': 'red' });
                        retval = false;
                    }
                    else {
                        $("#lblError").text('');
                        retval = true;
                    }


                    if (retval) {

                        $.ajax({
                            url: '/api/service/SaveUser',
                            type: 'POST',
                            data: {
                                id: "0",
                                first_name: $("#username").val(),
                                email: $('#email').val(),
                                password: $('#password').val(),
                                profile_pic: $("#profile_pic").attr("src"),
                                mobile: $('#umobile').val()
                            },
                            success: function (response) {
                                if (response.status == 'Success') {
                                    window.location = "/login.aspx";
                                } else {
                                    console.log(response);
                                }
                                $("#btnRegister").removeAttr("disabled");
                            },
                            failure: function (response) {
                                $("#btnRegister").removeAttr("disabled");
                            }
                        });
                    }
                    else {
                        $("#btnRegister").removeAttr("disabled");
                    }
                });

                //Preview Image
                function readURL(input) {
                    if (input.files && input.files[0]) {
                        var reader = new FileReader();

                        reader.onload = function (e) {
                            debugger;
                            $('#profile_pic')
                                .attr('src', e.target.result)
                                .width(100)
                                .height(120);
                        };

                        reader.readAsDataURL(input.files[0]);
                    }
                }

                //Email checker
                function isEmail(email) {
                    var regex = /^([a-zA-Z0-9_.+-])+\@(([a-zA-Z0-9-])+\.)+([a-zA-Z0-9]{2,4})+$/;
                    return regex.test(email);
                }

                //function ValidateForm() {
                //    var retval = true;
                //    debugger;
                //    if ($("#username").val() == "" || $("#username").val() == null) {
                //        $("#username").css('border', '2px dotted #cc5965');
                //        retval = false;
                //    }
                //    //if ($("#umobile").val() == "" || $("#umobile").val() == null) {
                //    //    $("#umobile").css('border', '2px dotted #cc5965');
                //    //    retval = false;
                //    //}
                //    //else { $("#umobile").css('border', ''); retval = true; }
                //    var email = $("#email").val().trim();
                //    if (email && !isEmail(email) || email == "") {
                //        $("#email").css('border', '2px dotted #cc5965');
                //        retval = false;
                //    } else { $("#email").css('border', ''); retval = true; }
                //    var password = $("#password").val();
                //    if (password.length < 6 || password == "") {
                //        $("#password").css('border', '2px dotted #cc5965');
                //        $("#lblError").text("The Password must be at least 6 characters long").css({ 'display': 'block', 'color': 'red' });
                //        retval = false;
                //    }
                //    else {
                //        $("#lblError").text('');
                //        retval = true;
                //    }
                //    //var Confirmpassword = $("#cpassword").val();
                //    //if (password != "" || password == "") {
                //    //    $("#lblError").text("Password cannot be null").css({ 'display': 'block', 'color': 'red' });
                //    //    retval = false;
                //    //    if (password.length < 6 || password.length > 30 && password == "") {
                //    //        debugger;
                //    //        retval = false;
                //    //        $("#lblError").text("The Password must be at least 6 characters long").css({ 'display': 'block', 'color': 'red' });
                //    //    }
                //    //    else { $("#lblError").css('display', 'none'); retval = true; }
                //    //}
                //    //if (password != Confirmpassword || password & Confirmpassword == "") {
                //    //    retval = false;
                //    //    $("#cpassword").css('border', '2px dotted #cc5965');
                //    //    $("#lblError").text("Sorry this entry does not match your original Password, please try again").css({ 'display': 'block', 'color': 'red' });
                //    //}
                //    //else {
                //    //    $("#cpassword").removeAttr("border");
                //    //}
                //    return retval;
                //}
            </script>
        </div>
    </div>
</body>
</html>
