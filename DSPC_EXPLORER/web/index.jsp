<%--
    Document   : Index.Jsp
    Created on : 31-Jan-2018, 12:36:46
    Author     : abdul
--%>

<%@page import="com.dspc_explorer.Dtos.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Administrator Control Page</title>
        <script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
        <!-- Bootstrap Core CSS -->

        <link href="css/bootstrap.min.css" rel="stylesheet">
        <!--<link rel="stylesheet" href="css/layout.css"/>-->
        <link href="css/SADStyles.css" rel="stylesheet">
        <link href="css/mycss.css" rel="stylesheet">

        <!-- <link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">-->





        <script>
            function processAttribute()
            {
            <%
                Users loggedinUser = (Users) request.getSession().getAttribute("user");
                String userName = null;
                int userType = -1;
                String firstName = null;

                if (loggedinUser != null) {
                    userName = loggedinUser.getUserName();
                    userType = loggedinUser.getUserType();
                    firstName = loggedinUser.getFirstName();

                }
                String action = (String) request.getParameter("action");
                String statusMessage = (String) request.getSession().getAttribute("statusMessage");
            %>
                userName = "<%=userName%>";
                userType = -1;
                firstName = "<%=firstName%>";
                statusMessage = "<%=statusMessage%>";
                action = "<%=action%>";
                activeUser =<%=request.getSession().getAttribute("jsonStringActiveUser")%>;
                if (userName !== null && userName !== 'null')
                {
                    userType = <%=userType%>;
                    if (userType === 0)
                    {
                        if (firstName === null || firstName === 'null')
                        {
                            loadNavigation("AdminNavigation.jsp", userName);
                        } else {
                            loadNavigation("AdminNavigation.jsp", firstName);
                        }
                        loadFile("AdminHome.jsp");
                    } else if (userType === 1) {
                        if (firstName === null || firstName === 'null')
                        {
                            loadNavigation("GravediggerNavigation.jsp", userName);
                        } else {
                            loadNavigation("GravediggerNavigation.jsp", firstName);
                        }
                        loadFile("GravediggerHome.jsp");
                    } else if (userType === 2) {
                        if (firstName === null || firstName === 'null')
                        {
                            loadNavigation("registrar_navigation.jsp", userName);
                        } else {
                            loadNavigation("registrar_navigation.jsp", firstName);
                        }
                        loadFile("registrar_home.jsp");
                    } else if (userType === 3) {
                        if (firstName === null || firstName === 'null')
                        {
                            loadNavigation("UserNavigation.jsp", userName);
                        } else {
                            loadNavigation("UserNavigation.jsp", firstName);
                        }
                        loadFile("home.html");
                    }
                } else
                {
                    loadNavigation("StandardNavigation.jsp", null);
                    loadFile("landing_page.html");
                }
                if (action === 'verifyemail')
                {
                    verifyEmail("<%=request.getParameter("userName")%>", "<%=request.getParameter("token")%>");
                }
            }


            function disable() {

                document.getElementById("byear").disabled = true;
                document.getElementById("dyear").disabled = true;

            }

            function enable() {


                document.getElementById("byear").disabled = false;
                document.getElementById("dyear").disabled = false;

            }

            var count = 0;

            function showAdminLogin() {

                count++;

                if (count >= 5) {
                    count = 0;
                    location.href = 'log_in.jsp';



                }
            }

    $(".modal-content").on("hidden.bs.modal", function () {
        $(".modal-body").html("");
    });
        </script>


    </head>



    <body onload="processAttribute();
            return false;">

        <!-- Navigation -->
        <div id="navigation">
        </div>

        <div id="ajaxContainer" class="ajaxcontent">
            <!-- /.container -->
        </div>
        <!-- Footer -->
        <div class="navbar navbar-default navbar-fixed-bottom">

            <div class="container">
                <p class="navbar-text pull-left">Copyright &copy; Dowdallshill Saint Patrick Cemetery Dundalk</p>
            </div>
        </div>
        <!-- /.container -->

        <!-- jQuery -->
        <script src="js/jquery.js"></script>

        <!-- Bootstrap Core JavaScript -->
        <script src="js/bootstrap.min.js"></script>

        <!-- Our Custom JavaScript Loding here -->
        <script src="js/sadScript.js"></script>
        <!-- Script to Activate the Carousel -->
        <script>
        $('.carousel').carousel({
            interval: 5000 //changes the speed
        });
        </script>

    </body>
</html>
