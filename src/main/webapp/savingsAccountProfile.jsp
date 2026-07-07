<%@page import="BankDto.BankAccountDto"%>
<%@page import="BankDao.BankAccountDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<%@ include file="navigation.jsp" %> 
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Savings Account Profile</title>
    <link rel="stylesheet" href="css/navigation.css">
    <style >
    	/* General body styling */
body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5; /* Light background color */
    margin-top: 80px; /* Space for fixed navigation */
    padding: 20px; /* Add some padding around the content */
}

/* Title styling */
h2 {
    text-align: center; /* Center the title */
    margin-bottom: 20px; /* Space below the title */
    color: #007bff; /* Blue color for the title */
}

/* Table styling */
table {
    border-collapse: collapse; /* Merge borders for a clean look */
    margin: 20px auto; /* Center the table */
    width: 80%; /* Width of the table */
    background-color: white; /* White background for the table */
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1); /* Subtle shadow for depth */
    border-radius: 8px; /* Rounded corners */
}

/* Table headers */
th {
    background-color: #007bff; /* Blue header background */
    color: white; /* White text for headers */
    padding: 10px; /* Padding for header cells */
}

/* Table data cells */
td {
    padding: 10px; /* Padding for data cells */
    border: 1px solid #ddd; /* Light gray border for cells */
}

/* Hover effect on table rows */
tr:hover {
    background-color: #f1f1f1; /* Light gray on hover */
}

/* Error message styling */
.error-message {
    color: red; /* Red color for error messages */
    text-align: center; /* Center the error message */
    margin: 20px 0; /* Space around the message */
}
    	
    </style>
</head>
<body>
    <h2>Savings Account Profile</h2>
    
    <%
        BankAccountDto accountDetails = (BankAccountDto) request.getAttribute("accountDetails");
        
        if (accountDetails == null) {
    %>
        <p class="error-message">The account details are not available. Please create a current account first.</p>
    <%
        } else {
        	long accountNumber=new BankAccountDao().savingsAccountNumber(accountDetails.getEmail());
    %>

    <table>
        <tr>
            <th>Full Name</th>
            <td><%= accountDetails.getFullName() %></td>
        </tr>
        <tr>
            <th>Account Type</th>
            <td><%= accountDetails.getAcntType() %></td>
        </tr>
        <tr>
            <th>Email</th>
            <td><%= accountDetails.getEmail() %></td>
        </tr>
        <tr>
            <th>PAN Number</th>
            <td><%= accountDetails.getPanNo() %></td>
        </tr>
        <tr>
            <th>Account Number</th>
            <td><%= accountNumber %></td>
        </tr>
        <tr>
            <th>IFSC Code</th>
            <td><%= accountDetails.getIfsc() %></td>
        </tr>
        <tr>
            <th>Branch</th>
            <td><%= accountDetails.getBranch() %></td>
        </tr>
        <tr>
            <th>Phone Number</th>
            <td><%= accountDetails.getPhno() %></td>
        </tr>
        <tr>
            <th>Address</th>
            <td><%= accountDetails.getAddress() %></td>
        </tr>
        <tr>
            <th>Date of Birth</th>
            <td><%= accountDetails.getDob() %></td>
        </tr>
        <tr>
            <th>Aadhaar Number</th>
            <td><%= accountDetails.getAadharNo() %></td>
        </tr>
    </table>

    <%
        } 
    %>
</body>
</html>
