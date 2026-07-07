<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%@ include file="navigation.jsp" %>
<html lang="en">
<head>
	<link rel="stylesheet" href="css/navigation.css">
    <meta charset="UTF-8">
    <title>Check Balance</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .form-container {
            max-width: 400px;
            width: 100%;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            text-align: center;
            color: #007bff;
            margin-bottom: 20px;
        }

        .form-group {
            margin-bottom: 15px;
        }

        label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }

        input[type="number"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
        }

        .error-message {
            color: red;
            font-size: 14px;
            margin: 5px 0;
        }

        .success-message {
            color: green;
            font-size: 18px;
            text-align: center;
            margin: 20px 0;
        }

        .forgot-pin {
            text-align: right;
            margin-top: 5px;
        }

        .forgot-pin a {
            color: #007bff;
            text-decoration: none;
        }

        .forgot-pin a:hover {
            text-decoration: underline;
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
    </style>
</head>
<body>
    <div class="form-container">
        <h2>Check Balance</h2>
        <form action="showBalance" method="post">
            <div class="form-group">
                <input type="number" name="accountNumber" placeholder="Enter Your Account Number" required>
                <%
                    String InvalidAccountNumber = (String) request.getAttribute("InvalidAccountNumber");
                    if (InvalidAccountNumber != null) {
                        out.print("<p class='error-message'>" + InvalidAccountNumber + "</p>");
                    }
                %>
            </div>
            <div class="form-group">
                <input type="password" name="pin" placeholder="Enter Your PIN" required>
                <div class="forgot-pin">
                    <a href="changepin.jsp">Forgot PIN?</a>
                </div>
                <%
                    String InvalidPin = (String) request.getAttribute("InvalidPin");
                    if (InvalidPin != null) {
                        out.print("<p class='error-message'>" + InvalidPin + "</p>");
                    }
                %>
            </div>
            <%
                Integer Balance = (Integer) request.getAttribute("Balance");
                if (Balance != null) {
                    out.print("<h1 class='success-message'>The Balance in your account is: " + Balance + "</h1>");
                }
            %>
            <button type="submit" name="show">Show Balance</button>
            
        </form>
    </div>
</body>
</html>
