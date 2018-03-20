<%-- 
    Document   : modifyReg
    Created on : 24-Feb-2018, 13:32:26
    Author     : Abdul
--%>

<%@page import="com.dspc_explorer.Dtos.Registrar"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% Registrar reg = (Registrar) request.getSession().getAttribute("modifyReg");%>


<script>


    function closeEditRegModal()
    {
        $('#myRegModal').modal('hide');
        //alert("closed");
    }

    function mReg(form) // Modify Registrar record
    {
        modifyRegRecord(form);
        closeEditRegModal();
    }

</script>
<div class="modal-content">
    <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal">&times;</button>
        <h4 class="modal-title">Edit Registrar Record </h4>
    </div>
    <div class="modal-body">
        <form id="signupform" role="form" method="POST" onsubmit="mReg(this); return false;"><!--method defined in ManageUsers.jsp-->
            <div class="form-group">
                <label for="regId">Number</label>
                <input type="text" class="form-control" name="regId" value="<%=reg.getRegId()%>" placeholder="<%=reg.getRegId()%>">
            </div>
            <div class="form-group">
                <label for="firstname">First Name</label>
                <input type="text" class="form-control" name="firstname"value="<%=reg.getRegFirstName() %>" placeholder="<%=reg.getRegFirstName()%>" required>
            </div>
            <div class="form-group">
                <label for="Middlename">Middle Name</label>
                <input type="text" class="form-control" name="middlename" value="<%=reg.getRegMiddleName() %>" placeholder="Enter Middle name(Optional)">
            </div>
            <div class="form-group">
                <label for="Lastname">Last Name</label>
                <input type="text" class="form-control" name="lastname" value="<%=reg.getRegLastName() %>" placeholder="Enter Last Name">
            </div>

            <div class="form-group">
                <label for="sex">Sex</label>
                <input type="text" class="form-control" name="sex"  value="<%=reg.getRegSex() %>" placeholder=" 'Male' or 'Female' ">
            </div>

            <div class="form-group">
                <label for="age">Age</label>
                <input type="text" class="form-control" name="age" value="<%=reg.getRegAge() %>" placeholder="Enter The age ">
            </div>

            <div class="form-group">
                <label for="depth">Religion</label>
                <input type="text" class="form-control" name="religion" value="<%=reg.getRegReligion()%>" placeholder="">
            </div>

            <div class="form-group">
                <label for="occupation">Occupation</label>
                <input type="text" class="form-control" name="occupation" placeholder="Enter The occupation (optional)">
            </div>

            <div class="form-group">
                <label for="occupation">Marriage Status</label>
                <input type="text" class="form-control" name="marStat" value="<%=reg.getRegMarriageStatus() %>" placeholder="Enter The occupation (optional)">
            </div>

            <div class="form-group">
                <label for="depth">Death Location</label>
                <input type="text" class="form-control" name="dlocation" value="<%=reg.getRegDeathLocation() %>" placeholder="Enter a location at time of death ">
            </div>

            <div class="form-group">
                <label for="bdate">Death Date</label>
                <input type="text" class="form-control" name="ddate" value="<%=reg.getRegdeathDate() %>" placeholder="Format (YYYY-MM-DD) e.g (2011-01-30) ">
            </div>

            <div class="form-group">
                <label for="bdate">Burial Date</label>
                <input type="text" class="form-control" name="bdate" value="<%=reg.getRegburialDate() %>" placeholder="Format (YYYY-MM-DD) e.g (2011-01-30) ">
            </div>

            <input type="hidden" name="action" value="modRegistrarRecords">
            <div class="form-group">
                <!-- Button -->                                        
                <button type="submit" class="btn btn-default">Modify Record</button>
            </div>
        </form>
        </form>
    </div>
</div>