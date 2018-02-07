/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */



/* global a */

$(document).ready(function(){
    $(a.mobile).click(function(){
        $(".sidebar").slideToggle('fast');
    });
});
//gets the appriopriate content for given fragment identifer
function getContent(fragmentId){
    var partial = {
        dashboard: "this is the dash board. welcome"
    };
    
    return partial[fragmentId];
}

function navigate(){
        //get a reference to "content" div
    var contentDiv = document.getElementById("content");
    // set content div to contain current hash value
    
    //Isolate fragement identifier using substring
    //This gets rid of the hash
    fragmentId = location.hash.substr(1);
    
    contentDiv.innerHTML = getContent(fragmentId);
}
//if no fragment identifier is provided
if(!location.hash){
    //default to (#DashBoard)
    location.hash = "#dashboard"; 
}

//Navigate once to the initial value
navigate();
//navigate whenever the fragment identifier value changes
window.addEventListener("hashchange",function(){
    navigate();
});

//updates dynamic content based on fragment identifier


