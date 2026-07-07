<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sign Up</title>
    <style>
        /* Basic Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background: linear-gradient(135deg, #f08080, #f0e68c); /* Soft red background gradient */
            font-family: Arial, sans-serif;
        }

        .signup-container {
            width: 350px;
            padding: 2rem;
            background-color: #ffffffcc; /* White with slight transparency */
            border-radius: 12px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3);
            text-align: left;
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #b22222; /* Dark red */
            font-weight: bold;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #b22222; /* Dark red for labels */
            font-weight: 500;
        }

        input[type="text"],
        input[type="email"],
        input[type="password"],
        input[type="date"] {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        .error-message {
            color: #d9534f;
            font-size: 0.9rem;
            margin-bottom: 1rem;
        }

        #status, #confirm_status {
            font-size: 0.9rem;
            margin-top: -0.8rem;
            margin-bottom: 1rem;
        }

        .options {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 1rem;
        }

        .login {
            color: #b22222; /* Dark red for login link */
            text-decoration: none;
            font-size: 0.9rem;
        }

        .login:hover {
            text-decoration: underline;
        }

        button.signup-btn {
            padding: 0.7rem 1.5rem;
            background-color: #b22222; /* Dark red button */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button.signup-btn:hover {
            background-color: #8b0000; /* Darker red */
        }
    </style>
</head>
<body>
    <div class="signup-container">
        <h2>Sign Up</h2>
        <form id="signupForm" action="signupForm" method="post">
            <input type="text" id="firstName" name="firstName" placeholder="Enter Your Full Name" required>
            <%
                String email = (String) request.getAttribute("email");
                if (email != null)
                    out.print("<p style='color:red;'>" + email + "</p>");
            %>
            <input type="email" id="email" name="email" placeholder="Enter Your Email Id" required>

            <input type="password" id="password" name="password" oninput="pass()" placeholder="Enter Password" required>
            <p id="status"></p>

            <input type="password" id="confirmPassword" oninput="checkConfirmPass()" placeholder="Confirm Password" name="confirmPassword" required>
            <p id="confirm_status"></p>

            <div class="options">
                <a href="login.jsp" class="login">Login</a>
                <button type="submit" class="signup-btn" disabled>Sign Up</button>
            </div>
        </form>
    </div>

    <script type="text/javascript">
    function pass() {
        var password = document.querySelector("#password").value;
        var status = document.getElementById("status");

        // Variables to track if there are letters, digits, and symbols
        var hasLetter = false;
        var hasDigit = false;
        var hasSymbol = false;

        // Loop through each character in the password to determine its type
        for (var i = 0; i < password.length; i++) {
            var char = password[i];
            if ((char >= 'a' && char <= 'z') || (char >= 'A' && char <= 'Z')) {
                hasLetter = true;
            } else if (char >= '0' && char <= '9') {
                hasDigit = true;
            } else {
                hasSymbol = true;
            }
        }

        // Determine password strength based on criteria
        if (password.length === 0) {
            status.innerHTML = "";
        } else if (password.length < 6 || (!hasLetter && !hasDigit && !hasSymbol)) {
            status.innerHTML = "Weak Password";
            status.style.color = "red";
        } else if ((hasLetter && hasDigit && password.length<=8) || (hasLetter && hasSymbol && password.length<=8) || (hasDigit && hasSymbol && password.length<=8)) {
            status.innerHTML = "Average Password";
            status.style.color = "orange";
        } else if (hasLetter && hasDigit && hasSymbol && password.length >= 8) {
            status.innerHTML = "Strong Password";
            status.style.color = "darkgreen";
        } else {
            status.innerHTML = "Weak Password";
            status.style.color = "red";
        }
    }


        function checkConfirmPass() {
            var password = document.querySelector("#password").value;
            var confirmPassword = document.querySelector("#confirmPassword").value;
            var confirmStatus = document.getElementById("confirm_status");
            var signUpButton = document.querySelector(".signup-btn");

            if (password === confirmPassword && password.length > 0) {
                confirmStatus.innerHTML = "Passwords match";
                confirmStatus.style.color = "darkgreen";
                signUpButton.disabled = false;
            } else {
                confirmStatus.innerHTML = "Passwords do not match";
                confirmStatus.style.color = "red";
                signUpButton.disabled = true;
            }
        }
    </script>
</body>
</html>
