package ServletClasses;


import java.util.Date;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.RegistrationDao;
import BankDto.RegistrationDto;

@WebServlet("/signupForm")
public class registerPage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String fname=req.getParameter("firstName");
		String emailId=req.getParameter("email");
		String pass=req.getParameter("password");
		System.out.println("Hey Register page called");
		try 
		{
			if(validateMail(emailId))
			{
				if(new RegistrationDao().checkMail(emailId))
				{
						req.setAttribute("already", "You can directly login by this "+emailId);
						emailId=null;
						RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
						rd.forward(req,resp);
						System.out.println("Already mail is existed");
				}
				else
				{
						new RegistrationDao().registerUser(new RegistrationDto(fname, emailId, pass));
						req.setAttribute("success", "You are successfully registered...Now you can login.");
						RequestDispatcher rd=req.getRequestDispatcher("login.jsp");
						rd.forward(req, resp);
						System.out.println("Here the page is forwarded to the Login page");
				}
			}
			else
			{
				req.setAttribute("email", "Invalid Email id accepts only @gmail.com,@hotmail.com,@outlook.com");
				RequestDispatcher rd=req.getRequestDispatcher("Register.jsp");
				rd.include(req, resp);
				System.out.println("Invalid Email Id");
			}
		} 
		catch (SQLException e) 
		{
			System.out.println("This email is already existed");
			System.out.println(e);
		}
		System.out.println("Done Saving");
	}

	private static boolean validateMail(String user) {
	    user = user.toLowerCase();
	    int atIndex = user.indexOf('@');
	    int lastAtIndex = user.lastIndexOf('@');
	    int dotIndex = user.indexOf('.');
	    
	    
	    boolean validDomain = user.endsWith("@gmail.com") || 
	                          user.endsWith("@hotmail.com") || 
	                          user.endsWith("@email.com") || 
	                          user.endsWith("@pscmr.ac.in") || 
	                          user.endsWith("@outlook.com");


	    if (atIndex == -1 || lastAtIndex != atIndex || !validDomain) {
	        return false;
	    }


	    if (dotIndex == -1 || dotIndex < atIndex) {
	        return false;
	    }


	    int firstPartLength = atIndex;
	    int domainPartLength = dotIndex - atIndex - 1;
	    int lastPartLength = user.length() - dotIndex - 1;

	    if (firstPartLength > 1 && domainPartLength > 1 && lastPartLength >= 2 && lastPartLength <= 5) {
	        return true;
	    }

	    return false;
	}
}
