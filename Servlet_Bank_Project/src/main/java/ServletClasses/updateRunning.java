package ServletClasses;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.BankAccountDao;

@WebServlet("/updateRunning")
public class updateRunning extends HttpServlet {
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        try {
            String name = req.getParameter("fname");
           // String phnoStr = req.getParameter("phno");
            String address = req.getParameter("add");
            String dob = req.getParameter("dob");
           // String aadhaarStr = req.getParameter("aadh");
            String pan = req.getParameter("pan");

//            if (phnoStr == null || phnoStr.isEmpty() || aadhaarStr == null || aadhaarStr.isEmpty()) {
//                req.setAttribute("InvalidData", "Phone number and Aadhaar are required fields.");
//                RequestDispatcher rd = req.getRequestDispatcher("updateAccount.jsp");
//                rd.forward(req, resp);
//                return;
//            }

//            long phno = Long.parseLong(phnoStr);
//            long aadhaar = Long.parseLong(aadhaarStr);

            String email = "";
            Cookie[] cookies = req.getCookies();
            for (Cookie c : cookies) {
                if (c.getName().equals("emailId")) {
                    email = c.getValue();
                    break;
                }
            }

            // Check if the PAN format is valid
            if (new createBankAccount().validatePanCard(pan)) {
                // Update account details in the database
                new BankAccountDao().updateForm(name,  address, dob, pan, email);
                req.setAttribute("successMessage", "Account updated successfully! Please log in again to see changes.");
                RequestDispatcher rd = req.getRequestDispatcher("updateAccount.jsp");
                rd.forward(req, resp);
            } else {
                req.setAttribute("InvalidPan", "Please Enter in this format ABCDE1234F");
                RequestDispatcher rd = req.getRequestDispatcher("updateAccount.jsp");
                rd.forward(req, resp);
            }
        } catch (NumberFormatException e) {
            req.setAttribute("InvalidData", "Invalid input for number fields.");
            RequestDispatcher rd = req.getRequestDispatcher("updateAccount.jsp");
            rd.forward(req, resp);
        } catch (SQLException e) {
            req.setAttribute("errorMessage", "An error occurred while updating. Please try again later.");
            e.printStackTrace();
            RequestDispatcher rd = req.getRequestDispatcher("updateAccount.jsp");
            rd.forward(req, resp);
        }
    }
}



