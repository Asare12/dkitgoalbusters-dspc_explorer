<%--
    Document   : graveowner_records_registrars
    Created on : 27-Feb-2018, 20:40:07
    Author     : VIT
--%>
<%@page import="java.util.List"%>
<%@page import="com.dspc_explorer.Dtos.Users"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<script src="css/jquery-1.12.4.js"></script>-->
<script src="css/jquery.dataTables.min.js"></script>
<link href="css/jquery.dataTables.min.css" rel="stylesheet">


<title>Registrars Records</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
<link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>


<script>
    <% List<Users> userList = (List<Users>) request.getSession().getAttribute("list"); %>
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
            success: function(responseText) {
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


<style>
    body
    {
        margin:0;
        padding:0;
        background-color:#f1f1f1;

    }
    .box
    {
        width:1270px;
        padding:5px;
        background-color:#fff;
        border:1px solid #ccc;
        border-radius:5px;

    }
    .modal {
        text-align: center;
        padding: 0!important;
    }

    .modal:before {
        content: '';
        display: inline-block;
        height: 100%;
        vertical-align: middle;
        margin-right: -4px;
    }

    .modal-dialog {
        display: inline-block;
        text-align: left;
        vertical-align: middle;
    }


</style>
</head>
<body>
    <div class="container-fluid box">
        <h1 align="center">Registrars Records</h1>
        <br />
        <div class="table-responsive">
            <br />
            <div align="center">
                <button type="button" id="add_button" data-toggle="modal" data-target="#userModal2" class="btn btn-info btn-lg">Add</button>
            </div>



            <br /><br />
            <table id="user_data" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <!--   <th width="10%">Image</th> -->
                        <th width="8%">First Name</th>
                        <th width="8%">Surname</th>
                        <th width="6%">Sex</th>
                        <th width="5%">Age</th>
                        <th width="10%">Religion</th>
                        <th width="10%">Occupation</th>
                        <th width="10%">Death Location</th>
                        <th width="10%">Marriage Status</th>
                        <th width="10%">Birth Date</th>
                        <th width="10%">Death Date</th>
                        <th width="5%">Update</th>
                        <th width="5%">Delete</th>
                    </tr>
                </thead>


                <tbody>
                <th width="8%">Tomas</th>
                <th width="8%">Daly</th>
                <th width="6%">Male</th>
                <th width="5%">70</th>
                <th width="10%">Catholic</th>
                <th width="10%">Engineer</th>
                <th width="10%">45 Tesco Bound</th>
                <th width="10%">Married</th>
                <th width="10%">22/11/1960</th>
                <th width="10%">22/11/2006</th>
                <th  width="5%"><button type="button" id="add_button" data-toggle="modal" data-target="#userModal3" name="update"class="btn btn-warning btn-xs update">Update</button> </th>
                <th width="5%"><button type="button"  name="delete"class="btn btn-danger btn-xs delete">Delete</button> </th>
                </tbody>



                <tbody id="tableBody" onload="displayUserList(); return false;">

                </tbody>

            </table>

        </div>
    </div>
</body>
</html>


<!-- **************************************************************************************************************************************************** -->


<div id="userModal2" class="modal fade">
    <div class="modal-dialog">
        <form method="post" id="user_form_add" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 align="center" class="modal-title">Add Grave Owner</h4>
                </div>
                <div class="modal-body">


                    <div class="form-group col-md-4  col-sm-4">
                        <label>First Name</label>
                        <input type="text" class="form-control" name="fname" placeholder="First name">
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name="sname" placeholder="Last name">
                    </div>




                    <div class="form-group col-md-4 col-sm-4">
                        <label >Gender:</label>
                        <select class="form-control" name="gender" id="gender1">
                            <option value="">Gender</option>
                            <option value="1">Male</option>
                            <option value="2">Female</option>
                        </select>

                    </div>



                    <div class="form-group col-md-2 col-sm-2">
                        <label>Age</label>
                        <input type="text" class="form-control" name="age" placeholder="Age">
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <label>Religion</label>
                        <input type="text" class="form-control"  name="religion" placeholder="Religion">
                    </div>

                    <div class="form-group col-md-6 col-sm-6">
                        <label>Occupation</label>
                        <input type="text" class="form-control" name="fname" placeholder="Occupation">
                    </div>

                    <div class="form-group col-md-6 col-sm-6">
                        <label>Last Place of Residence</label>
                        <input type="text" class="form-control" name="residence" placeholder="Last Place of Residence">
                    </div>

                    <div class="form-group col-md-6 col-sm-6">
                        <label>Martial Status</label>
                        <input type="text" class="form-control" name="martial_status" placeholder="Marital status">
                    </div>


                    <div class="form-group col-md-3 col-sm-3">
                        <label>Death Date</label>
                        <input type="text" class="form-control"  name="ddate" placeholder="Death Date">
                    </div>

                    <div class="form-group col-md-3 col-sm-3">
                        <label>Burial Date</label>
                        <input type="text" class="form-control" name="bdate" placeholder="Burial Date">
                    </div>

                    <div class="form-group col-md-3 col-sm-3">
                        <label>Section</label>
                        <input type="text" class="form-control" name="section" placeholder="Section">
                    </div>
                    <div class="form-group col-md-3 col-sm-3">
                        <label>No</label>
                        <input type="text" class="form-control" name="no" placeholder="No">
                    </div>



                    <div class="modal-footer">
                        <input type="hidden" name="user_id" id="user_id" />
                        <input type="hidden" name="operation" id="operation" />
                        <input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
                        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                    </div>
                </div>
        </form>
    </div>
</div>
</div>





<!-- **************************************************************************************************************************************************** -->





<div id="userModal3" class="modal fade">
    <div class="modal-dialog">
        <form method="post" id="user_form_update" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 align="center" class="modal-title">Update Registrar</h4>
                </div>
                <div class="modal-body">



                    <div class="form-group col-md-4  col-sm-4">
                        <label>First Name</label>
                        <input type="text" class="form-control" name="fname" placeholder="First name">
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <label>Last Name</label>
                        <input type="text" class="form-control" name="sname" placeholder="Last name">
                    </div>




                    <div class="form-group col-md-4 col-sm-4">
                        <label >Gender:</label>
                        <select class="form-control" name="gender" id="gender1">
                            <option value="">Gender</option>
                            <option value="1">Male</option>
                            <option value="2">Female</option>
                        </select>

                    </div>



                    <div class="form-group col-md-2 col-sm-2">
                        <label>Age</label>
                        <input type="text" class="form-control" name="age" placeholder="Age">
                    </div>

                    <div class="form-group col-md-4 col-sm-4">
                        <label>Religion</label>
                        <input type="text" class="form-control"  name="religion" placeholder="Religion">
                    </div>

                    <div class="form-group col-md-6 col-sm-6">
                        <label>Occupation</label>
                        <input type="text" class="form-control" name="fname" placeholder="Occupation">
                    </div>

                    <div class="form-group col-md-6 col-sm-6">
                        <label>Last Place of Residence</label>
                        <input type="text" class="form-control" name="residence" placeholder="Last Place of Residence">
                    </div>

                    <div class="form-group col-md-6 col-sm-6">
                        <label>Martial Status</label>
                        <input type="text" class="form-control" name="martial_status" placeholder="Marital status">
                    </div>


                    <div class="form-group col-md-3 col-sm-3">
                        <label>Death Date</label>
                        <input type="text" class="form-control"  name="ddate" placeholder="Death Date">
                    </div>

                    <div class="form-group col-md-3 col-sm-3">
                        <label>Burial Date</label>
                        <input type="text" class="form-control" name="bdate" placeholder="Burial Date">
                    </div>

                    <div class="form-group col-md-3 col-sm-3">
                        <label>Section</label>
                        <input type="text" class="form-control" name="section" placeholder="Section">
                    </div>
                    <div class="form-group col-md-3 col-sm-3">
                        <label>No</label>
                        <input type="text" class="form-control" name="no" placeholder="No">
                    </div>


                </div>



                <div class="modal-footer">
                    <input type="hidden" name="user_id" id="user_id" />
                    <input type="hidden" name="operation" id="operation" />
                    <input type="submit" name="action" id="action_update" class="btn btn-success" value="Update" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>

<!-- **************************************************************************************************************************************************** -->

<!--
<div id="userModal" class="modal fade">
    <div class="modal-dialog">
        <form method="post" id="user_form" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add User</h4>
                </div>
                <div class="modal-body">
                    <label>Enter First Name</label>
                    <input type="text" name="first_name" id="first_name" class="form-control" />
                    <br />
                    <label>Enter Last Name</label>
                    <input type="text" name="last_name" id="last_name" class="form-control" />
                    <br />
                    <label>Select User Image</label>
                    <input type="file" name="user_image" id="user_image" />
                    <span id="user_uploaded_image"></span>
                </div>
                <div class="modal-footer">
                    <input type="hidden" name="user_id" id="user_id" />
                    <input type="hidden" name="operation" id="operation" />
                    <input type="submit" name="action" id="action" class="btn btn-success" value="Add" />
                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>
-->










<script type="text/javascript" language="javascript" >
    $(document).ready(function() {
    $('#add_button').click(function() {
    $('#user_form')[0].reset();
            $('.modal-title').text("Add User");
            $('#action').val("Add");
            $('#operation').val("Add");
            $('#user_uploaded_image').html('');
    });
            var dataTable = $('#user_data').DataTable({
    "processing": true,
            "serverSide": true,
            "order": [],
            "ajax": {
            url: "fetch.php",
                    type: "POST"
            },
            "columnDefs": [
            {
            "targets": [0, 3, 4],
                    "orderable": false,
            },
            ],
    });
            $(document).on('submit', '#user_form', function(event) {
    var fname = $('#fname').val();
            var sname = $('#sname').val();
            var sex = $('#sex').val();
            var age = $('#age').val();
            var religion = $('#religion').val();
            var occupation = $('#occupation').val();
            var residence = $('#residence').val();
            var martial_status = $('#martial_status').val();
            var bdate = $('#bdate').val();
            var ddate = $('#ddate').val();
            var extension = $('#user_image').val().split('.').pop().toLowerCase();
            if (extension != '')
    {
    if (jQuery.inArray(extension, ['gif', 'png', 'jpg', 'jpeg']) == - 1)
    {
    alert("Invalid Image File");
            $('#user_image').val('');
            return false;
    }
    }
    if (fname != '' && sname != '' && sex != '' && age != '' && religion != '' && occupation != '' && residence != '' && martial_status != '' && bdate != '' && ddate != '')
    {
    $.ajax({
    url: "insert.php",
            method: 'POST',
            data: new FormData(this),
            contentType: false,
            processData: false,
            success: function(data)
            {
            alert(data);
                    $('#user_form')[0].reset();
                    $('#userModal').modal('hide');
                    dataTable.ajax.reload();
            }
    });
    } else
    {
    alert("Both Fields are Required");
    }
    });
            $(document).on('click', '.update', function() {
    var user_id = $(this).attr("id");
            $.ajax({
            url: "fetch_single.php",
                    method: "POST",
                    data: {user_id: user_id},
                    dataType: "json",
                    success: function(data)
                    {

                    $('#userModal').modal('show');
                            $('#fname').val(data.fname);
                            $('#sname').val(data.sname);
                            $('#sex').val(data.sex);
                            $('#age').val(data.age);
                            $('#occupation').val(data.occupation);
                            $('#residence').val(data.residence);
                            $('#martial_status').val(data.martial_status);
                            $('#bdate').val(data.graverefcode);
                            $('#ddate').val(data.graverefcode);
                            $('.modal-title').text("Edit User");
                            $('#operation').val("Edit");
                    }
            })
    });
                <!--


                $('#userModal').modal('show');
                $('#first_name').val(data.first_name);
                $('#last_name').val(data.last_name);
                $('.modal-title').text("Edit User");
            $('#user_id').val(user_id);
$('#user_uploaded_image').html(data.user_image);
$('#action').val("Edit");
$('#operation').val("Edit"); -->



$(document).on('click', '.delete', function() {
            var user_id = $(this).attr("id");
            if (confirm("Are you sure you want to delete this?"))
    {
    $.ajax({
    url: "delete.php",
            method: "POST",
            data: {user_id: user_id},
                success: function(data)
                    {
                    alert(data);
                    dataTable.ajax.reload();
                    }
                    });
                    } else
                {
                    return false;
                    }
                    });


                        });
</script>
