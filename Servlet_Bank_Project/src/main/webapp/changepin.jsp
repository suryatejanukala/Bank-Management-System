<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="navigation.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Change PIN</title>
<link rel="stylesheet" href="css/navigation.css">
<style>
    /* Styling the form and layout */
    .change-pin-container {
        max-width: 400px;
        margin: 150px auto;
        padding: 2rem;
        background-color: #f9f9f9;
        border-radius: 8px;
        box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.2);
        text-align: center;
    }
    .change-pin-form input[type="email"],
    .change-pin-form input[type="password"],
    .change-pin-form button {
        width: 100%;
        padding: 0.75rem;
        margin: 10px 0;
        border-radius: 5px;
        border: 1px solid #ccc;
    }
    .change-pin-form button {
        background-color: #007bff;
        color: white;
        border: none;
        cursor: pointer;
        transition: background-color 0.3s;
    }
    .change-pin-form button:hover {
        background-color: #0056b3;
    }
    .back-link {
        margin-top: 1rem;
    }
    .back-link a {
        color: #007bff;
        text-decoration: none;
        font-size: 0.9rem;
    }
    .back-link a:hover {
        text-decoration: underline;
    }
</style>
</head>
<body>
    <div class="change-pin-container">
        <h2>Change PIN</h2>
        <form class="change-pin-form" action="changePin" method="post">
            <% 
                String emailError = (String) request.getAttribute("email");
                String successMessage = (String) request.getAttribute("success");
                String errorMessage = (String) request.getAttribute("error");
                if (emailError != null) out.print("<p style='color:red;'>" + emailError + "</p>");
                if (successMessage != null) out.print("<p style='color:green;'>" + successMessage + "</p>");
                if (errorMessage != null) out.print("<p style='color:red;'>" + errorMessage + "</p>");
            %>
            <input type="email" id="email" name="email" placeholder="Enter your Email ID" required>
            <input type="password" id="newPin" name="newPin" placeholder="Enter New 4-Digit PIN" pattern="\d{4}" title="Enter a 4-digit PIN" required>
            <input type="password" id="confirmPin" name="confirmPin" placeholder="Confirm New PIN" pattern="\d{4}" title="Enter a 4-digit PIN" required>
            <button type="submit" id="changePinButton" disabled>Change PIN</button>
        </form>
        
        <!-- Back link -->
        <div class="back-link">
            <p><a href="home.jsp">Remember PIN? Go To Home</a></p>
        </div>
    </div>

    <script>
        const newPinInput = document.getElementById('newPin');
        const confirmPinInput = document.getElementById('confirmPin');
        const changePinButton = document.getElementById('changePinButton');

        // Function to check if the PINs match
        function checkPinMatch() {
            if (newPinInput.value === confirmPinInput.value && newPinInput.value !== '') {
                changePinButton.disabled = false; // Enable the button
            } else {
                changePinButton.disabled = true; // Disable the button
            }
        }

        // Add event listeners to the input fields
        newPinInput.addEventListener('input', checkPinMatch);
        confirmPinInput.addEventListener('input', checkPinMatch);
    </script>
</body>
</html>
