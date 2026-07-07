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
import BankDto.BankAccountDto;

@WebServlet("/updateAccount")
public class updateAccount extends HttpServlet 
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        // Retrieve email from cookies
        String email = null;
        Cookie[] cookies = request.getCookies();
        if (cookies != null)
        {
            for (Cookie cookie : cookies) 
            {
                if ("emailId".equals(cookie.getName())) 
                {
                    email = cookie.getValue();
                    break;
                }
            }
        }
        try 
        {
			BankAccountDto b=new BankAccountDao().getCurrentAccountProfile(email);
			request.setAttribute("email", email);
			System.out.println(email);
			System.out.println(b);
			request.setAttribute("object", b);
			RequestDispatcher rd=request.getRequestDispatcher("updateAccount.jsp");
			rd.include(request, response);
        } catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
    }
}
