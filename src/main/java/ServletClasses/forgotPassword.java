package ServletClasses;

import java.io.IOException;
import java.sql.SQLException;


import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.RegistrationDao;

@WebServlet("/forgot")
public class forgotPassword extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String email=req.getParameter("email");
		String pass=req.getParameter("pass");
		String confirm=req.getParameter("confirm");
		if(pass.equals(confirm))
		{
			try {
				if(new RegistrationDao().checkMail(email))
				{
					new RegistrationDao().updatePass(pass, email);
					System.out.println("Password Updated successfully");
					req.setAttribute("pass","Password Changed successfully" );
					RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
					rd.forward(req, resp);
				}
				else
				{
					System.out.println("Invalid Email id");
					req.setAttribute("email", "Incorrect Email id");
					RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
					rd.include(req, resp);
				}
			} catch (SQLException e) {
				System.out.println("Here the exception can be handled");
				e.printStackTrace();
			}
		}
		else
		{
			System.out.println("Password Missmatch");
			req.setAttribute("confirm", "Password Missmatch");
			RequestDispatcher rd=req.getRequestDispatcher("forgotPassword.jsp");
			rd.include(req, resp);
		}
	}
	
}
