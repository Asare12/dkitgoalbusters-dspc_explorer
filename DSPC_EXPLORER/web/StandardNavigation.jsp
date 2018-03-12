<%-- 
    Document   : StandardNavigation
    Created on : 17-Feb-2018, 23:44:15
    Author     : Abdul
--%>

<nav class="navbar navbar-inverse navbar-static-top" role="navigation">
    <div class="container">

        <div class="navbar-header">
            <!-- Brand and toggle get grouped for better mobile display -->
            <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">

                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <!-- navbar-brand is hidden on larger screens, but visible when the menu is collapsed -->
            <a class="navbar-brand" href="" onclick="loadFile('home.html', this);return false;">D.S.P.C Explorer</a>
        </div>
        <!-- Collect the nav links, forms, and other content for toggling -->
        <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
            <ul class="nav navbar-nav navbar-left">
                <li class="active" onclick="
                        loadFile('home.html', this);
                        return false;">
                    <a href=""  >Home</a>
                </li>
                <li onclick="loadFile('about.html', this);
                        return false;">
                    <a href="" >About</a>
                </li>
                <li onclick="loadFile('contact.html', this);
                        return false;">
                    <a href="" >Contact</a>
                </li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li>
                    <a href="log_in.jsp" >Login | Register </a>
                </li>
            </ul>
        </div>
        <!-- /.navbar-collapse -->
    </div>
    <!-- /.container -->
</nav>