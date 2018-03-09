<%-- 
    Document   : ManageUsers
    Created on : 16-Feb-2018, 21:08:17
    Author     : Abdul
--%>

<%@page import="com.dspc_explorer.Dtos.Graveowner"%>
<%@page import="java.util.List"%>
<%@page import="com.dspc_explorer.Dtos.Users"%>
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
    List<Graveowner> list = (List<Graveowner>) request.getSession().getAttribute("list");
%>

<script>

    var selectedUserIds = [];
    //userList =<%//=request.getSession().getAttribute("jsonStringUserList")%>;
    //registrarList =<%//request.getSession().getAttribute("jsonStringUserList");%>;
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
            $tr.append("<span class='glyphicon glyphicon-edit'>" + jsonObj.graveId);
            ;

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
            url: "AddGraveowner.jsp",
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
    function addGraveOwner(form)
    {
        registerUser(form);
        closeAddUserModal();
        manageUsers();

    }
</script>


<table id="example" class="display" cellspacing="0" width="100%">
    <thead>
        <tr>
            <th>Grave Number</th>
            <th>Reference Code</th>
            <th>Owners Name</th>
            <th>Date Opened/ Owned</th>
            <th>Section</th>
            <th>Edit/Modify</th>
            <th>Details</th>
        </tr>
    </thead>
    <tfoot>
        <tr>
            <th>Grave Number</th>
            <th>Reference Code</th>
            <th>Owners Name</th>
            <th>Date Opened/ Owned</th>
            <th>Section</th>
            <th>Edit/Modify</th>
            <th>Details</th>
        </tr>
    </tfoot>
    <tbody id="tableBody">
         <%if (list.size() > 0 && list != null) { 
                for (Graveowner graveowner : list) {
            %>  
        <tr>
            
           
            <td><%=graveowner.getGraveId()%></td>
            <td><%=graveowner.getGraveRefCode()%></td>
            <td><%=graveowner.getGraveOwnerName()%></td>
            <td><%=graveowner.getGraveopenDate()%></td>
            <td><%=graveowner.getSection().getSectionCode()%></td>
            <td><samp class="glyphicon glyphicon-edit"></samp></td>
            <td><samp class="glyphicon glyphicon-eye-open"></samp></td>
            
        </tr>
        <%}
            }
        %>
    </tbody>
</table>


<div id="loadBtn" class="btn btn-primary" onclick="manageGraveOwners();" >Reload Data/ Up-To-Date</div>

<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add Grave Owner</button>


<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Modal Header</h4>
                </div>
                <div class="modal-body">
                    <form id="signupform" role="form" method="POST" onsubmit="addGraveOwner(this); return false;"><!--method defined in ManageUsers.jsp-->
                        <div class="form-group">
                            <label for="graverefcode">Grave Ref Code</label>
                            <input type="graverefcode" class="form-control" name="graverefcode" placeholder="Enter Reference Code" required>
                        </div>
                        <div class="form-group">
                            <label for="graveowner">Owner Name</label>
                            <input type="name" class="form-control" name="name" placeholder="Grave Owner Name..">
                        </div>
                        <div class="form-group">
                            <label for="address">Owner Address</label>
                            <input type="address" class="form-control" name="address" placeholder="Grave Owner Address">
                        </div>

                        <div class="form-group">
                            <label for="dateopened">Date Opened</label>
                            <input type="dateopened" class="form-control" name="dateopened" placeholder="Date Opened">
                        </div>

                        <div class="form-group">
                            <label for="row">Grave Row</label>
                            <input type="row" class="form-control" name="row" placeholder="Enter The row ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Grave Depth</label>
                            <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                        </div>

                        <input type="hidden" name="action" value="addGraveOwner">
                        <div class="form-group">
                            <!-- Button -->                                        
                            <button type="submit" class="btn btn-default">Add Grave Owner</button>
                        </div>
                    </form>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>
