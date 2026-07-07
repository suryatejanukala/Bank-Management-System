# 🏦 International Bank - Servlet Bank Project

A full-featured online banking web application built with Java Servlets, JSP, and MySQL. This project demonstrates core banking operations like account creation, fund transfers, deposits, balance inquiry, and transaction history using a clean MVC architecture.

## 📋 Features

- **User Registration & Login** – Sign up with email validation (supports Gmail, Hotmail, Outlook), secure login with cookie-based session management
- **Forgot Password** – Reset password via email verification
- **Create Bank Account** – Open Savings or Current accounts with full KYC details (Aadhaar, PAN, DOB)
- **Deposit Money** – Deposit funds into any account with PIN verification
- **Transfer Money** – Transfer between accounts with multi-step validation (account number, PIN, IFSC, balance check)
- **View Balance** – Check account balance with PIN authentication
- **Transaction History** – View all credit/debit transactions with timestamps
- **Account Profile** – View Savings and Current account details separately
- **Update Account** – Modify personal details (name, address, DOB, PAN)
- **Change PIN** – Update the 4-digit transaction PIN
- **Delete Account** – Request account deletion (redirects to branch)
- **User Profile** – View registered user information
- **Logout** – Confirmation modal with redirect

## 🛠️ Tech Stack

| Layer | Technology |
|-------|-----------|
| Backend | Java Servlets (Servlet 4.0), JSP |
| Server | Apache Tomcat 9.0 |
| Database | MySQL 8.0 |
| Java Version | Java SE 21 |
| JDBC Driver | mysql-connector-java-8.0.28 |
| Frontend | HTML5, CSS3, Vanilla JavaScript |
| IDE | Eclipse (Dynamic Web Project) |

## 📁 Project Structure

```
Servlet_Bank_Project/
├── src/main/java/
│   ├── BankDao/                        # Data Access Layer
│   │   ├── BankAccountDao.java         # Account CRUD, balance, validations
│   │   ├── RegistrationDao.java        # User registration, login, password reset
│   │   └── TransactionDao.java         # Transaction logging & retrieval
│   ├── BankDto/                        # Data Transfer Objects
│   │   ├── BankAccountDto.java         # Bank account model
│   │   ├── RegistrationDto.java        # User registration model
│   │   └── TransactionDto.java         # Transaction model
│   └── ServletClasses/                 # Controllers (Servlets)
│       ├── loginPage.java              # POST /loginform
│       ├── registerPage.java           # POST /signupForm
│       ├── forgotPassword.java         # POST /forgot
│       ├── createBankAccount.java      # POST /createAccountForm
│       ├── depositMoneyPage.java       # POST /depositMoney
│       ├── transferPage.java           # POST /transferMoney
│       ├── transactionsPage.java       # POST /viewTransactions
│       ├── showBalancePage.java        # POST /showBalance
│       ├── savingsAccountProfile.java  # GET /savingsAccountProfile
│       ├── currentAccountProfile.java  # GET /currentAccountProfile
│       ├── showUserProfile.java        # GET /showUserProfile
│       ├── updateAccount.java          # GET /updateAccount
│       ├── updateRunning.java          # POST /updateRunning
│       ├── changePin.java              # POST /changePin
│       ├── DeleteAccountPage.java      # POST /deleteAnyAccount
│       └── ShowTransactionsPage.java   # Transaction display helper
├── src/main/webapp/
│   ├── WEB-INF/web.xml                 # Web app configuration
│   ├── css/navigation.css              # Navigation bar styles
│   ├── js/register.js                  # Password strength checker
│   ├── login.jsp                       # Login page
│   ├── Register.jsp                    # Sign up page
│   ├── home.jsp                        # Dashboard with bank stats
│   ├── navigation.jsp                  # Shared nav bar (included in all pages)
│   ├── createAccount.jsp               # Account creation form
│   ├── depositMoney.jsp                # Deposit money form
│   ├── transfer.jsp                    # Fund transfer form
│   ├── showBalance.jsp                 # Balance inquiry form
│   ├── transactions.jsp                # Transaction history input
│   ├── showTransactions.jsp            # Transaction history display
│   ├── savingsAccountProfile.jsp       # Savings account details
│   ├── currentAccountProfile.jsp       # Current account details
│   ├── showUserProfile.jsp             # User profile page
│   ├── updateAccount.jsp               # Update account form
│   ├── changepin.jsp                   # Change PIN form
│   ├── deleteAccount.jsp               # Delete account page
│   ├── forgotPassword.jsp              # Forgot password form
│   ├── logout.jsp                      # Logout page
│   └── thankyou.jsp                    # Thank you / goodbye page
└── build/                              # Compiled classes
```

## 🗄️ Database Schema

**Database:** `bankwebapp` (MySQL)

### user_register
| Column | Type | Constraint |
|--------|------|-----------|
| fname | VARCHAR(45) | - |
| email | VARCHAR(45) | PRIMARY KEY |
| pass | VARCHAR(45) | - |

### bank_accounts
| Column | Type | Description |
|--------|------|-------------|
| fullName | VARCHAR(45) | Account holder name |
| accountType | VARCHAR(45) | Savings Account / Current Account |
| mail | VARCHAR(45) | Linked email |
| panCardNo | VARCHAR(45) | PAN card number |
| IFSCCode | VARCHAR(45) | Auto-assigned by branch |
| branch | VARCHAR(45) | KPHB / AMEERPET / DILSUKHNAGAR |
| phoneNo | BIGINT | Phone number |
| address | VARCHAR(200) | Residential address |
| pin | NUMERIC(4) | 4-digit transaction PIN |
| adharCardNo | BIGINT | Aadhaar number |
| dob | VARCHAR(45) | Date of birth |
| accountNumber | BIGINT | Auto-generated 12-digit number |
| wallet | NUMERIC(10) | Account balance (initial: ₹1000) |

### transaction
| Column | Type | Description |
|--------|------|-------------|
| tid | INT (AUTO_INCREMENT) | PRIMARY KEY |
| tranType | VARCHAR(45) | Debited / Credited |
| tranTime | VARCHAR(45) | Time of transaction |
| tranDate | VARCHAR(45) | Date of transaction |
| accountNumber | BIGINT | Source account |
| reciptentNumber | BIGINT | Destination account |
| amount | INT | Transfer amount |
| mail | VARCHAR(45) | Associated email |

> **Note:** All tables are auto-created on first use (`CREATE TABLE IF NOT EXISTS`).

## ⚙️ Setup & Installation

### Prerequisites
- Java JDK 21+
- Apache Tomcat 9.0
- MySQL 8.0
- Eclipse IDE (or any Java EE IDE)
- MySQL Connector/J 8.0.28

### Steps

1. **Clone the repository**
   ```bash
   git clone https://github.com/suryatejanukala/Servlet_Bank_Project.git
   ```

2. **Set up MySQL**
   - Start your MySQL server
   - Create the database (or let the app auto-create it):
     ```sql
     CREATE DATABASE IF NOT EXISTS bankwebapp;
     ```

3. **Configure database credentials**
   
   Update the connection details in all DAO files (`BankDao/` package):
   ```java
   // Update these values in RegistrationDao.java, BankAccountDao.java, TransactionDao.java
   String url = "jdbc:mysql://localhost:3306/bankwebapp";
   String user = "root";
   String password = "your_password";
   ```

4. **Add MySQL Connector JAR**
   - Download `mysql-connector-java-8.0.28.jar`
   - Add it to the project's `WEB-INF/lib` directory or build path

5. **Deploy to Tomcat**
   - Import the project into Eclipse as a Dynamic Web Project
   - Right-click project → Run As → Run on Server → Select Tomcat 9.0
   - Or export as WAR and deploy to Tomcat's `webapps/` directory

6. **Access the application**
   ```
   http://localhost:8080/Servlet_Bank_Project/login.jsp
   ```

## 🔐 Validations

- **Email:** Only accepts `@gmail.com`, `@hotmail.com`, `@outlook.com`, `@email.com`, `@pscmr.ac.in`
- **PAN Card:** Must follow format `ABCDE1234F` (5 letters + 4 digits + 1 letter)
- **PIN:** 4-digit numeric PIN with confirmation matching
- **Transfer:** Validates sender account, recipient account, PIN, IFSC code, and sufficient balance
- **Password Strength:** Real-time feedback (Weak / Average / Strong) on registration

## 🏗️ Architecture

The application follows the **MVC pattern**:
- **Model** – DTO classes (Data Transfer Objects) represent the data
- **View** – JSP pages render the UI
- **Controller** – Servlet classes handle request processing and routing

**Key Design Decisions:**
- Annotation-based servlet mapping (`@WebServlet`) – no XML servlet config needed
- Cookie-based session tracking (`emailId` cookie)
- Shared navigation via JSP include (`navigation.jsp`)
- Branch-based IFSC auto-assignment
- Random 12-digit account number with uniqueness check
- Dual transaction logging (debit entry for sender + credit entry for receiver)

## 📸 Pages Overview

| Page | Description |
|------|-------------|
| Login | Red gradient themed login with forgot password & sign up links |
| Register | Sign up with real-time password strength indicator |
| Home | Dashboard showing total savings, current, and registered accounts |
| Create Account | Full KYC form with branch and account type selection |
| Transfer | Fund transfer with multi-layer validation |
| Transactions | View transaction history by account number |
| Profile | View account and user profile details |

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -m 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Open a Pull Request

## 📄 License

This project is open source and available for educational purposes.

---

**Developed by Surya** | Java Servlets & JSP Banking Application
