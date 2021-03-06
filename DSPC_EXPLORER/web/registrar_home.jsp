<%--
    Document   : Registrar
    Created on : 26-Feb-2018, 20:51:38
    Author     : VIT
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<%@page import="com.dspc_explorer.Dtos.Users"%>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>

<%
    Users loggedinUser = (Users) request.getSession().getAttribute("user");
    if (loggedinUser != null && loggedinUser.getUserType() == 1) { // User Type Integer 1 is registrar
%>


<div class="container">
    <div class="col-lg-12">



    </div>
    <div class="col-lg-12">
        <div class="box">
            <div class="row">
                <hr class="tagline-divider">
                <h2 class="intro-text text-center">
                    <strong>User Services</strong>
                </h2>
                <hr class="tagline-divider">
            </div>
            <div class="row">
                <div class="col-md-2">
                    <ul class="nav">
                        <li>
                            <a href >
                                <div>
                                    <img class="img-responsive" src="images/users_woman-512.png" alt="Users Icon">
                                </div>
                                <div>
                                    <h4><b>Profile</b></h4>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>

                <div class="col-md-2">
                    <ul class="nav">
                        <li>
                            <a href>
                                <div>
                                    <img class="img-responsive img-border-left" src="images/Security-Password-2-icon.png" alt="Password Icon">
                                </div>
                                <div>
                                    <h4><b>Reset Password</b></h4>
                                </div>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>
<%} else {%>
<div>
    Session Expired.. Please Login again
</div>
<%}%>