<%--
    Document   : registrar_navigation
    Created on : 26-Feb-2018, 21:10:12
    Author     : VIT
--%>

<%
    String userName = (String) request.getParameter("user");
%>

<script src="js/sadScript.js"></script>


<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
            <a class="navbar-brand" href="Index.jsp">DSPC Explorer</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li class="active" onclick="servletLoadFile('ManageGraveOwner.jsp', this); return false;">
                    <a href="">Home</a>
                </li>
                <li onclick="loadFile('graveowner_records_registrars.jsp', this); return false;">
                    <a href="">Grave Owner Records</a>
                </li>
                <li onclick="servletLoadFile('contact.html', this);
                        return false;">
                    <a href="">Registrars Records</a>
                </li>

                <li onclick="servletLoadFile('contact.html', this);
                        return false;">
                    <a href="">Suggest Update</a>
                </li>

                <li onclick="servletLoadFile('contact.html', this);
                        return false;">
                    <a href="">Suggested Update</a>
                </li>
                <li onclick="servletLoadFile('contact.html', this);
                        return false;">
                    <a href="">Last 5 Actions</a>
                </li>

            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" onclick="makeActive(this);
                        return false;">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">Welcome! <%=userName%><b class="caret"></b></a>
                    <ul class="dropdown-menu nav">
                        <li onclick="loadFile('userupdate.jsp', this);
                                return false;"><a href="">Profile</a></li>
                        <li onclick="servletLoadFile('UserChangePassword.jsp', this); return false;"><a href="">Reset Password</a></li>
                        <li onclick="logout(); return false;"><a href="">Logout</a></li>
                    </ul>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>
