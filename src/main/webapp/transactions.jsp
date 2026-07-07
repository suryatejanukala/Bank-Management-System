<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Transaction Inquiry</title>
<link rel="stylesheet" href="css/navigation.css">
<style>
    /* Styling the form and layout */
    .transaction-form-container {
        max-width: 400px;
        margin: 220px auto;
        padding: 2rem;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    .transaction-form input[type="number"],
    .transaction-form input[type="password"],
    .transaction-form button {
        width: 100%;
        padding: 0.75rem;
        margin: 10px 0;
        border-radius: 5px;
    }
    .transaction-form button {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .transaction-form button:hover {
        background-color: #0056b3;
    }
    .forgot-pin {
        margin-top: 1rem;
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
    <div class="transaction-form-container">
        <h2>Transaction Inquiry</h2>
        <form class="transaction-form" action="viewTransactions" method="post">
        	<%
        	String InvalidAccountNumber=(String)request.getAttribute("InvalidAccountNumber");
        	if(InvalidAccountNumber!=null)
        		out.print("<p style='color:red'>"+InvalidAccountNumber+"</p>");
        	%>
            <input type="number" id="accountNumber" name="accountNumber" placeholder="Enter Account Number" required>
            <%
        	String InvalidPin=(String)request.getAttribute("InvalidPin");
        	if(InvalidPin!=null)
        		out.print("<p style='color:red'>"+InvalidPin+"</p>");
        	%>
            <input type="password" id="pin" name="pin" placeholder="Enter PIN" required>
            <button type="submit">View Transactions</button>
        </form>
        
       
        <div class="forgot-pin">
            <p><a href="changepin.jsp">Forgot PIN?</a></p>
        </div>
    </div>
</body>
</html>
