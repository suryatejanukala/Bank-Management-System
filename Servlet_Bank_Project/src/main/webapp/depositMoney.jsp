<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Money</title>
    <link rel="stylesheet" href="css/navigation.css">
    
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            padding: 20px;
            margin-top: 200px; /* Adjust this to avoid overlapping with the navigation */
        }
        
        h2 {
            text-align: center;
            color: #007bff;
        }

        .form-container {
            max-width: 400px;
            margin: auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
        }

        input[type="text"],
        input[type="number"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        button {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: white;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 16px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .forgot-password {
            text-align: right;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Deposit Money</h2>
        <form action="depositMoney" method="post">
            <div class="form-group">
                <%
                	String InvalidAccount=(String)request.getAttribute("InvalidAccount");
                	if(InvalidAccount!=null)
                		out.println("<p style='color:red;'>"+InvalidAccount+"</p>");
                %>
                <input type="text" id="accountNumber" name="accountNumber" placeholder="Enter Account Number" required>
            </div>
            <div class="form-group">
                
                <input type="number" id="amount" name="amount" min="1" max="100000" placeholder="Enter Amount" required>
            </div>
            <div class="form-group">
                <%
                	String InvalidPin=(String)request.getAttribute("InvalidPin");
                	if(InvalidPin!=null)
                		out.println("<p style='color:red;'>"+InvalidPin+"</p>");
                %>
                <input type="password" id="pin" name="pin" placeholder="Enter PIN" required>
                <div class="forgot-password">
                    <a href="changepin.jsp">Forgot Pin?</a>
                </div>
            </div>
            <button type="submit">Deposit Money</button>
            <%
                	String deposited=(String)request.getAttribute("deposited");
                	if(deposited!=null)
                		out.println("<p style='color:green;'>"+deposited+"</p>");
            %>
        </form>
    </div>
</body>
</html>
