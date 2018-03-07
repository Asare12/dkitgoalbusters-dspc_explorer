/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var action;
var userName;
var userType;
var firstName;
var ADMIN = 0;
var STANDARD_USER = 1;
var returnvalue;
var captchaNr1;
var captchaNr2;
var sessionActive = true;
var files;
var userNameModified = false;
var ajaxResponseText = "";
var userList;
var activeUser;
var oldActiveUser;
var tmpUserList = [];

function loadFile(link, calledFrom) {
    clearMessage();
    if (calledFrom !== null && calledFrom !== 'null')
    {
        makeActive(calledFrom);
    }
    $.ajax({
        url: link,
        context: document.body,
        success: function(responseText) {
            $("#ajaxContainer").html(responseText);
            //$("#ajaxContainer").find("script").each(function (i) {
            // eval($(this).text());
            // });
        }
    });
}
function storeHtmlToVariable(link, calledFrom)
{
    if (calledFrom !== null && calledFrom !== 'null')
    {
        makeActive(calledFrom);
    }
    $.ajax({
        async: false,
        url: link,
        context: document.body,
        success: function(responseText) {
            ajaxResponseText = responseText;
        }
    });
}
function servletLoadFile(link, calledFrom) {
    clearMessage();
    if (calledFrom !== null && calledFrom !== 'null')
    {
        makeActive(calledFrom);
    }
    $.ajax({
        url: 'WebActionServlet',
        context: document.body,
        data: {action: 'loadFile', file: link},
        success: function(responseText) {
            $("#ajaxContainer").html(responseText);
            //$("#ajaxContainer").find("script").each(function (i) {
            // eval($(this).text());
            // });
            if (sessionActive === false || sessionActive === 'false')
            {
                loadNavigation("StandardNavigation.jsp", null);
                sessionActive = true;
            }
        }
    });
}
function makeActive(calledFrom)
{
    $('.nav li').removeClass('active');
    $(calledFrom).addClass('active');
}
function loadNavigation(link, user) {
    $.ajax({
        url: link,
        data: {user: user},
        type: "POST",
        context: document.body,
        success: function(responseText) {
            $("#navigation").html(responseText);
        }
    });
}
function formAction(form)
{
    var formData = $(form).serialize();
    //alert(formData);
    //var rating = $(this).val(); //This captures the radio button's value, which ever clicked
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: formData,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                    //$("#message").find("script").each(function (i) {
                    // eval($(this).text());
                    //});
                    returnvalue = responseText;
                },
        error: function() {
            $("#message").html("Fail");
        }
    });
    return returnvalue;
}
function  callAjax(link, action) {
    var returnvalue;
    $.ajax({
        url: link,
        data: {action: action},
        type: "POST",
        context: document.body,
        success: function(responseText) {
            $("#message").html(responseText);
            returnvalue = true;
        },
        error: function() {
            $("#message").html("Failed");
            returnvalue = false;
        }
    });
}
function logout()
{
    callAjax('WebActionServlet', 'logout');
    loadNavigation("StandardNavigation.jsp", null);
    loadFile("home.html");
}
function clearMessage()
{
    $("#message").html("");
}
function login(form)
{
    var formData = $(form).serialize();
    //alert(formData);
    //var rating = $(this).val(); //This captures the radio button's value, which ever clicked
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: formData,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                    //alert(userName + " " + firstName + " " + userType);
                    if (userType === ADMIN)
                    {
                        if (firstName === null || firstName === 'null')
                        {
                            loadNavigation("AdminNavigation.jsp", userName);
                        } else
                        {
                            loadNavigation("AdminNavigation.jsp", firstName);
                        }
                        servletLoadFile('AdminHome.jsp', null);
                    } else if (userType === STANDARD_USER) {
                        if (firstName === null || firstName === 'null')
                        {
                            loadNavigation("UserNavigation.jsp", userName);
                        } else
                        {
                            loadNavigation("UserNavigation.jsp", firstName);
                        }
                        servletLoadFile('userHome.jsp', null);

                    } else
                    {
                        //loadNavigation("StandardNavigation.jsp", null);
                        // $("#message").html("User Type not valid");
                    }
                },
        error: function() {
            $("#message").html("Login Ajax call failed Internal Server Problem or Database Connection Failed");
        }
    });

}
function registerUser(form)
{
    var formData = $(form).serialize();
    alert(formData);
    //var rating = $(this).val(); //This captures the radio button's value, which ever clicked
    $.ajax({
        async: false,
        url: 'WebActionServlet',
        type: 'POST',
        data: formData,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("Register Ajax Call Failed Internal Server Problem or Database Connection Failed");
        }
    });

}
function updateUser(form)
{
    var formData = $(form).serialize();
    //alert(formData);
    //var rating = $(this).val(); //This captures the radio button's value, which ever clicked
    $.ajax({
        async: false,
        url: 'WebActionServlet',
        type: 'POST',
        data: formData,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("Update User Ajax Call Failed");
        }
    });
}
function setCaptcha(form)
{
    /* var randomNr1 = Math.floor(Math.random() * 10);
     var randomNr2 = Math.floor(Math.random() * 10);
     var totalNr = randomNr1 + randomNr2;*/

    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'setCaptcha'},
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                    $(form).find('#captchatext').text("Captcha — What is " + captchaNr1 + " + " + captchaNr2);
                    form.captchainput.pattern = captchaNr1 + captchaNr2;
                },
        error: function() {
            $("#message").html("Setting Captcha Failed");
        }
    });
}

function deleteUser(userIDArry)
{

    userIdJsonString = JSON.stringify(userIDArry);
    alert(userIdJsonString);
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'delete', deleteId: userIdJsonString},
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("delete User Ajax Call Failed");
        }
    });
}
function modifyUser(userID)
{
    var user = findUserInArray(userList, userID.value);
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'modify', userId: userID.value},
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#modifyUserModal").html(responseText);
                },
        error: function() {
            $("#message").html("modify User Ajax Call Failed");
        }
    });
}

function modifyReg(userID)
{
    //var user = findUserInArray(userList, userID.value);
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'modifyReg', userId: userID.value},
        success:
                function (responseText) {
                    // msg is the response you got from the server!
                    $("#modifyRegModal").html(responseText);
                },
        error: function () {
            $("#message").html("modify User Ajax Call Failed");
        }
    });
}
function fileUpload(form)
{
    $("#imgContainer").html("Loading...");
    var otherData = $(form).serialize();
    var formData = new FormData(form);
    $.ajax({
        url: 'WebActionServlet?' + otherData,
        type: 'POST',
        data: formData,
        async: false,
        cache: false,
        contentType: false,
        processData: false,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("File Upload Ajax Call Failed internal Server or Database Connection Error");
        }
    });
}
function loadProfileImage()
{
    $("#imgContainer").load("loadProfileImage.jsp");

}

$("#search").keyup(function() {
    var value = this.value.toLowerCase().trim();

    $("table tr").each(function(index) {
        if (!index)
            return;
        $(this).find("td").each(function() {
            var id = $(this).text().toLowerCase().trim();
            var not_found = (id.indexOf(value) == -1);
            $(this).closest('tr').toggle(!not_found);
            return not_found;
        });
    });
});

function updatePassword(form)
{
    var formData = $(form).serialize();
    alert(formData);
    //var rating = $(this).val(); //This captures the radio button's value, which ever clicked
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: formData,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("Update Password Ajax Call Failed");
        }
    });
}

$('#userId').prop('checked', true);
$('#userId').prop('checked', false);



function verifyEmail(userID, token)
{
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'verifyEmail', userName: userID, token: token},
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("Verify Email Ajax Call Failed");
        }
    });
}
function sendVerificationMail(form)
{
    var formData = $(form).serialize();
    formData = formData + "&action=resendVerificationMail&userNameModified=" + userNameModified;
    $("#message").html("Sending... ");
    //var rating = $(this).val(); //This captures the radio button's value, which ever clicked
    $.ajax({
        url: 'WebActionServlet',
        type: 'POST',
        data: formData,
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    $("#message").html(responseText);
                },
        error: function() {
            $("#message").html("Send Verification Mail Ajax Call Failed");
        }
    });
}
function manageUsers()
{
    //alert("ManageUsers");
    //$("#message").html("Loading... ");
    $.ajax({
        async: false,
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'manageUsers'},
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    // $("#message").html("");
                    $("#ajaxContainer").html(responseText);
                    if (sessionActive === false || sessionActive === 'false')
                    {
                        loadNavigation("StandardNavigation.jsp", null);
                        sessionActive = true;
                    }
                },
        error: function() {
            $("#message").html("User management Ajax failed");
        }
    });
}

function manageRegistrar()
{
    //alert("ManageUsers");
    //$("#message").html("Loading... ");
    $.ajax({
        async: false,
        url: 'WebActionServlet',
        type: 'POST',
        data: {action: 'manageRegistrar'},
        success:
                function(responseText) {
                    // msg is the response you got from the server!
                    // $("#message").html("");
                    $("#ajaxContainer").html(responseText);
                    if (sessionActive === false || sessionActive === 'false')
                    {
                        loadNavigation("StandardNavigation.jsp", null);
                        sessionActive = true;
                    }
                },
        error: function() {
            $("#message").html("Registrar management Ajax failed");
        }
    });
}


function findUserInArray(userArray, userId)
{
    for (var user in userArray)
    {
        //alert(userArray[user].userId + " " + userId);
        if (userArray[user].userId == userId)
        {
            return userArray[user];
        }
    }
    return null;
}
function profileImgUpdate(form)
{
    var fileName = $("#uploadimage").val();
    var extension = fileName.substr(fileName.lastIndexOf(".") + 1);
    activeUser.profileImage = activeUser.userId + "." + extension;
    /* var userIndex = userList.indexOf(activeUser);
     userList[userIndex]=activeUser;
     alert(userIndex);*/
    fileUpload(form);
    loadProfileImage();
}
function updateUserProfile(form)
{
    activeUser.firstName = $("#fname").val();
    activeUser.middleName = $("#mname").val();
    activeUser.lastName = $("#lname").val();
    activeUser.userName = $("#uname").val();
    activeUser.address = $("#Address").val();
    activeUser.town = $("#Town").val();
    activeUser.state = $("#State").val();

    activeUser.country = $("#Country").val();
    activeUser.postCode = $("#Postcode").val();
    activeUser.phone1 = $("#Hnumber").val();
    activeUser.phone2 = $("#Mnumber").val();
    activeUser.idtype = $("#idproof").val();
    activeUser.idref = $("#idref").val();
    activeUser.addressProofType = $("#addprooftype").val();
    activeUser.addressRef = $("#addref").val();
    updateUser(form);
}