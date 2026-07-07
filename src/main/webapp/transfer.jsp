<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Money Transfer</title>
    <link rel="stylesheet" href="css/navigation.css">
    <style>
        /* Basic Styling for Layout */
        body {
            font-family: Arial, sans-serif;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-color: #f0f2f5;
        }
        
        .transfer-form {
            width: 100%;
            max-width: 400px;
            padding: 2rem;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            text-align: left;
        }

        .transfer-form h2 {
            text-align: center;
            color: #333;
            margin-bottom: 1.5rem;
        }

        .transfer-form input[type="text"],
        .transfer-form input[type="number"],
        .transfer-form input[type="password"] {
            width: 100%;
            padding: 0.5rem;
            margin: 0.5rem 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .transfer-form button {
            width: 100%;
            padding: 0.75rem;
            margin-top: 1rem;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .transfer-form button:hover {
            background-color: #0056b3;
        }

        .forgot-pin {
            text-align: right;
            margin-bottom: 1rem;
        }

        .forgot-pin a {
            color: #007bff;
            text-decoration: none;
            font-size: 0.9rem;
        }

        .forgot-pin a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
	
    <div class="transfer-form">
        <h2>Transfer Money</h2>
        <form action="transferMoney" method="post">
        <%
        String myAccount=(String)request.getAttribute("myAccount");
        if(myAccount!=null)
        	out.print("<p style='color:red'>"+myAccount+"</p>");
        %>
            <input type="text" id="yourAccount" name="yourAccount" placeholder="Your Account Number" required>
        <%
        String self=(String)request.getAttribute("self");
        if(self!=null)
        	out.print("<p style='color:red'>"+self+"</p>");
        %>
        <%
        String reciptent=(String)request.getAttribute("reciptent");
        if(reciptent!=null)
        	out.print("<p style='color:red'>"+reciptent+"</p>");
        %>
            <input type="text" id="transferAccount" name="transferAccount" placeholder="Recipient's Account Number" required>
        <%
        String ifsc=(String)request.getAttribute("ifsc");
        if(ifsc!=null)
        	out.print("<p style='color:red'>"+ifsc+"</p>");
        %>
            <input type="text" id="ifscCode" name="ifscCode" placeholder="Recipient's IFSC Code" required>
        <%
        String amount=(String)request.getAttribute("amount");
        if(amount!=null)
        	out.print("<p style='color:red'>"+amount+"</p>");
        %>
            <input type="number" id="amount" name="amount" placeholder="Amount to Transfer" required>
        <%
        String pin=(String)request.getAttribute("pin");
        if(pin!=null)
        	out.print("<p style='color:red'>"+pin+"</p>");
        %>
            <input type="password" id="pin" name="pin" placeholder="Enter Your PIN" required>
            
            <div class="forgot-pin">
                <a href="changepin">Forgot PIN?</a>
            </div>
		<%
		String done=(String)request.getAttribute("done");
        if(done!=null)
        	out.print("<h1 style='color:green'>"+done+"</h1>");
		%>
            <button type="submit">Send Money</button>
        </form>
    </div>

</body>
</html>
