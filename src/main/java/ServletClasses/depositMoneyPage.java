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

@WebServlet("/depositMoney")
public class depositMoneyPage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		Long accountNumber=Long.parseLong(req.getParameter("accountNumber"));
		int amount=Integer.parseInt(req.getParameter("amount"));
		int pin=Integer.parseInt(req.getParameter("pin"));
		try {
			if(new BankAccountDao().validateAccount(accountNumber))
			{
				if(new BankAccountDao().validatePin(pin, accountNumber))
				{
					System.out.println("Here the account Number and pin was validated adding the money into your account");
					new BankAccountDao().depositMoney( accountNumber,amount);
					System.out.println("The Money was succesfully deposited");
					req.setAttribute("deposited", "The amount was successfully deposited");
					RequestDispatcher rd=req.getRequestDispatcher("depositMoney.jsp");
					rd.include(req, resp);
				}
				else
				{
					System.out.println("Invalid Pin");
					req.setAttribute("InvalidPin", "Invalid pin if you forgot the please change pin by forgot pin option");
					RequestDispatcher rd=req.getRequestDispatcher("depositMoney.jsp");
					rd.include(req, resp);
				}
			}
			else
			{
				System.out.println("Invalid Account Number");
				req.setAttribute("InvalidAccount", "Please First Check your account Number in the profile");
				RequestDispatcher rd=req.getRequestDispatcher("depositMoney.jsp");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
}
