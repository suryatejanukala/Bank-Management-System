
    const firstName = document.getElementById("firstName").value.trim();
    const lastName = document.getElementById("lastName").value.trim();
    const dob = new Date(document.getElementById("dob").value);
    const email = document.getElementById("email").value.trim();
    const password = document.getElementById("password").value;
    const confirmPassword = document.getElementById("confirmPassword").value;
    const errorMessage = document.getElementById("error-message");
    
	function pass()
	{
	    var password=document.querySelector("#password").value;
	    var passlen=password.length;
	    var status=document.getElementById("status");
	    if(passlen==0)
	        status.innerHTML=""
	    else if(passlen>=1 && passlen<=5)
	    {
	        status.innerHTML="Weak Password"
	        status.style.color="red";
	    }
	    else if(passlen>=6 && passlen<=8)
	    {
	        status.innerHTML="Avg Password"
	        status.style.color="orange";
	    }
	    else 
	    {
	        status.innerHTML="Strong Password"
	        status.style.color="darkgreen";
	    }
	} 