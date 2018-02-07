<%-- 
    Document   : LoginAttempt
    Created on : 07-Feb-2018, 09:24:51
    Author     : Abdul
--%>
<%@page import="com.dspc_explorer.Dtos.Users"%>

<%
    Users loggedinUser = (Users) request.getSession().getAttribute("user");
    String userName = null;
    int userType = -1;
    System.out.print("LoginAttept JSP" + loggedinUser);
    String firstName = null;
    if (loggedinUser != null) {
        userName = loggedinUser.getUserName();
        userType = loggedinUser.getUserType();
        firstName = loggedinUser.getFirstName();
        System.out.println("user not null");
    }
    String statusMessage = (String) request.getSession().getAttribute("statusMessage");
%>
<script>
    userType =<%=userType%>;
    firstName="<%=firstName%>";
    userName="<%=userName%>";
    activeUser=<%=request.getSession().getAttribute("jsonStringActiveUser")%>;
    //alert(userName);
    if(userName == null || userName == 'null')
    {
        //alert("true");
       $("#loginAttempt").html("Login Fail");
    }
    else
    {
        //alert("false");
        $("#loginAttempt").html("Login Success");
    }
    
</script>
<div id="loginAttempt">

</div>