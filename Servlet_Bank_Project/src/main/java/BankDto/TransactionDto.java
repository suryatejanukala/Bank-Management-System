package BankDto;

import java.util.Date;

public class TransactionDto 
{
	String tranType,tranTime,tranDate,accountType,mail;
	public String getEmail() {
		return mail;
	}
	public void setEmail(String mail) {
		this.mail = mail;
	}
	long accountNumber,reciptentNumber;
	int tid,amount;
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getTranType() {
		return tranType;
	}
	public void setTranType(String tranType) {
		this.tranType = tranType;
	}
	public String getTranTime() {
		return tranTime;
	}
	public void setTranTime(String tranTime) {
		this.tranTime = tranTime;
	}
	public String getTranDate() {
		return tranDate;
	}
	public void setTranDate(String tranDate) {
		this.tranDate = tranDate;
	}
	public String getAccountType() {
		return accountType;
	}
	public void setAccountType(String accountType) {
		this.accountType = accountType;
	}
	
	public long getAccountNumber() {
		return accountNumber;
	}
	public void setAccountNumber(long accountNumber) {
		this.accountNumber = accountNumber;
	}
	public long getReciptentNumber() {
		return reciptentNumber;
	}
	public void setReciptentNumber(long reciptentNumber) {
		this.reciptentNumber = reciptentNumber;
	}
	public int getTid() {
		return tid;
	}
	public void setTid(int tid) {
		this.tid = tid;
	}
	public TransactionDto(String tranType, String tranTime, String tranDate, long accountNumber,
			long reciptentNumber,int amount,String mail) {
		super();
		this.tranType = tranType;
		this.tranTime = tranTime;
		this.tranDate = tranDate;
		this.accountNumber = accountNumber;
		this.reciptentNumber = reciptentNumber;
		this.amount=amount;
		this.mail=mail;
	}
	@Override
	public String toString() {
		return "TransactionDto [tranType=" + tranType + ", tranTime=" + tranTime + ", tranDate=" + tranDate
				+ ", accountType=" + accountType + ", accountNumber=" + accountNumber + ", reciptentNumber="
				+ reciptentNumber + ", tid=" + tid + "]";
	}
	public TransactionDto() {
		super();
		// TODO Auto-generated constructor stub
	}
	
}
