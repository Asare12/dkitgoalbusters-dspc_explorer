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
            <th>Edit</th>         
            <th>Delete </th>
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
            <th>Edit</th>
            <th>Delete </th>
            <th>View</th>

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
            <td><%=reg.getRegSex()%></td>
            <td><%=reg.getRegDeathLocation()%> </td>
            <td><%=reg.getRegdeathDate()%></td>
            <td><%=reg.getRegburialDate()%></td>
            <td class="text-center"><a href="WebActionServlet?action=modifyReg&regId=<%=userId%>" data-toggle="modal" data-target="#myRegModal"><samp class="glyphicon glyphicon-edit"></samp> </td>
            <td class="text-center"><a href="#"><samp class="glyphicon glyphicon-remove" onclick="deleteRegistrar(<%=deleteId%>)"></samp></a></td>
            <td class="text-center"><a href="#"><samp class="glyphicon glyphicon-eye-open" onclick="viewRegistrar(<%=userId%>)"></samp></a></td>
                
        </tr>
        <%}
        }%>

    </tbody>
</table>



<div id="loadBtn" class="btn btn-primary" onclick="manageRegistrar();" >Reload Data/ Up-To-Date</div>

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
                    <form id="signupform" role="form" method="POST" onsubmit="addRegistrar(this); return false;"><!--method defined in ManageUsers.jsp-->
                        <div class="form-group">
                            <label for="firstname">Grave Number</label>
                            <input type="text" class="form-control" name="graveid" placeholder="grave number" required>
                        </div>
                        <div class="form-group">
                            <label for="firstname">First Name</label>
                            <input type="text" class="form-control" name="firstname" placeholder="First Name" required>
                        </div>
                        <div class="form-group">
                            <label for="Middlename">Middle Name</label>
                            <input type="text" class="form-control" name="middlename" placeholder="Enter Middle name(Optional)">
                        </div>
                        <div class="form-group">
                            <label for="Lastname">Last Name</label>
                            <input type="text" class="form-control" name="lastname" placeholder="Enter Last Name">
                        </div>

                        <div class="form-group">
                            <label for="sex">Sex</label>
                            <input type="text" class="form-control" name="sex" placeholder=" 'Male' or 'Female' ">
                        </div>

                        <div class="form-group">
                            <label for="age">Age</label>
                            <input type="text" class="form-control" name="age" placeholder="Enter The age ">
                        </div>

                        <div class="form-group">
                            <label for="depth">Religion</label>
                            <input type="text" class="form-control" name="religion" placeholder="Enter The religion ">
                        </div>

                        <div class="form-group">
                            <label for="occupation">Occupation</label>
                            <input type="text" class="form-control" name="occupation" placeholder="Enter The occupation (optional)">
                        </div>

                        <div class="form-group">
                            <label for="occupation">Marriage Status</label>
                            <input type="text" class="form-control" name="marStat" placeholder="Enter The occupation (optional)">
                        </div>

                        <div class="form-group">
                            <label for="depth">Death Location</label>
                            <input type="text" class="form-control" name="dlocation" placeholder="Enter a location at time of death ">
                        </div>

                        <div class="form-group">
                            <label for="bdate">Death Date</label>
                            <input type="text" class="form-control" name="ddate" placeholder="Format (YYYY-MM-DD) e.g (2011-01-30) ">
                        </div>

                        <div class="form-group">
                            <label for="bdate">Burial Date</label>
                            <input type="text" class="form-control" name="bdate" placeholder="Format (YYYY-MM-DD) e.g (2011-01-30) ">
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



