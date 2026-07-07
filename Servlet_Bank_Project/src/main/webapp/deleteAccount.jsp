<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete Account</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .delete-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            text-align: center;
        }
        .delete-container h2 {
            color: #333;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group input[type="checkbox"] {
            margin: 0 10px 10px 0;
            transform: scale(1.2);
            cursor: pointer;
        }
        .form-group label {
            font-size: 16px;
            color: #555;
        }
        .delete-button {
            width: 100%;
            padding: 10px;
            background-color: #d9534f;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            font-weight: bold;
        }
        .delete-button:hover {
            background-color: #c9302c;
        }
    </style>
</head>
<body>
    <div class="delete-container">
        <h2>Delete Account</h2>
        <form action="deleteAnyAccount" method="post">
            <div class="form-group">
            <%
            	String currentAccountDeleted=(String)request.getAttribute("currentAccountDeleted");
            	if(currentAccountDeleted!=null)
            		out.print("<p style='color:red'>"+currentAccountDeleted+"</p>");
            %>
            <%
            	String NoCurrentAccount=(String)request.getAttribute("NoCurrentAccount");
            	if(NoCurrentAccount!=null)
            		out.print("<p style='color:red'>"+NoCurrentAccount+"</p>");
            %>
                <input type="radio" name="account" value="Current Account">
                <label for="current">Current Account</label>
            </div>
            <div class="form-group">
            <%
            	String savingsAccountDeleted=(String)request.getAttribute("savingsAccountDeleted");
            	if(savingsAccountDeleted!=null)
            		out.print("<p style='color:red'>"+savingsAccountDeleted+"</p>");
            %>
            <%
            	String NoSavingsAccount=(String)request.getAttribute("NoSavingsAccount");
            	if(NoSavingsAccount!=null)
            		out.print("<p style='color:red'>"+NoSavingsAccount+"</p>");
            %>
                <input type="radio" name="account" value="Savings Account">
                <label for="savings">Savings Account</label>
            </div>
            <div class="form-group">
            <%
            	String accountsDeleted=(String)request.getAttribute("accountsDeleted");
            	if(accountsDeleted!=null)
            		out.print("<p style='color:red'>"+accountsDeleted+"</p>");
            %>
            <%
            	String noAccount=(String)request.getAttribute("noAccount");
            	if(noAccount!=null)
            		out.print("<p style='color:red'>"+noAccount+"</p>");
            %>
                <input type="radio" name="account" value="Both">
                <label for="both">Both Accounts</label>
            </div>
            <button type="submit" class="delete-button">Delete</button>
        </form>
    </div>
</body>
</html>
