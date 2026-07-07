package ServletClasses;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.BankAccountDao;
import BankDao.TransactionDao;
import BankDto.TransactionDto;

@WebServlet("/viewTransactions")
public class transactionsPage extends HttpServlet
{
	@Override	
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		long accountNumber=Long.parseLong(req.getParameter("accountNumber"));
		int pin=Integer.parseInt(req.getParameter("pin"));
		String email="";
		Cookie cookie[]=req.getCookies();
		for(Cookie c:cookie)
		{
			if(c.getName().equals("emailId"))
				email=c.getValue();
		}
		try {
			if(new TransactionDao().validateAccountWithEmail(accountNumber,email))
			{
				if(new BankAccountDao().validatePin(pin, accountNumber))
				{
					List<TransactionDto> transactionList=new TransactionDao().transactionSet(accountNumber);
					req.setAttribute("transactions", transactionList);
					System.out.println(transactionList);
					RequestDispatcher rd=req.getRequestDispatcher("showTransactions.jsp");
					rd.forward(req, resp);
				}
				else
				{
					System.out.println("The pin was invalid");
					req.setAttribute("InvalidPin", "Please enter Correct pin  or click on forgot pin");
					RequestDispatcher rd=req.getRequestDispatcher("transactions.jsp");
					rd.include(req, resp);
				}
			}
			else
			{
				System.out.println("Hey the account number was invalid");
				req.setAttribute("InvalidAccountNumber", "Please provide correct account number either from savings or corrent");
				RequestDispatcher rd=req.getRequestDispatcher("transactions.jsp");
				rd.include(req, resp);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			System.out.println(e);
		}
	}
}
