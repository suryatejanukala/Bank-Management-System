<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Forgot Password</title>
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
            background: linear-gradient(135deg, #f08080, #f0e68c); /* Red gradient background */
            font-family: Arial, sans-serif;
        }

        .container {
            width: 350px;
            padding: 2rem;
            background-color: #ffffffcc; /* White background with slight transparency */
            border-radius: 12px;
            box-shadow: 0 10px 15px rgba(0, 0, 0, 0.3);
            text-align: left;
        }

        h2 {
            text-align: center;
            margin-bottom: 1.5rem;
            color: #b22222; /* Dark red for title */
            font-weight: bold;
        }

        /* Form Styling */
        .form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
        }

        /* Input Styling */
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        button {
            width: 100%;
            padding: 0.8rem;
            background-color: #b22222; /* Red button */
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 1.1rem;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #8b0000; /* Darker red on hover */
        }

        /* Error Message Styling */
        .error-message {
            color: #d9534f; /* Error message color */
            font-size: 0.9rem;
            margin-bottom: 0.3rem;
        }

        /* Login Link Styling */
        .login-link {
            margin-top: 1rem;
            text-align: center;
            font-size: 0.9rem;
            color: #b22222; /* Dark red for links */
        }

        .login-link a {
            color: #b22222; /* Dark red for links */
            text-decoration: none;
            font-weight: 500;
        }

        .login-link a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>

        <form id="forgotPasswordForm" class="form" action="forgot" method="post">
            <%
                String email = (String) request.getAttribute("email");
                if (email != null) {
                    out.print("<p class='error-message'>" + email + "</p>");
                }
            %>
            <input type="email" name="email" id="email" placeholder="Enter your email ID" required>

            <%
                String pass = (String) request.getAttribute("pass");
                if (pass != null) {
                    out.print("<p class='error-message'>" + pass + "</p>");
                }
            %>
            <input type="password" name="pass" id="password" placeholder="Enter new password" required>

            <%
                String confirm = (String) request.getAttribute("confirm");
                if (confirm != null) {
                    out.print("<p class='error-message'>" + confirm + "</p>");
                }
            %>
            <input type="password" name="confirm" id="confirmPassword" placeholder="Confirm new password" required>

            <button type="submit">Reset Password</button>
        </form>

        <div class="login-link">
            <p>Remembered your password? <a href="login.jsp">Login</a></p>
        </div>
    </div>
</body>
</html>
