package BankDto;

public class BankAccountDto {
	private String fullName,pin,conformPin,address,acntType,branch,email,ifsc,dob,panNo;
	private long aadharNo,phno;
	
	public BankAccountDto(String fullName, String pin, String address, String acntType,
			String branch, long aadharNo, String panNo,String email,long phno,String dob) {
		this.fullName = fullName;
		this.pin = pin;
		this.address = address;
		this.acntType = acntType;
		this.branch = branch;
		this.aadharNo = aadharNo;
		this.panNo = panNo;
		this.email=email;
		this.phno=phno;
		this.dob=dob;
	}
	
	public String getIfsc() {
		return ifsc;
	}

	public void setIfsc(String ifsc) {
		this.ifsc = ifsc;
	}

	public String getDob() {
		return dob;
	}

	public void setDob(String dob) {
		this.dob = dob;
	}

	public long getPhno() {
		return phno;
	}

	public void setPhno(long phno) {
		this.phno = phno;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public BankAccountDto() {
		super();
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getConformPin() {
		return conformPin;
	}

	public void setConformPin(String conformPin) {
		this.conformPin = conformPin;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getAcntType() {
		return acntType;
	}

	public void setAcntType(String acntType) {
		this.acntType = acntType;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public long getAadharNo() {
		return aadharNo;
	}

	public void setAadharNo(long aadharNo) {
		this.aadharNo = aadharNo;
	}

	

	public String getPanNo() {
		return panNo;
	}

	public void setPanNo(String panNo) {
		this.panNo = panNo;
	}

	@Override
	public String toString() {
		return "BankAccountDto [fullName=" + fullName + ", pin=" + pin + ", conformPin=" + conformPin + ", address="
				+ address + ", acntType=" + acntType + ", branch=" + branch + ", aadharNo=" + aadharNo + ", panNo="
				+ panNo + ", emailId="+email+", phoneNumber="+phno+"]";
	}
	
	
}