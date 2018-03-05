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
            <th>Edit</th>         
            <th>Delete </th>
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
            <th>Edit</th>
            <th>Delete </th>

        </tr>
    </tfoot>
    <tbody id="tableBody">

        <%if (list.size() > 0 && list != null) { %>   
        <% for (Registrar reg : list) {
                int userId = reg.getRegId();
                int deleteId = reg.getRegId();
        %>

        <tr>
            <td><%=reg.getRegFirstName()%></td>
            <td><%=reg.getRegLastName()%></td>
            <td><%=reg.getRegAge()%></td>
            <td><%=reg.getRegDeathLocation()%> </td>
            <td><%=reg.getRegdeathDate()%></td>
            <td><%=reg.getRegburialDate()%></td>
            <td class="text-center" id="<%=userId%>" onclick="modifyReg(this); return false;"><a href="modifyReg.jsp"  data-toggle="modal" data-target="#myRegModal" ><samp class="glyphicon glyphicon-edit " name="delete" value="<%=userId%>" method="POST"></samp> </td>
            <td class="text-center"><a href=WebActionServlet/delete?id=<%=deleteId%>><samp class="glyphicon glyphicon-remove"></samp></td>

        </tr>

        <%}
            }%>
    </tbody>
</table>

<align align='center'><h2>Admin Options</h2></align>


<div id="loadBtn" class="btn btn-primary">Load Data</div>

<!-- Trigger the modal with a button -->
<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#myModal">Add Registrar/Deceased</button>


<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add A Registrar To Records </h4>
                </div>
                <div class="modal-body">
                    <form id="signupform" role="form" method="POST" onsubmit="addGraveOwner(this); return false;"><!--method defined in ManageUsers.jsp-->
                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="firstname" class="form-control" name="firstname" placeholder="First Name" required>
                        </div>
                        <div class="form-group">
                            <label for="Middlename">Middle Name</label>
                            <input type="middlename" class="form-control" name="middlename" placeholder="Enter Middle name(Optional)">
                        </div>
                        <div class="form-group">
                            <label for="Lastname">Last Name</label>
                            <input type="lastname" class="form-control" name="lastname" placeholder="Enter Last Name">
                        </div>

                        <div class="form-group">
                            <label for="sex">Sex</label>
                            <input type="sex" class="form-control" name="sex" placeholder=" 'Male' or 'Female' ">
                        </div>

                        <div class="form-group">
                            <label for="row">Age</label>
                            <input type="row" class="form-control" name="row" placeholder="Enter The row ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Religion</label>
                            <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Occupation</label>
                            <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Death Location</label>
                            <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Death Date</label>
                            <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Burial Date</label>
                            <input type="depth" class="form-control" name="depth" placeholder="Enter The depth ">
                        </div>

                        <input type="hidden" name="action" value="addRegistrar">
                        <div class="form-group">
                            <!-- Button -->                                        
                            <button type="submit" class="btn btn-default">Add Registrar/Deceased</button>
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

<div class="container">
    <!-- Modal -->
    <div class="modal fade" id="myRegModal" role="dialog">
        <div class="modal-dialog">

            <!-- Modal content-->
            <div class="modal-content">

                <div class="modal-body">

                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>

        </div>
    </div>

</div>



