<%-- 
    Document   : ManageUsers
    Created on : 16-Feb-2018, 21:08:17
    Author     : Abdul
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="css/jquery-1.12.4.js"></script>-->
<script src="css/jquery.dataTables.min.js"></script>
<link href="css/jquery.dataTables.min.css" rel="stylesheet">

<script>

    $(document).ready(function () {
        $('#example').DataTable({
            "pagingType": "full_numbers"
        });
    });
</script>

<script>
    var selectedUserIds = [];
    userList =<%=request.getSession().getAttribute("jsonStringUserList")%>;
    registrarList =<%request.getSession().getAttribute("jsonStringUserList");%>;
    storeHtmlToVariable("userBlockTemplate.html", null);
    tmpUserList = [];
    displayUserList(userList);
    function displayUserList()
    {
        var jsonData = JSON.parse(registrarList);

        for (var i = 0; i < jsonData.length; i++) {
            var jsonObj = jsonData[i];
            var $tr = $("<tr>");
            var $firstName = $("<td>");
            var $lastName = $("<td>");
            var $sex = $("<td>");
            var $deathlocation = $("<td>");
            var $deathdate = $("<td>");
            var $burialdate = $("<td>");
            
            $firstName.append(jsonObj.reg_first_name);
            $lastName.append(jsonObj.reg_last_name);
            $sex.append(jsonObj.reg_sex);
            $deathlocation.append(jsonObj.reg_death_location);
            $deathdate.append(jsonObj.reg_death_date);
            $burialdate.append(jsonObj.reg_burial_date);
            $tr.append($firstName);
            $tr.append($lastName);
            $tr.append($sex);
            $tr.append($deathlocation);
            $tr.append($deathdate);
            $tr.append($burialdate);
            
            $('#tableBody').append($tr);
        }

    }
    function closeModifyUserModal()
    {
        $('#modifyUserModal').modal('hide');
        if (tmpUserList.length > 0)
        {
            displayUserList(tmpUserList);
        } else
        {
            displayUserList(userList);
        }
        activeUser = oldActiveUser;
    }
    function loadAddUserTemplate(calledFrom)
    {
        clearMessage();
        $.ajax({
            async: false,
            url: "addUserTemplate.jsp",
            context: document.body,
            success: function (responseText) {
                $("#addUserModal").html(responseText);
            }
        });
    }
    function closeAddUserModal()
    {
        $('#addUserModal').modal('hide');
        //alert("closed");
    }
    function addUser(form)
    {
        registerUser(form);
        closeAddUserModal();
        manageUsers();

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
        </tr>
    </tfoot>
    <tbody id="tableBody" onload="displayUserList(); return false;">
        
        
    </tbody>
</table>