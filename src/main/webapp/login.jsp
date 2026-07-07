<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login Page</title>
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

        .login-container {
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

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #b22222; /* Dark red for labels */
            font-weight: 500;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border: 1px solid #ddd;
            border-radius: 6px;
            font-size: 1rem;
        }

        .options {
            display: flex;
            justify-content: space-between;
            margin-bottom: 1.2rem;
        }

        .forgot-password,
        .signup {
            color: #b22222; /* Dark red for links */
            text-decoration: none;
            font-size: 0.9rem;
        }

        .forgot-password:hover,
        .signup:hover {
            text-decoration: underline;
        }

        button.signin {
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

        button.signin:hover {
            background-color: #8b0000; /* Darker red on hover */
        }

        .error-message {
            color: #d9534f;
            font-size: 0.9rem;
            margin-bottom: 1rem;
            display: none;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
        <form id="loginForm" action="loginform" method="post">
            <label for="username">Username</label>
            <%
                String already = (String)request.getAttribute("already");
                if(already != null)
                    out.print("<p style='color:red;'>" + already + "</p>");
            %>
            <%
                String success = (String)request.getAttribute("success");
                if(success != null)
                    out.print("<p style='color:green;'>" + success + "</p>");
            %>
            <%
                String email = (String)request.getAttribute("email");
                if(email != null)
                    out.print("<p style='color:red;'>" + email + "</p>");
            %>
            <input type="text" id="username" name="username" required>

            <label for="password">Password</label>
            <%
                String pass = (String)request.getAttribute("pass");
                if(pass != null)
                    out.print("<p style='color:red;'>" + pass + "</p>");
            %>
            <input type="password" id="password" name="password" required>

            <div class="options">
                <a href="forgotPassword.jsp" class="forgot-password">Forgot Password?</a>
                <a href="Register.jsp" class="signup">Sign Up</a>
            </div>

            <button type="submit" class="signin">Sign In</button>
        </form>
    </div>
</body>
</html>
