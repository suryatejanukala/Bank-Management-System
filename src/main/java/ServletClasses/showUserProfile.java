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
import BankDto.RegistrationDto;

@WebServlet("/showUserProfile")
public class showUserProfile  extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		String email="";
		Cookie cookie[]=req.getCookies();
		for(Cookie c:cookie)
		{
			if(c.getName().equals("emailId"))
			{
				email=c.getValue();
			}
		}
		try 
		{
			RegistrationDto r=new RegistrationDao().showProfile(email);
			req.setAttribute("profile", r);
			RequestDispatcher rd=req.getRequestDispatcher("showUserProfile.jsp");
			rd.include(req, resp);
		} 
		catch (SQLException e) 
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
	}
}
