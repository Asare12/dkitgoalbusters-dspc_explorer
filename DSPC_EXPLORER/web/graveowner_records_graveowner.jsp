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


<title>Grave Owner Records</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.0/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" />
<script src="https://cdn.datatables.net/1.10.12/js/jquery.dataTables.min.js"></script>
<script src="https://cdn.datatables.net/1.10.12/js/dataTables.bootstrap.min.js"></script>
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.12/css/dataTables.bootstrap.min.css" />
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.7.2/jquery.min.js"></script>
                <script>
                    <% List<Users> userList = (List<Users>) request.getSession().getAttribute("list"); %>     var selectedUserIds = []; //userList =<%//=request.getSession().getAttribute("jsonStringUserList")%>;
                    //registrarList =<%//request.getSession().getAttribute("jsonStringUserList");%>;
                    storeHtmlToVariable("userBlockTemplate.html", null); tmpUserList = []; displayUserList(userList);<!-- **************************************************************************************************************************************************** -->

                    function displayUserList()
                    {
                            var jsonData = JSON.parse(registrarList);
                    for (var i = 0; i < jsonData.length; i++) {
                            var jsonObj = jsonData[i];
                    var $tr = $("<tr>");
                    var $firstName = $("<td>"); var $lastName = $("<td>"); var $sex = $("<td>");
                    var $deathlocation = $("<td>");
                    var $deathdate = $("<td>"); var $burialdate = $("<td>");
                    $firstName.append(jsonObj.reg_first_name); $lastName.append(jsonObj.reg_last_name);
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
                    <!-- **************************************************************************************************************************************************** -->

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

    <!-- **************************************************************************************************************************************************** -->

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
    <!-- **************************************************************************************************************************************************** -->


    function closeAddUserModal()
    {
        $('#addUserModal').modal('hide');
        //alert("closed");
    }

    <!-- **************************************************************************************************************************************************** -->

    function addGraveOwner(form)
    {
        registerUser(form);
        closeAddUserModal();
        manageUsers();

    }
</script>


  <!-- **************************************************************************************************************************************************** -->

<!-- **************************************************************************************************************************************************** -->


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

.modal.fade {
  z-index: 10000000 !important;
}

</style>

<!-- **************************************************************************************************************************************************** -->

</head>

<!-- **************************************************************************************************************************************************** -->


<body>
    <div class="container box">
        <h1 align="center">Grave Owner Records</h1>
        <br />
        <div class="table-responsive">
            <br />
            <div align="center">
                <button type="button" id="add_button" data-toggle="modal" data-target="#userModal" class="btn btn-info btn-lg ">Add</button>
            </div>
            <br /><br />
            <table id="user_data" class="table table-bordered table-striped">
                <thead>
                    <tr>
                        <!--   <th width="10%">Image</th> -->
                        <th width="15%">Name</th>
                        <th width="15%">Address</th>
                        <th width="10%">Grave Open Date</th>
                        <th width="10%">Grave Row</th>
                        <th width="10%">Grave Depth</th>
                        <th width="5%">Edit</th>
                        <th width="5%">Delete</th>
                        <th width="10%">See People</th>


                    </tr>
                </thead>
<!-- __________________________________________________________________________________________________________________________________________________________ -->

                <tbody id="tableBody" onload="displayUserList();
                            return false;">


                <th width="15%">Abdul</th>
                <th width="15%">Lee</th>
                <th width="10%">22/07/2015</th>
                <th width="10%">15</th>
                <th width="10%">20</th>
                <th  width="5%"><button type="button" id="update_button" data-toggle="modal" data-target="#userModa2" name="update"class="btn btn-warning btn-xs update">Update</button> </th>
                <th width="5%"><button type="button"  name="delete"class="btn btn-danger btn-xs delete">Delete</button> </th>
                <th  width="5%"><button type="button" id="see_more" data-toggle="modal" data-target="#userModa3" name="see_more"class="btn btn-info btn-xs update">See People</button> </th>



                <!--
                $sub_array[] = '<button type="button" name="update" id="'.$row["id"].'" class="btn btn-warning btn-xs update">Update</button>';
                $sub_array[] = '<button type="button" name="delete" id="'.$row["id"].'" class="btn btn-danger btn-xs delete">Delete</button>';
                -->



                </tbody>

            </table>

        </div>
    </div>
</body>
</html>

<!-- **************************************************************************************************************************************************** -->



<div id="userModal" class="modal fade">
    <div class="modal-dialog">
        <form method="post" id="user_form_add" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Add Grave Owner</h4>
                </div>
                <div class="modal-body">





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

<!-- **************************************************************************************************************************************************** -->

<div id="userModa2" class="modal fade">
    <div class="modal-dialog">
        <form method="post" id="user_form_update" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">Update Grave Owner</h4>
                </div>
                <div class="modal-body">





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







                </div>
                <div class="modal-footer">
                    <input type="hidden" name="user_id" id="user_id" />
                    <input type="hidden" name="operation" id="operation" />
                  <button  type="button" name="action" id="update_person" href="#myModal2" data-toggle="myModal2" data-target="#userModa2"    class="btn btn-success" value="Update">Update</button>

                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- **************************************************************************************************************************************************** -->

<div id="userModa3" class="modal fade">
    <div class="modal-dialog modal-md">
        <form method="post" id="user_form_update" enctype="multipart/form-data">
            <div class="modal-content">
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal">&times;</button>
                    <h4 class="modal-title">People in this grave</h4>
                </div>
                <div class="modal-body">



<table id="user_data" class="table table-bordered table-striped">
                <thead>

                    <tr>
                        <!--   <th width="10%">Image</th> -->
                        <th width="15%">Name</th>
                        <th width="15%">Address</th>
                        <th width="20%">Grave Open Date</th>
                         <th width="15%">Grave Row</th>
                        <th width="15%">Grave Depth</th>
                        <th width="5%">Edit</th>
                        <th width="5%">Delete</th>


                    </tr>
                </thead>
<!-- __________________________________________________________________________________________________________________________________________________________ -->

                <tbody id="tableBody" onload="displayUserList();
                            return false;">


                <th width="15%">Abdul</th>
                <th width="15%">Lee</th>
                <th width="20%">22/07/2015</th>
                <th width="5%">15</th>
                <th width="5%">20</th>

                <th  width="5%"><button type="button" id="add_button" data-toggle="modal" data-target="#userModa2" name="update"class="btn btn-warning btn-xs update">Update</button> </th>
                <th width="5%"><button type="button"  name="delete"class="btn btn-danger btn-xs delete">Delete</button> </th>





                </div>
                <div class="modal-footer">
                    <input type="hidden" name="user_id" id="user_id" />
                    <input type="hidden" name="operation" id="operation" />
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



                                            <!-- **************************************************************************************************************************************************** -->

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
                        },         "columnDefs": [ {
                "targets": [0, 3, 4], "orderable": false, },     ],
                        });
<!-- **************************************************************************************************************************************************** -->

  $(document).on('submit', '#user_form', function(event) {
                                                            event.preventDefault(); var graverefcode = $('#graverefcode').val(); var name = $('#name').val(); var address = $('#address').val(); vardateopened = $('#dateopened').val(); varrow = $('#row').val(); vardepth = $('#depth').val(); varextension = $('#user_image').val().split('.').pop().toLowerCase(); if (extension != '')
                   {
                                                    if (jQuery.inArray(extension, ['gif', 'png', 'jpg', 'jpeg']) == - 1)
                                            {                                 alert("Invalid Image File");                   $('#user_image').val('');
                    return false;
    }
    }
    if (graverefcode != '' && name != '' && address != '' && dateopened != '' && row != '' && depth != '')
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

    <!-- **************************************************************************************************************************************************** -->

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
                                    $('#graverefcode').val(data.graverefcode);
                                    $('#name').val(data.name);
                                    $('.modal-title').text("Edit User");
                                    $('#address').val(data.address);
                                    $('#dateopened').val(data.dateopened);
                                    $('#row').val(data.row);
                                    $('#depth').val(data.Edit);
                                    $('#operation').val("Edit"); -- >
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

    <!-- **************************************************************************************************************************************************** -->


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
