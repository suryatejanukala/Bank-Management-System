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

@WebServlet("/showBalance")
public class showBalancePage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		long accountNumber=Long.parseLong(req.getParameter("accountNumber"));
		int pin=Integer.parseInt(req.getParameter("pin"));
		try {
			if(new BankAccountDao().validateAccount(accountNumber))
			{
				if(new BankAccountDao().validatePin(pin, accountNumber))
				{
					System.out.println("Balance was showing");
					int balance=new BankAccountDao().showBalance(accountNumber);
					req.setAttribute("Balance", balance);
					System.out.println(balance);
					RequestDispatcher rd=req.getRequestDispatcher("showBalance.jsp");
					rd.include(req, resp);
				}
				else
				{
					System.out.println("Pin was invalid");
					req.setAttribute("InvalidPin", "Invalid Pin.If you forgot use forgot pin option");
					RequestDispatcher rd=req.getRequestDispatcher("showBalance.jsp");
					rd.include(req, resp);
				}
			}
			else
			{
				System.out.println("Account Number is invalid");
				req.setAttribute("InvalidAccountNumber", "Account Number Not Found");
				RequestDispatcher rd=req.getRequestDispatcher("showBalance.jsp");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
