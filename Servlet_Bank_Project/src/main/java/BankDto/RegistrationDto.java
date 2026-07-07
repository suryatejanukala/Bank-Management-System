package BankDto;

public class RegistrationDto 
{
	private String fname,email,pass;

	public String getFname() {
		return fname;
	}

	public RegistrationDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RegistrationDto(String fname, String email, String pass) {
		this.fname = fname;
		this.email = email;
		this.pass = pass;
	
	}

	@Override
	public String toString() {
		return "RegistrationDto [fname=" + fname + ", email=" + email + ", pass=" + pass +  "]";
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPass() {
		return pass;
	}

	public void setPass(String pass) {
		this.pass = pass;
	}

	
}
