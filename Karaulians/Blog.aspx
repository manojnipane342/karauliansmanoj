<%@ Page Title="" Language="C#" MasterPageFile="~/home.Master" AutoEventWireup="true" CodeBehind="Blog.aspx.cs" Inherits="Karaulians.Blog" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
        .container-fluid {
            padding-right: 0px;
            padding-left: 0px;
        }

        .navbar-brand {
            position: relative;
            z-index: 2;
        }

        .navbar-nav.navbar-right .btn {
            position: relative;
            z-index: 2;
            padding: 4px 20px;
            margin: 10px auto;
        }

        .navbar .navbar-collapse {
            position: relative;
        }

            .navbar .navbar-collapse .navbar-right > li:last-child {
                padding-left: 22px;
            }

        .navbar .nav-collapse {
            position: absolute;
            z-index: 1;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            margin: 0;
            padding-right: 120px;
            padding-left: 80px;
            width: 100%;
        }

        .navbar.navbar-default .nav-collapse {
            background-color: #f8f8f8;
        }

        .navbar.navbar-inverse .nav-collapse {
            /*background-color: #222;*/
        }

        .btn-danger {
            color: #fff;
            background-color: #1b1a1a;
            border-color: #ffffff;
        }

        .navbar .nav-collapse .navbar-form {
            border-width: 0;
            box-shadow: none;
        }

        .nav-collapse > li {
            float: right;
        }

        .btn.btn-circle {
            border-radius: 50px;
        }

        .btn.btn-outline {
            background-color: transparent;
        }

        @media screen and (max-width: 767px) {
            .navbar .navbar-collapse .navbar-right > li:last-child {
                padding-left: 15px;
                padding-right: 15px;
            }

            .navbar .nav-collapse {
                margin: 7.5px auto;
                padding: 0;
            }

                .navbar .nav-collapse .navbar-form {
                    margin: 0;
                }

            .nav-collapse > li {
                float: none;
            }
        }

        body {
            font-size: 14px;
        }

        section {
            padding: 60px 0px;
            font-family: 'Raleway', sans-serif;
        }

        h2 {
            color: #4C4C4C;
            word-spacing: 5px;
            font-size: 30px;
            font-weight: 700;
            margin-bottom: 30px;
            font-family: 'Raleway', sans-serif;
        }

        p {
            font-size: 13px;
        }

        .ion-minus {
            padding: 0px 10px;
        }

        #blog {
            background-color: #f6f6f6;
        }

            #blog .carousel-indicators {
                bottom: -60px;
            }

                #blog .carousel-indicators li {
                    background-color: #ead314;
                    height: 13px;
                    width: 13px;
                    margin: 5px;
                }

                    #blog .carousel-indicators li.active {
                        background-color: #f7f3d4;
                    }

            #blog .card-block {
                padding: 10px;
            }

            #blog .card {
                background-color: #FFF;
                border: 1px solid #eceaea;
                margin: 20px 0px;
            }

        .btn.btn-default {
            /*border: 5px solid #f4edb9;
            background-color: #1b1a1a;
            color: #f7eb88;*/
            padding: 13px 20px;
            font-size: 13px;
            font-weight: 600;
        }

        .navbar-brand {
            padding: 0px 0px;
        }

        body {
            font-size: 14px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body" Runat="Server">
    <section id="blog">
                <div class="container">

                    <div class="row">
                        <div class="col-lg-6 col-lg-offset-3 text-center">
                            <h2 style="text-shadow: 2px 2px 2px #f7eb88; color: #131212;"><span class="ion-minus"></span>Recent Posts<span class="ion-minus"></span></h2>
                            <br>
                        </div>
                    </div>

                    <div class="row">
                              <!-- Carousel items -->
                            <div class="carousel-inner">

                                <div class="item active">
                                    <div class="row">

                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="card text-center">
                                            
                                                <img class="card-img-top" src="img/temple/anjanimaa_temple_head.jpg" alt="" width="100%">
                                                <div class="card-block">
                                                 <a  ><i class="fa fa-user"></i>Team Karaulians</a>&nbsp; &nbsp;  <a  ><i class="fa fa-clock-o"></i>01 jan,2018</a>
              
                                                    <h4 class="card-title" style="font-weight:bold;">श्री अंजनी माता जी </h4>
                                                    <p class="card-text">

                                                        इस मंदिर का निर्माण  मंडरायल के राजा श्री अर्जुन देव जी (अर्जुनबली) ने सन 1348 में कल्याणपुरि (करौली) की स्थापना के साथ किया था एवं इन्हें कुलदेवी का दर्जा दिया था
                                                        जोकि कालान्तर में  करौली राजवंश की कुलदेवी के रूप में स्थापित है|

                                                    </p>
                                                    <a class="btn btn-default" href="anjanimaa_hindi.aspx" style="border: 5px solid #f4edb9;background-color: #1b1a1a;color:#fff;">Read More</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="card text-center">
                                                <img class="card-img-top" src="img/histotical/mandrayal_side.jpg" alt="" width="100%">
                                                <div class="card-block">
                                                     <a  ><i class="fa fa-user"></i>Team Karaulians</a>&nbsp; &nbsp;  <a  ><i class="fa fa-clock-o"></i>08 jan,2018</a>
                                                    <h4 class="card-title" style="font-weight:bold;">मंडरायल का  किला</h4>
                                                    <p class="card-text">करौली  के दक्षिण में 40 किमी दूर   राजस्थान और  मध्य प्रदेश की सीमा को विभक्त  करते हुए  घाटियों के  मध्य चंबल नदी के किनारे  एक छोटी सी आयताकार  पहाड़ी पर असतव्यस्त प्राचीरों से घिरा लाल पत्थर का एक निर्माण  देखने को मिलता  है|</p>
                                                    <a class="btn btn-default" href="mandrayal_hindi.aspx" style="border: 5px solid #f4edb9;background-color: #1b1a1a;color:#fff;">Read More</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="card text-center">
                                                <img class="card-img-top" src="img/natural/maheshwara.jpg" alt="" width="100%">
                                                <div class="card-block">
                                                     <a  ><i class="fa fa-user"></i>Team Karaulians</a>&nbsp; &nbsp;  <a  ><i class="fa fa-clock-o"></i>07 jan,2018</a>
                                                    <h4 class="card-title" style="font-weight:bold;">महेश्वरा का झरना (खोह)</h4>
                                                    <p class="card-text">
                                                        करौली जिला मुख्यालय से  लगभग 45 किमी दूर कैलादेवी अभयारण  में करनपुर रोड पर खजुराकी गांव के पास बीहड़ में स्थित यह प्राकृतिक झरना अपने आप में बहुत सुन्दर स्थान है आपको यह जाने के लिए खजुराकी गांव से 7 किमी अंदर जाना होगा
                                                        |
                                                    </p>

                                                    <a class="btn btn-default" href="maheshwara_hindi.aspx" style="border: 5px solid #f4edb9;background-color: #1b1a1a;color:#fff;">Read More</a>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-3 col-md-3 col-sm-3 col-xs-12">
                                            <div class="card text-center">
                                                <img class="card-img-top" src="img/paintings/rsz_p8240362.jpg" alt="" width="100%">
                                                <div class="card-block">
                                                     <a  ><i class="fa fa-user"></i>Team Karaulians</a>&nbsp; &nbsp;  <a  ><i class="fa fa-clock-o"></i>28 jan,2018</a>
                                                    <h4 class="card-title" style="font-weight:bold;">करौली राज्य के यादव(जादौन) ठिकाने </h4>
                                                    <p class="card-text">
                                                        गरेरी हाडौती जागीर मुख्य रूप से करौली राज्य के उत्तराधिकारी की जागीर होती थी
                                                        जिसमे गरेरी हाडौती मांगरोल गोपालपुरा एकट कीरतपुर सुरतपुरा बलवपुरा गज्जूपुरा गांव आते थे|



                                                    </p>
                                                    <a class="btn btn-default" href="updatepage.aspx" style="border: 5px solid #f4edb9;background-color: #1b1a1a;color:#fff;">Read More</a>
                                                </div>
                                            </div>
                                        </div>

                                    </div> <!-- row -->
                                </div> <!-- item -->
                     </div>
                        
                    </div>
                    

                </div>
        
            </section>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="footer1" Runat="Server">
</asp:Content>

