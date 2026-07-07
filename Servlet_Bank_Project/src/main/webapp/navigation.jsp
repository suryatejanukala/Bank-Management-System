<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>MyBank Home</title>
    <link rel="stylesheet" href="css/navigation.css">
    <style>
    /* Basic Reset */
    
* {
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

body {
    font-family: Arial, sans-serif;
    background-color: #f0f2f5;
}

/* Header Layout */
.header {
    display: flex;
    justify-content: space-between; /* Align items space between */
    align-items: center; /* Center items vertically */
    padding: 1rem;
    background-color: #007bff;
    color: white;
    position: fixed;
    width: 100%;
    top: 0;
    z-index: 1000;
}

/* Welcome Text */
.welcome-text {
    font-size: 1.8rem;
}

/* Navigation Menu */
.navbar {
    display: flex; /* Use flex to align items horizontally */
}

.navbar ul {
    list-style-type: none;
    display: flex; /* Keep the items in a row */
    align-items: center; /* Center items vertically */
    gap: 1rem; /* Space between buttons */
}

.navbar ul li {
    position: relative; /* For dropdowns */
}

.navbar ul li button {
    color: white;
    background-color: #007bff;
    border: none;
    padding: 0.5rem 1rem;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s;
    border-radius: 5px;
}

.navbar ul li button:hover {
    background-color: #0056b3;
}

/* Account Services Dropdown Menu */
.account-menu {
    position: relative;
}

.account-content {
    display: none;
    position: absolute;
    background-color: #007bff;
    min-width: 160px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    z-index: 1;
}

.account-content a {
    text-decoration: none; /* Remove underline from links */
}

.account-content button {
    color: white;
    background-color: #007bff;
    border: none;
    padding: 0.5rem 1rem;
    width: 100%;
    text-align: left;
    cursor: pointer;
    transition: background-color 0.3s;
}

.account-content button:hover {
    background-color: #0056b3;
}

.account-menu:hover .account-content {
    display: block; /* Show dropdown on hover */
}

/* Hamburger Menu */
.hamburger-menu {
    position: relative;
}

.menu-icon {
    font-size: 1.5rem;
    cursor: pointer;
    color: white;
    background: none;
    border: none;
}

.hamburger-content {
    display: none;
    position: absolute;
    right: 0;
    background-color: #007bff;
    min-width: 120px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    border-radius: 5px;
}

.hamburger-content button {
    color: white;
    background-color: #007bff;
    border: none;
    padding: 0.5rem 1rem;
    width: 100%;
    text-align: left;
    cursor: pointer;
    transition: background-color 0.3s;
}

.hamburger-content button:hover {
    background-color: #0056b3;
}

/* Show hamburger menu on hover */
.hamburger-menu:hover .hamburger-content {
    display: block;
}

/* Main Content Area */
.main-container {
    margin-top: 80px; /* Offset for fixed header */
}

.content {
    padding: 2rem;
}

.modal {
            display: none; /* Hidden by default */
            position: fixed;
            top: 0;
            left: 0;
            right: 0;
            bottom: 0;
            background: rgba(0, 0, 0, 0.5);
            justify-content: center;
            align-items: center;
            z-index: 1000; /* Above other elements */
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
        /* Navigation Menu */
.navbar ul li button {
    color: white;
    background-color: #007bff; /* Default button color */
    border: none;
    padding: 0.5rem 1rem;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s, transform 0.2s; /* Add transform transition */
    border-radius: 5px;
}

/* Hover and Active States for Navigation Buttons */
.navbar ul li button:hover {
    background-color: #0056b3; /* Darker shade on hover */
    transform: scale(1.05); /* Slightly enlarge button on hover */
}

/* Dropdown Menu Styles */
.account-content {
    display: none;
    position: absolute;
    background-color: #007bff; /* Keep the dropdown consistent */
    min-width: 160px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    z-index: 1;
}

.account-content button {
    color: white;
    background-color: #007bff; /* Default dropdown button color */
    border: none;
    padding: 0.5rem 1rem;
    width: 100%;
    text-align: left;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s; /* Add transform transition */
}

.account-content button:hover {
    background-color: #0056b3; /* Darker shade on hover */
    transform: scale(1.05); /* Slightly enlarge dropdown button on hover */
}

/* Hamburger Menu Styles */
.hamburger-content {
    display: none;
    position: absolute;
    right: 0;
    background-color: #007bff; /* Keep the hamburger menu consistent */
    min-width: 120px;
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
    z-index: 1;
    border-radius: 5px;
}

.hamburger-content button {
    color: white;
    background-color: #007bff; /* Default hamburger menu button color */
    border: none;
    padding: 0.5rem 1rem;
    width: 100%;
    text-align: left;
    cursor: pointer;
    transition: background-color 0.3s, transform 0.2s; /* Add transform transition */
}

.hamburger-content button:hover {
    background-color: #0056b3; /* Darker shade on hover */
    transform: scale(1.05); /* Slightly enlarge hamburger button on hover */
}
        
</style> 
</head>
<body>
    <!-- Header with Welcome Text and Navigation -->
    <header class="header">
        <h1 class="welcome-text">Welcome to International Bank</h1>
        
        <!-- Navigation Menu -->
        <nav class="navbar">
            <ul>
                <li><a href="home.jsp"><button>Home</button></a></li>
                <li class="account-menu">
                    <button>Account Services</button>
                    <div class="account-content">
                        <a href="currentAccountProfile"><button>Current Account Profile</button></a>
                        <a href="savingsAccountProfile"><button>Savings Account Profile</button></a>
                        <a href="createAccount.jsp"><button>Create Account</button></a>
                        <a href="depositMoney.jsp"><button>Deposit Money</button></a>
                        <a href="showBalance.jsp"><button>View Balance</button></a>
                        <a href="updateAccount"><button>Update Account</button></a>
                        <a href="deleteAccount.jsp"><button>Delete Account</button></a>
                    </div>
                </li>
                <li><a href="transfer.jsp"><button>Transfer</button></a></li>
                <li><a href="transactions.jsp"><button>Transactions</button></a></li>
                <li class="hamburger-menu">
                    <button class="menu-icon">&#9776;</button>
                    <div class="hamburger-content">
                        <a href="showUserProfile"><button>Profile</button></a>
                        <!-- <button onclick="showLogoutConfirmation()">Update</button> -->
                        <button onclick="showLogoutConfirmation()">Logout</button> <!-- Updated button -->
                    </div>
                </li>
            </ul>
        </nav>
    </header>
    <!-- Confirmation Modal -->
    <div id="logoutModal" class="modal">
        <div class="modal-content">
            <p>Do you really want to logout?</p>
            <div class="modal-buttons">
                <button class="confirm-btn" onclick="confirmLogout()">Yes</button>
                <button class="cancel-btn" onclick="hideLogoutConfirmation()">No</button>
            </div>
        </div>
    </div>
    <script>
        function showLogoutConfirmation() {
            document.getElementById('logoutModal').style.display = 'flex';
        }

        function hideLogoutConfirmation() {
            document.getElementById('logoutModal').style.display = 'none';
        }

        function confirmLogout() {
            window.location.href = 'thankyou.jsp'; // Redirect to login page
        }
    </script>
    <script src="home.js"></script>
</body>
</html>
