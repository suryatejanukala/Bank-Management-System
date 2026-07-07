package ServletClasses;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.BankAccountDao;

@WebServlet("/changePin")
public class changePin extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String email = req.getParameter("email");
        String newPinStr = req.getParameter("newPin");
        int newPin = Integer.parseInt(newPinStr); // Convert newPin to int

        try {
            BankAccountDao bankAccountDao = new BankAccountDao();
            if (bankAccountDao.checkCurrentAccount(email) || bankAccountDao.checkSavingsAccount(email)) {
                // Update the PIN logic
                boolean updateSuccess = bankAccountDao.updatePin(email, newPin); // This should be implemented in your DAO
                if (updateSuccess) {
                    req.setAttribute("success", "The PIN change was successful.");
                } else {
                    req.setAttribute("error", "Failed to update the PIN.");
                }
            } else {
                req.setAttribute("email", "Invalid Email Id");
            }
            RequestDispatcher rd = req.getRequestDispatcher("changepin.jsp");
            rd.include(req, resp);
        } catch (SQLException e) {
            e.printStackTrace();
            req.setAttribute("error", "An error occurred while changing the PIN.");
            RequestDispatcher rd = req.getRequestDispatcher("changepin.jsp");
            rd.include(req, resp);
        }
    }
}
