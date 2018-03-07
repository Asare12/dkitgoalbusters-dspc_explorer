<%-- 
    Document   : StandardNavigation
    Created on : 14-Feb-2018, 09:44:15
    Author     : Abdul
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
                <li class="active" onclick="servletLoadFile('AdminHome.jsp', this); return false;">
                    <a href="">Home</a>
                </li>
                <li onclick="servletLoadFile('about.html', this);
                        return false;">
                    <a href="">About</a>
                </li>
                <li onclick="servletLoadFile('contact.html', this);
                        return false;">
                    <a href="">Contact</a>
                </li>
                  <li class="dropdown" onclick="makeActive(this); return false;">
                      <a href="" class="dropdown-toggle" data-toggle="dropdown" href="">User Services<b class="caret"></b></a>
                    <ul class="dropdown-menu nav">
                        <li onclick="return false"><a href="">blah</a></li>
                        <li onclick="return false"><a href="">Blah</a></li>
                         <li onclick="return false"><a href="">blah</a></li>
                         <li onclick="return false"><a href="">blah</a></li>
                    </ul>
                </li>
                 <li class="dropdown" onclick="makeActive(this); return false;">
                      <a href="" class="dropdown-toggle" data-toggle="dropdown" href="">Admin Services<b class="caret"></b></a>
                    <ul class="dropdown-menu nav">
                        <li onclick="manageRegistrar();"><a href="">Registrar Management</a></li>
                        <li onclick=" return false"><a href="">blah</a></li>
                        <li onclick="return false"><a href="">blah blah</a></li>
                        <li onclick="return false"><a href="">blah blah blah</a></li>
                    </ul>
                </li>
            </ul>

            <ul class="nav navbar-nav navbar-right">
                <li class="dropdown" onclick="makeActive(this); return false;">
                    <a href="" class="dropdown-toggle" data-toggle="dropdown">Welcome! <%=userName%><b class="caret"></b></a>
                    <ul class="dropdown-menu nav">
                        <li onclick="loadFile('userupdate.jsp', this); return false;"><a href="">Profile</a></li>
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


