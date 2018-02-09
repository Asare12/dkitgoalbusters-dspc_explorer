var count = 0;

function showAdminLogin() {
   
   count++;
	
	if (count >= 5) {
      count = 0;
	location.href = './log_in.jsp';
	
	//window.location.href = 'https://i.pinimg.com/originals/97/54/9f/97549feaeb68771c77354e9245ee9345.jpg' ;

	
    }
}
