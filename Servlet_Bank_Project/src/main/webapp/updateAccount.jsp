<%@page import="BankDto.BankAccountDto"%>
<%@ include file="navigation.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Profile</title>
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
        .profile-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            max-width: 400px;
            width: 100%;
            position: relative;
        }
        .profile-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            font-size: 24px;
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
            color: #555;
        }
        .form-group input[type="text"],
        .form-group input[type="number"],
        .form-group input[type="date"] {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 16px;
            background-color: #f9f9f9;
            color: #333;
        }
        .form-group input[type="button"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            border: none;
            border-radius: 4px;
            color: #fff;
            font-size: 16px;
            cursor: pointer;
            margin-top: 10px;
            opacity: 0.6; /* Start disabled */
            pointer-events: none; /* Prevent clicks */
        }
        .form-group input[type="button"]:hover {
            background-color: #0056b3;
        }
        .error-message, .success-message {
            color: red;
            text-align: center;
            margin-top: 20px;
            font-weight: bold;
        }
        .success-message {
            color: green;
        }
        .modal {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000;
        }
        .modal-content {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            text-align: center;
            max-width: 400px;
            width: 100%;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.2);
        }
        .modal-content p {
            font-size: 16px;
            color: #333;
            margin-bottom: 20px;
        }
        .modal-buttons button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 4px;
            font-size: 16px;
            cursor: pointer;
        }
        .modal-buttons .confirm-btn {
            background-color: #007bff;
            color: #fff;
        }
        .modal-buttons .cancel-btn {
            background-color: #ccc;
            color: #333;
        }
    </style>
    <script>
        function showConfirmation() {
            document.getElementById('confirmationModal').style.display = 'flex';
        }

        function hideConfirmation() {
            document.getElementById('confirmationModal').style.display = 'none';
        }

        function confirmUpdate() {
            hideConfirmation();
            document.getElementById('updateForm').submit();
        }

        function checkFormFields() {
            const fname = document.querySelector('input[name="fname"]').value.trim();
            const address = document.querySelector('input[name="add"]').value.trim();
            const dob = document.querySelector('input[name="dob"]').value.trim();
            const pan = document.querySelector('input[name="pan"]').value.trim();

            const button = document.querySelector('input[type="button"]');

            // Check if all required fields are filled
            if (fname && address && dob && pan) {
                button.style.opacity = '1'; // Enable button
                button.style.pointerEvents = 'auto'; // Allow clicks
            } else {
                button.style.opacity = '0.6'; // Disable button
                button.style.pointerEvents = 'none'; // Prevent clicks
            }
        }

        // Add event listeners to input fields to check values
        window.onload = function() {
            const inputs = document.querySelectorAll('input[type="text"], input[type="date"]');
            inputs.forEach(input => {
                input.addEventListener('input', checkFormFields);
            });
        };

        function checkPanValidity() {
            const panInput = document.getElementById('pan').value;
            const updateButton = document.getElementById('updateButton');
            
            if (validatePanCard(panInput)) {
                updateButton.disabled = false; // Enable the button if valid
            } else {
                updateButton.disabled = true; // Disable the button if invalid
            }
        }

        function validatePanCard(pan) {
            pan = pan.toUpperCase();
            if (pan.length !== 10) {
                return false;
            }

            for (let i = 0; i < 5; i++) {
                if (!/[A-Z]/.test(pan.charAt(i))) {
                    return false;
                }
            }

            for (let i = 5; i < 9; i++) {
                if (!/[0-9]/.test(pan.charAt(i))) {
                    return false;
                }
            }

            if (!/[A-Z]/.test(pan.charAt(9))) {
                return false;
            }

            return true;
        }
    </script>
</head>
<body>
    <form id="updateForm" action="updateRunning" method="get">
    <div class="profile-container">
        <h2>Update Account Form</h2>
        <% 
            BankAccountDto profile = (BankAccountDto) request.getAttribute("object");
            String error = (String) request.getAttribute("error");
            if (profile != null) { 
        %>
            <input type="number" name="pin" value="<%=profile.getPin() %>" hidden=true>
            <div class="form-group">
                <label>Full Name:</label>
                <input type="text" name="fname" value="<%= profile.getFullName() %>" placeholder="Enter your full name">
            </div>
            <div class="form-group">
                <label>Address:</label>
                <input type="text" name="add" value="<%= profile.getAddress() %>" placeholder="Your updated address">
            </div>
            <div class="form-group">
                <label>Date of Birth:</label>
                <input type="date" name="dob" value="<%= profile.getDob() %>" min="1940-12-31" max="2005-12-31" placeholder="Enter your correct dob">
            </div>
            <div class="form-group">
                <label>PAN Update:</label>
                <input type="text" name="pan" id="pan" value="<%= profile.getPanNo() %>" placeholder="Enter your Pan No in the format of ABCDE1234F " oninput="checkPanValidity()">
            </div>

            <div class="form-group">
                <input type="button" id="updateButton" value="Update Form Details" onclick="showConfirmation()" disabled>
            </div>
        <% 
            } else if (error != null) { 
        %>
            <p class="error-message"><%= error %></p>
        <% 
            } 
        %>
        <%if((String) request.getAttribute("successMessage")!=null)
        { %>
        <p class="success-message" style="color: green; text-align: center; font-weight: bold;"><%= (String) request.getAttribute("successMessage") %></p>
        <% }%>
    </div>
    
    <!-- Confirmation Modal -->
    <div id="confirmationModal" class="modal">
        <div class="modal-content">
            <p>If you update the form, you must re-login to apply the changes to your account. Do you want to proceed?</p>
            <div class="modal-buttons">
                <button class="confirm-btn" onclick="confirmUpdate()">Yes</button>
                <button class="cancel-btn" onclick="hideConfirmation()">No</button>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
