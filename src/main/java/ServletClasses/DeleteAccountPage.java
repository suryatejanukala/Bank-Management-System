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

@WebServlet("/deleteAnyAccount")
public class DeleteAccountPage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
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
		String account=req.getParameter("account");
		System.out.println(account);
		if(account.equals("Current Account"))
		{
			try {
				if(new BankAccountDao().currentAccountExists(email))
				{
					System.out.println("Here the Current Account is exists");
					req.setAttribute("currentAccountDeleted", "Go to our bank for deleting your current account on this mail "+email);
					RequestDispatcher rd=req.getRequestDispatcher("deleteAccount.jsp");
					rd.include(req, resp);
				}
				else
				{
					System.out.println("First Create the current Account");
					req.setAttribute("NoCurrentAccount", "Current account doesnt exist on this mail "+email);
					RequestDispatcher rd=req.getRequestDispatcher("deleteAccount.jsp");
					rd.include(req, resp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		else if(account.equals("Savings Account"))
		{
			try {
				if(new BankAccountDao().savingsAccountExists(email))
				{
					System.out.println("Here the Savings Account is exists");
					req.setAttribute("savingsAccountDeleted", "Go to our bank for deleting the savings account on this "+email);
					RequestDispatcher rd=req.getRequestDispatcher("deleteAccount.jsp");
					rd.include(req, resp);
				}
				else
				{
					System.out.println("First Create the Savings Account");
					req.setAttribute("NoSavingsAccount", "Savings account doesnt exist on this mail "+email+" for deleting the account");
					RequestDispatcher rd=req.getRequestDispatcher("deleteAccount.jsp");
					rd.include(req, resp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
		else if(account.equals("Both"))
		{
			try {
				if(new BankAccountDao().savingsAccountExists(email) && new BankAccountDao().currentAccountExists(email))
				{
					System.out.println("Here the Both Accounts are existed");
					req.setAttribute("accountsDeleted", "Go to our bank for deleting the bank accounts on this mail "+email);
					RequestDispatcher rd=req.getRequestDispatcher("deleteAccount.jsp");
					rd.include(req, resp);
				}
				else
				{
					System.out.println("First Create the Savings Account or Current Account");
					req.setAttribute("noAccount", "You don't have both accounts to delete..");
					RequestDispatcher rd=req.getRequestDispatcher("deleteAccount.jsp");
					rd.include(req, resp);
				}
			} catch (SQLException e) {
				e.printStackTrace();
				System.out.println(e);
			}
		}
	}
}
