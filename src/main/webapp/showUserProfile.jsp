<%@page import="BankDto.RegistrationDto"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>User Profile</title>
    <link rel="stylesheet" href="css/navigation.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            padding: 20px;
        }

        .container {
            max-width: 600px;
            margin: 220px auto;
            background-color: white;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        #header {
            text-align: center;
            color: #007bff;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .error-message {
            color: red;
            text-align: center;
            font-size: 18px;
            margin: 20px 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
            text-align: left;
        }

        th, td {
            padding: 12px;
            border: 1px solid #ddd;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        td {
            background-color: #f9f9f9;
        }
    </style>
</head>
<body>
    <div class="container">
        <%
            RegistrationDto r = (RegistrationDto) request.getAttribute("profile");
            if (r == null) {
        %>
            <p class="error-message">Sorry for the inconvenience. Please log in again to view your profile.</p>
        <% 
            } else { 
        %>
            <div id="header">User Profile</div>
            <table>
                <tr>
                    <th>User Name</th>
                    <th>Email ID</th>
                </tr>
                <tr>
                    <td><%= r.getFname() %></td>
                    <td><%= r.getEmail() %></td>
                </tr>
            </table>
        <% 
            } 
        %>
    </div>
</body>
</html>
