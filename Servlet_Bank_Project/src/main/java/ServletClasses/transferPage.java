package ServletClasses;

import java.io.IOException;
import java.sql.SQLException;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import BankDao.BankAccountDao;
import BankDao.RegistrationDao;
import BankDao.TransactionDao;
import BankDto.BankAccountDto;
import BankDto.TransactionDto;

@WebServlet("/transferMoney")
public class transferPage extends HttpServlet
{
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException 
	{
		long accountHolder=Long.parseLong(req.getParameter("yourAccount"));
		long reciptentAccount=Long.parseLong(req.getParameter("transferAccount"));
		String ifscCode=req.getParameter("ifscCode");
		int amount=Integer.parseInt(req.getParameter("amount"));
		int pin=Integer.parseInt(req.getParameter("pin"));
		String email="";
		Cookie cookie[]=req.getCookies();
		for(Cookie c:cookie)
		{
			if(c.getName().equals("emailId"))
				email=c.getValue();
		}
		if(accountHolder!=reciptentAccount)
		{
			try {
				if(new BankAccountDao().validateAccount(accountHolder))
				{
					if(new BankAccountDao().validateAccount(reciptentAccount))
					{
						if(new BankAccountDao().validatePin(pin, accountHolder))
						{
							if(new BankAccountDao().validateAmount(amount, accountHolder))
							{
								if(new BankAccountDao().validateIfsc(ifscCode, reciptentAccount))
								{
									new BankAccountDao().creditAmount(amount, reciptentAccount);
									new BankAccountDao().debitAmount(amount, accountHolder);
									new TransactionDao().insertIntoTable(new TransactionDto("Debited",todayTime(),todayDate(),accountHolder,reciptentAccount,amount,email),reciptentAccount);
									System.out.println("Here the Transaction was successcull");
									req.setAttribute("done", "Transaction is successfull.\nAmount is successfully transfered.");
									RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
									rd.include(req, resp);
								}
								else
								{
									System.out.println("Here the Ifsc code invalid");
									req.setAttribute("ifsc", "Invalid user ifsc code");
									RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
									rd.include(req, resp);
								}
							}
							else
							{
								System.out.println("Amount is insufficient");
								req.setAttribute("amount", "Insufficient balance");
								RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
								rd.include(req, resp);
							}
						}
						else
						{
							System.out.println("The pin was wrong");
							req.setAttribute("pin", "Incorrect pin");
							RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
							rd.include(req, resp);
						}
					}
					else
					{
						System.out.println("The reciptent's account number is invalid");
						req.setAttribute("reciptent", "Reciptent account number is invalid");
						RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
						rd.include(req, resp);
					}
				}
				else
				{
					System.out.println("Your account number is wrong");
					req.setAttribute("myAccount", "Your account number is invalid");
					RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
					rd.include(req, resp);
				}
			} catch (SQLException e) {
				System.err.println("Sql exception occured");
				System.out.println("-------------------------------------------------"+e);
				e.printStackTrace();
			}
		}
		else
		{
			System.err.println("Here there is no service like self pay but you can transfer from savings account to current account viceverse");	
			req.setAttribute("self", "No service like self paying");
			RequestDispatcher rd=req.getRequestDispatcher("transfer.jsp");
			rd.include(req,resp);
		}
	}
	public String todayDate()
	{
		Date d=new Date();
		return d.getDate()+"-"+(d.getMonth()+1)+"-"+(d.getYear()-100);
	}
	public String todayTime()
	{
		Date d=new Date();
		return d.getHours()+":"+d.getMinutes()+":"+d.getSeconds();
	}
}
