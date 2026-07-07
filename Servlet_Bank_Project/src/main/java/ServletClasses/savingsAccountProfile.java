package ServletClasses;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.BankAccountDao;
import BankDto.BankAccountDto;

@WebServlet("/savingsAccountProfile")
public class savingsAccountProfile extends HttpServlet
{
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		 
		Cookie[] cookie=req.getCookies();
		String email="";
		for(Cookie i:cookie)
		{
			if(i.getName().equals("emailId"))
			{
				email=i.getValue(); 
			 }
		}   
	        try {
	            BankAccountDto accountDetails = new BankAccountDao().getSavingsAccountProfile(email);
	            System.out.println("Email: " + email);
	            System.out.println("Account details found: " + (accountDetails != null));
	            req.setAttribute("accountDetails", accountDetails);
	            req.getRequestDispatcher("savingsAccountProfile.jsp").forward(req, resp);
	        } catch (Exception e) 
	        {
	            e.printStackTrace();
	            System.out.println(e);
	        }
	}
}
