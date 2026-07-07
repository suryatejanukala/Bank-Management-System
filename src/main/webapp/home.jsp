<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyBank Account Home</title>
    <link rel="stylesheet" href="css/account-home.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f2f5;
            margin-top: 80px;
        }

        .container {
            max-width: 800px;
            margin: 200px auto;
            padding: 2rem;
            background: white;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        h1 {
            color: #007bff;
        }

        .account-info {
            margin: 1.5rem 0;
            padding: 1.5rem;
            border: 1px solid #007bff;
            border-radius: 8px;
            background-color: #e7f1ff;
        }

        .account-info p {
            margin: 0.5rem 0;
        }

        .button {
            display: inline-block;
            margin-top: 1rem;
            padding: 10px 15px;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .button:hover {
            background-color: #0056b3;
        }
        
        #depoist{
        	margin-left:150px;
        }
    </style>
</head>
<% 
        String jdbcURL = "jdbc:mysql://localhost:3306/bankwebapp";
        String dbUser = "root";
        String dbPass = "Surya@20/07/2002";

        int savingsCount = 0;
        int currentCount = 0;
        int totalAccounts = 0;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = DriverManager.getConnection(jdbcURL, dbUser, dbPass);

            String savingsQuery = "SELECT COUNT(*) FROM bank_accounts WHERE accountType = 'Savings Account'";
            String currentQuery = "SELECT COUNT(*) FROM bank_accounts WHERE accountType = 'Current Account'";
            String totalQuery = "SELECT COUNT(*) FROM user_register";

            Statement stmt1 = conn.createStatement();
            ResultSet rs1 = stmt1.executeQuery(savingsQuery);
            if (rs1.next()) {
                savingsCount = rs1.getInt(1);
            }

            Statement stmt2 = conn.createStatement();
            ResultSet rs2 = stmt2.executeQuery(currentQuery);
            if (rs2.next()) {
                currentCount = rs2.getInt(1);
            }

            Statement stmt3 = conn.createStatement();
            ResultSet rs3 = stmt3.executeQuery(totalQuery);
            if (rs3.next()) {
                totalAccounts = rs3.getInt(1);
            }

            rs1.close();
            stmt1.close();
            rs2.close();
            stmt2.close();
            rs3.close();
            stmt3.close();
            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
        }
    %>
<body>
    <div class="container">
        <h1>Welcome to the International Bank</h1>
        <div class="account-info">
            <h2>Bank Info</h2>
            <p><strong>Total Savings Accounts:</strong> <%= savingsCount %></p>
            <p><strong>Total Current Accounts:</strong> <%= currentCount %></p>
            <p><strong>Total Registered Accounts:</strong> <%= totalAccounts %></p>
        </div>
        
        <h2>Quick Links</h2>
        <a href="depositMoney.jsp" class="button" id="depoist">Deposit Money</a>
        <a href="transfer.jsp" class="button">Transfer Funds</a>
        <a href="transactions.jsp" class="button">View Transactions</a>
    </div>
</body>
</html>
