<%@ page import="BankDto.TransactionDto" %>
<%@ page import="java.util.List" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Transaction Details</title>
    <link rel="stylesheet" href="css/navigation.css">
    <style>
        /* Centering the table and adding margin */
        body {
            display: flex;
            justify-content: center;
            align-items: center;
            flex-direction: column;
            margin-top: 20px;
        }
        
        table {
            width: 80%;
            border-collapse: collapse;
            margin: 40px auto;
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
        }

        th, td {
            padding: 10px;
            text-align: center;
            border: 1px solid #ddd;
        }

        th {
            background-color: #f2f2f2;
            font-weight: bold;
        }

        /* Conditional row styling */
        .debit-row {
            background-color: #ffcccc; /* Light red for debit */
        }
        
        .credit-row {
            background-color: #ccffcc; /* Light green for credit */
        }
    </style>
</head>
<body>
    <h2>Transaction Details</h2>
    <table>
        <tr>
            <th>TID</th>
            <th>Account Number</th>
            <th>Debit/Credit</th>
            <th>Transfer to</th>
            <th>Amount</th>
            <th>Transaction Time and Date</th>
            <th>Email Id</th>
        </tr>
        <%
            List<TransactionDto> transactionList = (List<TransactionDto>)request.getAttribute("transactions");
            if (transactionList != null && !transactionList.isEmpty()) {
                for (TransactionDto transaction : transactionList) {
                    // Determine row class based on transaction type
                    String rowClass = "debit".equalsIgnoreCase(transaction.getTranType()) ? "debit-row" : "credit-row";
        %>
        <tr class="<%= rowClass %>">
            <td><%= transaction.getTid() %></td>
            <td><%= transaction.getReciptentNumber()  %></td>
            <td><%= transaction.getTranType() %></td>
            <td><%= transaction.getAccountNumber() %></td>
            <td><%= transaction.getAmount() %></td>
            <td><%= transaction.getTranTime() + " and " + transaction.getTranDate() %></td>
            <td><%= transaction.getEmail() %></td>
        </tr>
        <%
                }
            } else {
        %>
        <tr>
            <td colspan="7" style="text-align: center;">No transactions found</td>
        </tr>
        <%
            }
        %>
    </table>
</body>
</html>
