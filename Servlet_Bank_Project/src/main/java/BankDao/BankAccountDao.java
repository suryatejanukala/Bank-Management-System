package BankDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Random;
import java.util.stream.LongStream;

import javax.servlet.http.Cookie;

import com.mysql.cj.jdbc.Driver;

import BankDto.BankAccountDto;
import BankDto.RegistrationDto;

public class BankAccountDao 
{
    private Connection getConnection() throws SQLException 
    {
        DriverManager.registerDriver(new Driver());
        System.out.println("Here the connection is gotten");
        return DriverManager.getConnection(
            "jdbc:mysql://localhost:3306/bankwebapp?createDatabaseIfNotExist=true",
            "root", "Surya@20/07/2002"
        );
    }
    public void createAccountTable() throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	s.execute("create table if not exists `bankwebapp`.`bank_accounts`(fullName varchar(45),accountType varchar(45),mail varchar(45),panCardNo varchar(45),IFSCCode varchar(45),branch varchar(45),phoneNo bigint,address varchar(200),pin numeric(4),adharCardNo bigint,dob varchar(45),accountNumber bigint,wallet numeric(10))");
    	System.out.println("Table successfully created");
    }
    public long saveAccountUser(BankAccountDto b) throws Exception 
    {
    		createAccountTable();
        	Connection con = getConnection();
            PreparedStatement ps = con.prepareStatement("INSERT INTO bank_accounts values(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");
			    
	        	ps.setString(1, b.getFullName());
	            ps.setString(2, b.getAcntType());
	            ps.setString(3, b.getEmail());  
	            ps.setString(4, b.getPanNo());
	            if(b.getBranch().equalsIgnoreCase("KPHB"))
	            {
	            	ps.setString(5,"RMBIN0003723");
	            }
	            else if(b.getBranch().equalsIgnoreCase("AMEERPET"))
	            {
	            	ps.setString(5,"RMBIN0000518");
	            }
	            else if(b.getBranch().equalsIgnoreCase("DILSUKHNAGAR"))
	            {
	            	ps.setString(5,"RMBIN0004575");
	            }
	            ps.setString(6, b.getBranch());
	            ps.setLong(7, b.getPhno());  
	            ps.setString(8, b.getAddress());
	            ps.setString(9, b.getPin());
	            ps.setLong(10, b.getAadharNo());
	            ps.setString(11, b.getDob());
	            long acNo=checkAccountNumber(1000000000000l);
	            ps.setLong(12, acNo);
	            ps.setInt(13, 1000);
	            ps.execute();
	            System.out.println("Inserted successcully");
	            return acNo;
        
    }   
    public long checkAccountNumber(long accountNumber) throws Exception
    {
    	createAccountTable();
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select accountNumber from bank_accounts where accountNumber=?");
    	ps.setLong(1, accountNumber);
    	ResultSet res=ps.executeQuery();
    	while(res.next())
    	{
    		Random r=new Random();
        	accountNumber=r.nextLong(99999999999l, 1000000000000l);
        	checkAccountNumber(accountNumber);
    	}
    	System.out.println("Account Number is checked");
		return accountNumber;
    }
    public boolean checkSavingsAccount(String mail) throws SQLException
    {
    	createAccountTable();
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from bank_accounts where mail='"+mail+"'");
    	while(res.next())
    	{
    		if(res.getString(1).equalsIgnoreCase("savings account"));
    			return true;
    	}
    	System.out.println("Here the savings account is checked");
    	return false;
    }
    public boolean checkCurrentAccount(String email) throws SQLException {
        createAccountTable();
        Connection con = getConnection();
        Statement s = con.createStatement();
        ResultSet res = s.executeQuery("select accountType from bank_accounts where mail='" + email + "';");
        
        while (res.next()) 
        {
            if (res.getString("accountType").equalsIgnoreCase("current account")) {
                return true;  // Found an existing current account
            }
        }
        System.out.println("No current account found for this email");
        return false;  // No current account found
    }

    public boolean validateAccount(long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from bank_accounts where accountNumber="+accountNumber);
    	while(res.next())
    	{
    		return true;
    	}
    	return false;
    }
    public boolean validateAmount(int money,long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from bank_accounts where accountNumber="+accountNumber);
    	while(res.next())
    	{
    		if(res.getInt(13)<=money)
    			return false;
    	}
    	return true;
    }
    public boolean validatePin(int pin,long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from bank_accounts where accountNumber="+accountNumber);
    	while(res.next())
    	{
    		if(res.getInt(9)==pin)
    			return true;
    	}
    	return false;
    }
    public boolean validateIfsc(String ifsc,long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from bank_accounts where accountNumber="+accountNumber);
    	while(res.next())
    	{
    		if(res.getString(5).equals(ifsc))
    			return true;
    	}
		return false;
    }
    public void creditAmount(int amount,long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where accountNumber="+accountNumber);
    	ResultSet res=ps.executeQuery();
    	while(res.next())
    	{
    		int wallet=res.getInt(13);
    		PreparedStatement ps1=con.prepareStatement("update `bank_accounts` set wallet=? where accountNumber=?");
        	ps1.setInt(1, wallet+amount);
        	ps1.setLong(2, accountNumber);
        	ps1.execute();
    	}
    	System.out.println("Credit amount is upated");
    }
    public void debitAmount(int amount,long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where accountNumber="+accountNumber);
    	ResultSet res=ps.executeQuery();
    	int wallet=0;
    	while(res.next())
    	{
    		wallet=res.getInt(13);
    		PreparedStatement ps1=con.prepareStatement("update `bank_accounts` set wallet=? where accountNumber=?");
        	ps1.setInt(1, wallet-amount);
        	ps1.setLong(2, accountNumber);
        	ps1.execute();
    	}
    	System.out.println("Debit amount is upated");
    }
    public BankAccountDto getSavingsAccountProfile(String mail) throws SQLException
    {
    	BankAccountDto b=null;
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where mail=?");
    	ps.setString(1, mail);
    	ResultSet res=ps.executeQuery();
    	while(res.next())
    	{
    		System.out.println(res.getString(2));
    		if(res.getString(2).equals("Savings Account"))
    		{
    			b=new BankAccountDto();
    			b.setFullName(res.getString(1));
    			b.setAcntType(res.getString(2));
    			b.setEmail(res.getString(3));
    			b.setPanNo(res.getString(4));
    			b.setIfsc(res.getNString(5));
    			b.setBranch(res.getString(6));
    			b.setPhno(res.getLong(7));
    			b.setAddress(res.getString(8));
    			b.setDob(res.getString(11));
    			b.setAadharNo(res.getLong(10));
    		}
    	}
    	res.close();
        ps.close();
        con.close();
    	return b;
    }
    public BankAccountDto getCurrentAccountProfile(String mail) throws SQLException
    {
        BankAccountDto b1 = null; 
        Connection con = getConnection();
        PreparedStatement ps = con.prepareStatement("select * from bank_accounts where mail=?");
        ps.setString(1, mail);
        ResultSet res = ps.executeQuery();
        while (res.next()) 
        {
            if (res.getString(2).equals("Current Account"))
            { 
                b1 = new BankAccountDto();
                System.out.println(b1);
                b1.setFullName(res.getString(1)); 
                b1.setAcntType(res.getString(2));
                b1.setEmail(res.getString(3));
                b1.setPanNo(res.getString(4));
                b1.setIfsc(res.getString(5));
                b1.setBranch(res.getString(6));
                b1.setPhno(res.getLong(7)); 
                b1.setAddress(res.getString(8));
                b1.setDob(res.getString(11));
                b1.setAadharNo(res.getLong(10));
            }
        }    
        res.close();
        ps.close();
        con.close();
        return b1; 
    }
    public void depositMoney(long accountNumber,int amount) throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select wallet from bank_accounts where accountNumber="+accountNumber);
    	int wallet=0;
    	while(res.next())
    	{
    		wallet=res.getInt(1);
    	}
    	PreparedStatement ps=con.prepareStatement("update bank_accounts set wallet=? where accountNumber=?");
    	ps.setInt(1, amount+wallet);
    	ps.setLong(2, accountNumber);
    	ps.execute();
    	System.out.println("Money was successfully deposit");
    }
    public int showBalance(long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select wallet from bank_accounts where accountNumber=?");
    	ps.setLong(1, accountNumber);
    	ResultSet res=ps.executeQuery();
    	while(res.next())
    		return res.getInt(1);
		return 0;

    }
	public void updateForm(String name, long phno, String address, String dob, long aadhaar, String pan,String mail) throws SQLException {
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update `bankwebapp`.`bank_accounts` set fullName=?,address=?,adharCardNo=?,dob=?,panCardNo=? where mail=?");
		ps.setString(1,name);
		ps.setString(2, address);
		ps.setLong(3, aadhaar);
		ps.setString(4, dob);
		ps.setString(5, pan);
		ps.setString(6, mail);
		ps.execute();
	}
    public void updateForm(String name, String address, String dob, String pan,String mail) throws SQLException {
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update `bankwebapp`.`bank_accounts` set fullName=?,address=?,dob=?,panCardNo=? where mail=?");
		ps.setString(1,name);
		ps.setString(2, address);
		ps.setString(3, dob);
		ps.setString(4, pan);
		ps.setString(5, mail);
		ps.execute();
	}
    public boolean updatePin(String email,int pin) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("update `bankwebapp`.`bank_accounts` set pin=? where mail=?");
    	ps.setInt(1, pin);
    	ps.setString(2, email);
    	if(ps.executeUpdate()>0)
    		return true;
    	else
    		return false;
    }
    public boolean currentAccountExists(String email) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where mail=? & accountType=?");
    	ps.setString(1, email);
    	ps.setString(2, "Current Account");
    	ResultSet res=ps.executeQuery();
    	if(res.next())
    		return true;
    	return false;
    }
    public boolean savingsAccountExists(String email) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where mail=? & accountType=?");
    	ps.setString(1, email);
    	ps.setString(2, "Savings Account");
    	ResultSet res=ps.executeQuery();
    	if(res.next())
    		return true;
    	return false;
    }
//    public void deleteCurrrentAccount(String mail) throws SQLException
//    {
//    	Connection con=getConnection();
//    	PreparedStatement ps=con.prepareStatement("update set ");
//    }
    public long currentAccountNumber(String email) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where mail=? AND accountType=?");
    	ps.setString(1, email);
    	ps.setString(2, "Current Account");
    	ResultSet res=ps.executeQuery();
    	if(res.next())
    		return res.getLong(12);
    	return 0;
    }
    public long savingsAccountNumber(String email) throws SQLException
    {
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from bank_accounts where mail=? AND accountType=?");
    	ps.setString(1, email);
    	ps.setString(2, "Savings Account");
    	ResultSet res=ps.executeQuery();
    	if(res.next())
    		return res.getLong(12);
    	return 0;
    }
}