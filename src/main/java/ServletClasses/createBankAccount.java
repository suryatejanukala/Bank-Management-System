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
import BankDto.BankAccountDto;

@WebServlet("/createAccountForm")
public class createBankAccount extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String fullName = req.getParameter("fullName");
        String pin = req.getParameter("pin");
        String confirmPin = req.getParameter("confirmPin");
        String address = req.getParameter("address");
        String accountType = req.getParameter("accountType");
        String branch = req.getParameter("branch");
        String email=req.getParameter("mail");
        long aadharNo = Long.parseLong(req.getParameter("aadhaar"));
        String panNo = (req.getParameter("pan"));
//      String ifsc=req.getParameter("ifsc");
        String dob=req.getParameter("dob");
        long phno=Long.parseLong(req.getParameter("phno"));
       System.out.println("BankAccountDto [fullName=" + fullName + ", pin=" + pin + ", conformPin=" + confirmPin + ", address="
				+ address + ", acntType=" + accountType + ", branch=" + branch + ", aadharNo=" + aadharNo + ", panNo="
				+ panNo + ", emailId="+email+", phoneNumber="+phno+"]");
        try 
        {
        	if(accountType.equalsIgnoreCase("Current Account") && new BankAccountDao().checkCurrentAccount(email))
        	{
        		System.out.println("Here user already had the current account we can't create it...");
    			req.setAttribute("accountType", "on this email id you already had the current account...");
    			RequestDispatcher rd=req.getRequestDispatcher("createAccount.jsp");
    			rd.include(req, resp);
        	}
        	else if(accountType.equalsIgnoreCase("Savings Account") && new BankAccountDao().checkSavingsAccount(email))
        	{
        		System.out.println("Here user already had the savings account we can't create it....");
        		req.setAttribute("accountType", "on this email id you already had the savings account...");
    			RequestDispatcher rd=req.getRequestDispatcher("createAccount.jsp");
    			rd.include(req, resp);
        	}
        	else 
        	{
		            if (pin.equals(confirmPin))
		            {
		            	if(validatePanCard(panNo))
		            	{
			                BankAccountDto bankAccount = new BankAccountDto(fullName, pin, address, accountType, branch, aadharNo, panNo, email, phno, dob);
			                long acNo=new BankAccountDao().saveAccountUser(bankAccount);
			                req.setAttribute("message", "Account Created Successfully,\nThe Generated Account number is :"+acNo);
			                RequestDispatcher rd = req.getRequestDispatcher("createAccount.jsp");
			                rd.include(req, resp);
		            	}
		            	else
		            	{
		            		req.setAttribute("pan", "Pan number is must be like must be ABCDE1234F");
			                RequestDispatcher rd = req.getRequestDispatcher("createAccount.jsp");
			                rd.include(req, resp);
		            	}
		            } 
		            else 
		            {
		                req.setAttribute("error", "PIN mismatch or invalid PIN.");
		                RequestDispatcher rd = req.getRequestDispatcher("createAccount.jsp");
		                rd.include(req, resp);
		            }
        		}
        		
        } catch (SQLException e) {
            req.setAttribute("error", "Database error occurred.");
            RequestDispatcher rd = req.getRequestDispatcher("createAccount.jsp");
            rd.include(req, resp);
            e.printStackTrace();
        } catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
    public boolean validatePanCard(String pan)
    {
    	pan=pan.toUpperCase();
    	if (pan.length() != 10) 
    	{
            return false;
        }

        for (int i = 0; i < 5; i++) {
            if (!Character.isUpperCase(pan.charAt(i))) {
                return false;
            }
        }
        
        for (int i = 5; i < 9; i++) {
            if (!Character.isDigit(pan.charAt(i))) {
                return false;
            }
        }
        
        if (!Character.isUpperCase(pan.charAt(9))) {
            return false;
        }

        return true;
    }
}