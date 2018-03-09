<%-- 
    Document   : ProcessResult
    Created on : 08-Mar-2018
    Author     : Abdul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String statusMessage = (String)request.getSession().getAttribute("statusMessage");
    //System.out.print("Status Message: " + statusMessage);
    int status = (Integer)request.getSession().getAttribute("status");
    //System.out.print("Status Message: " + statusMessage);
%>

<div id="processResult">
    Status <%=status%> <BR/>
    <%=statusMessage%>
</div>