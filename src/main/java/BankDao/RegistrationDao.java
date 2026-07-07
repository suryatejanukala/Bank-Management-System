package BankDao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.annotation.WebServlet;

import com.mysql.cj.jdbc.Driver;

import BankDto.RegistrationDto;
import ServletClasses.loginPage;

public class RegistrationDao 
{
	public Connection getConnection() throws SQLException
	{
		DriverManager.registerDriver(new Driver());
		return DriverManager.getConnection("jdbc:mysql://localhost:3306/bankwebapp?createDatabaseIfNotExist=true","root","Surya@20/07/2002");
	}
	public void createRegisterTable() throws SQLException
	{
		Connection con=getConnection();
		Statement s=con.createStatement();
		s.execute("create table if not exists `user_register`(fname varchar(45),"
				+ "email varchar(45) primary key,pass varchar(45))");
		System.out.println("Table is created");
		
	}
	public void registerUser(RegistrationDto r) throws SQLException
	{
		createRegisterTable();
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("insert into user_register values(?,?,?)");
		ps.setString(1, r.getFname());
		ps.setString(2, r.getEmail().toLowerCase());
		ps.setString(3, r.getPass());
		ps.execute();
		System.out.println("Values are inserted");
	}
	public boolean checkMail(String email) throws SQLException
	{
		createRegisterTable();
		Connection con=getConnection();
		Statement s=con.createStatement();
		ResultSet res= s.executeQuery("select * from user_register where email='"+email.toLowerCase()+"'");
		System.out.println("Checking mail in db");
		if(res.next())
			return true;
		else
			return false;
	}
	public int validMail(String email,String pass) throws SQLException
	{
		Connection con=getConnection();
		Statement s=con.createStatement();
		ResultSet res= s.executeQuery("select * from user_register where email='"+email+"'");
		System.out.println("Here we are ");
		if(res.next())
		{
			if(res.getString("pass").equals(pass))
				return 1;
			else
				return 2;
		}
		else
			return 3;
	}
	public void updatePass(String pass,String email) throws SQLException
	{
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("update user_register set pass=? where email=?");
		ps.setString(1, pass);
		ps.setString(2, email);
		ps.execute();
	}
	public RegistrationDto showProfile(String email) throws SQLException
	{
		RegistrationDto rd=new RegistrationDto();
		Connection con=getConnection();
		PreparedStatement ps=con.prepareStatement("select * from user_register where email=?");
		ps.setString(1, email);
		ResultSet res=ps.executeQuery();
		if(res.next())
		{
			rd.setEmail(res.getString(2));
			rd.setFname(res.getString(1));
			rd.setPass(res.getString(3));
		}
		return rd;
	}
}
