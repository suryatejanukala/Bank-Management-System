package BankDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.mysql.cj.jdbc.Driver;

import BankDto.TransactionDto;

public class TransactionDao 
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
    public void createTransactionTable() throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	s.execute("CREATE TABLE if not exists `bankwebapp`.`transaction` (`tid` INT NOT NULL AUTO_INCREMENT,`tranType` VARCHAR(45) NULL,`tranTime` VARCHAR(45) NULL,`tranDate` VARCHAR(45) NULL,`accountNumber` BIGINT(12) NULL,`reciptentNumber` BIGINT(12) NULL,`amount` INT NULL,mail varchar(45),PRIMARY KEY (`tid`));");
    	System.out.println("Table is created successfully");
    }
    public void insertIntoTable(TransactionDto t,long accountNumber) throws SQLException
    {
    	createTransactionTable();
    	Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("insert into `bankwebapp`.`transaction` values(?,?,?,?,?,?,?,?)");
    	ps.setInt(1, t.getTid());
    	ps.setString(2, t.getTranType());
    	ps.setString(3, t.getTranTime());
    	ps.setString(4, t.getTranDate());
    	ps.setLong(5, t.getAccountNumber());
    	ps.setLong(6, t.getReciptentNumber());
    	ps.setInt(7, t.getAmount());
    	ps.setString(8, t.getEmail());
    	ps.execute();
    	System.out.println("One row is inserted");
    	PreparedStatement ps2=con.prepareStatement("insert into `bankwebapp`.`transaction` values(?,?,?,?,?,?,?,?)");
    	ps2.setInt(1, t.getTid());
    	ps2.setString(2, "Credited");
    	ps2.setString(3, t.getTranTime());
    	ps2.setString(4, t.getTranDate());
    	ps2.setLong(5, t.getReciptentNumber());
    	ps2.setLong(6, t.getAccountNumber());
    	ps2.setInt(7, t.getAmount());
    	ps2.setString(8,(receiptentEmail(accountNumber)));
    	ps2.execute();
    	System.out.println("Inserted another row");
    }
    public List<TransactionDto> transactionSet(long accountNumber) throws SQLException
    {
    	List<TransactionDto> l=new ArrayList<>();
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from `bankwebapp`.`transaction` where accountNumber="+accountNumber);
    	while(res.next())
    	{
    		TransactionDto td=new TransactionDto();
    		td.setTid(res.getInt(1));
    		td.setTranType(res.getString(2));
    		td.setTranTime(res.getString(3));
    		td.setTranDate(res.getString(4));
    		td.setReciptentNumber(res.getLong(5));
    		td.setAccountNumber(res.getLong(6));
    		td.setAmount(res.getInt(7));
    		td.setEmail(res.getString(8));
    		l.add(td);
    	}
    	return l;
    }
    public String receiptentEmail(long accountNumber) throws SQLException
    {
    	String email="";
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from `bankwebapp`.`bank_accounts` where accountNumber="+accountNumber);
    	if(res.next())
    	{
    		email=res.getString(3);
    	}
    	return email;
    }
    public boolean validateAccount(long accountNumber) throws SQLException
    {
    	Connection con=getConnection();
    	Statement s=con.createStatement();
    	ResultSet res=s.executeQuery("select * from transaction where accountNumber="+accountNumber);
    	if(res.next())
    	{
    		return true;
    	}
    	return false;
    }
	public boolean validateAccountWithEmail(long accountNumber, String email) throws SQLException {
		Connection con=getConnection();
    	PreparedStatement ps=con.prepareStatement("select * from transaction where accountNumber=? and mail=?");
    	ps.setString(2, email);
    	ps.setLong(1, accountNumber);
    	ResultSet res=ps.executeQuery();
    	if(res.next())
    	{
    		return true;
    	}
    	return false;
	}
}
