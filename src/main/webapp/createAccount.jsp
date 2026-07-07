<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Create Account</title>
<link rel="stylesheet" href="css/navigation.css">

<style>
    /* Basic Reset */
    * {
        margin: 0;
        padding: 0;
        box-sizing: border-box;
    }

    body {
        font-family: Arial, sans-serif;
        background-color: #f0f2f5;
        display: flex;
        justify-content: center;
        align-items: flex-start; /* Align items at the start to prevent overlap */
        height: 100vh;
        padding-top: 80px; /* Adjust top padding to accommodate navigation bar */
    }

    .createAccount-container {
        width: 100%;
        max-width: 500px;
        padding: 2rem;
        background-color: #ffffff;
        border: 2px solid #007bff;
        border-radius: 10px;
        box-shadow: 0px 4px 12px rgba(0, 0, 0, 0.1);
        margin-top: 20px; /* Add margin to separate from the top */
    }

    h1 {
        color: #333;
        text-align: center;
        font-size: 1.8rem;
        margin-bottom: 1.5rem;
    }

    input[type="text"],
    input[type="tel"],
    input[type="password"],
    input[type="number"],
    input[type="date"],
    select {
        padding: 0.5rem;
        border: 1px solid #ccc;
        border-radius: 5px;
        width: 100%;
        margin-bottom: 1.5rem; /* Ensure there is space below each input */
    }

    button {
        width: 100%;
        padding: 0.75rem;
        background-color: #007bff;
        color: white;
        border: none;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s;
        font-size: 1rem;
        font-weight: bold;
    }

    button:hover {
        background-color: #0056b3;
    }
    
    label {
    display: block;
    margin-bottom: 0.5rem;
    color: #333;
	}
</style>
</head>
<body>
    

    <div class="createAccount-container">
        <h1>Create New Account</h1>
        <form id="createAccountForm" action="createAccountForm" method="post">
        	<% 
        		String email="";
        		Cookie[] cookie=request.getCookies();
        		for(Cookie i:cookie)
        		{
        			if(i.getName().equals("emailId")){
        				email=i.getValue(); 
        			 }
        		}
        	%>
        	<input type="text" name="mail" hidden="true" value="<%= email%>" >
            <input type="text" id="fullName" name="fullName" required placeholder="Full Name">
			<input type="number" name="phno" required placeholder="Enter the phone number" min="1000000000" max="9999999999">
            <%
            String accountType=(String)request.getAttribute("accountType");
            if(accountType!=null)
            	out.print("<p style='color:red;'>"+accountType+"</p>");
            %>
            <select id="accountType" name="accountType" required>
                <option value="" disabled selected>Select account type</option>
                <option value="Savings Account">Savings Account</option>
                <option value="Current Account">Current Account</option>
            </select>

            <select id="branch" name="branch" required>
                <option value="" disabled selected>Select your branch</option>
                <option value="KPHB">KPHB</option>
                <option value="AMEERPET">AMEERPET</option>
                <option value="DILSUKHNAGAR">DILSUKHNAGAR</option>
            </select>
            
			<label>Date Of Birth:</label>
			<input type="date" id="dob" name="dob" min="1940-12-31" max="2005-12-31" placeholder="Date of birth" required>
			
            <input type="number" id="aadhaar" min="100000000000" max="999999999999" name="aadhaar" required placeholder="Aadhaar Number">
			<% 
				String pan=(String)request.getAttribute("pan");
				if(pan!=null)
					out.print("<p style='color:red'>"+pan+"</p>");
			%>
            <input type="text" id="pan" name="pan" required placeholder="PAN Card Number">

            <input type="text" id="address" name="address" required placeholder="Address">
			<%
				String error=(String)request.getAttribute("error");
				if(error!=null)
					out.print("<p style='color:red;'>"+error+"</p>");
			%>
            <input type="number" id="pin" name="pin" required placeholder="Enter 4 digit PIN" min="1000" max="10000">

            <input type="number" id="confirmPin" name="confirmPin" required placeholder="Confirm PIN" min="1000" max="10000">

            <button type="submit" class="signup-btn">Create Account</button>
            <%
				String message=(String)request.getAttribute("message");
				if(message!=null)
					out.print("<p style='color:green;'>"+message+"</p>");
			%>
            
        </form>
    </div>
</body>
</html>
