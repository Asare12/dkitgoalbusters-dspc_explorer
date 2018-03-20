<%-- 
    Document   : ManageUsers
    Created on : 16-Feb-2018, 21:08:17
    Author     : Abdul
--%>

<%@page import="com.dspc_explorer.Dtos.Registrar"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="css/jquery-1.12.4.js"></script>
<script src="css/jquery.dataTables.min.js"></script>
<link href="css/jquery.dataTables.min.css" rel="stylesheet">

<script>

    $(document).ready(function () {
        $('#example').DataTable({
            "pagingType": "full_numbers"
        });
    });
</script>
<% String data = (String) request.getSession().getAttribute("jsonStringUserList");
    List<Registrar> list = (List<Registrar>) request.getSession().getAttribute("list");
%>

<script>
    var registrarList = <%=data%>;
    var selectedUserIds = [];
    storeHtmlToVariable("userBlockTemplate.html", null);
    tmpUserList = [];
    //displayUserList(registrarList);


    function addUser(form)
    {
        registerUser(form);
        closeAddUserModal();
        manageUsers();

    }



</script>

<script>

    $('#loadBtn').on('click', function () {
        alert(<%=data%>);
        var jsonData = JSON.parse(<%=data%>);

        for (var i = 0; i < jsonData.length; i++) {
            var jsonObj = jsonData[i];
            var $tr = $("<tr>");
            var $firstName = $("<td>");
            var $lastName = $("<td>");
            var $sex = $("<td>");
            var $deathlocation = $("<td>");
            var $deathdate = $("<td>");
            var $burialdate = $("<td>");
            $firstName.append(jsonData.Registrar.regFirstName);
            $lastName.append(jsonObj.Registrar.regLastName);
            $sex.append(jsonObj.Registrar.regSex);
            $deathlocation.append(jsonObj.Registrar.regDeathLocation);
            $deathdate.append(jsonObj.Registrar.regDeathDate);
            $burialdate.append(jsonObj.Registrar.regBurialDate);
            $tr.append($firstName);
            $tr.append($lastName);
            $tr.append($sex);
            $tr.append($deathlocation);
            $tr.append($deathdate);
            $tr.append($burialdate);
            $('#tableBody').append($tr);
        }
    });


    function deleteRegistrar(userId)
    {
        deleteReg(userId);
        manageRegistrar();
    }


</script>



<table id="example" class="display" cellspacing="0" width="100%">

    <thead>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Sex</th>
            <th>Death Location</th>
            <th>Death Date</th>
            <th>Burial Date</th>
            <th>View</th>
        </tr>
    </thead>

    <tfoot>
        <tr>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Sex</th>
            <th>Death Location</th>
            <th>Death Date</th>
            <th>Burial Date</th>
            <th>View</th>

        </tr>
    </tfoot>
    <tbody id="tableBody">
        <%if (list.size() > 0) { %>   
        <% for (Registrar reg : list) {
                int userId = reg.getRegId();
                int deleteId = reg.getRegId();
        %>


        <tr> 
            
            <td><%=reg.getRegFirstName()%></td>
            <td><%=reg.getRegLastName()%></td>
            <td><%=reg.getRegSex()%></td>
            <td><%=reg.getRegDeathLocation()%> </td>
            <td><%=reg.getRegdeathDate()%></td>
            <td><%=reg.getRegburialDate()%></td>
            <td class="text-center"><a href="#"><samp class="glyphicon glyphicon-eye-open" onclick="viewRegistrar(<%=userId%>)"></samp></a></td>
                
        </tr>
        <%}
        }%>

    </tbody>
</table>
