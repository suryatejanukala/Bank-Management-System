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

import BankDao.RegistrationDao;

@WebServlet("/loginform")
public class loginPage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email=req.getParameter("username");
		String pass=req.getParameter("password");
		System.out.println(email+" "+pass);
		Cookie cookie=new Cookie("emailId",email);
		resp.addCookie(cookie);
		int valid=0;
		try {
			if(email!=null)
				valid = new RegistrationDao().validMail(email.toLowerCase(), pass);
			if(valid==1)
			{
				System.out.println("Here the mail was validated");
				RequestDispatcher rd=req.getRequestDispatcher("home.jsp");
				rd.forward(req, resp);
			}
			else if(valid==2)
			{
				req.setAttribute("pass", "Password is incorrect");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);
			}
			else if(valid==3)
			{
				req.setAttribute("email", "Invalid email id");
				RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
				rd.include(req, resp);	
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	
}
