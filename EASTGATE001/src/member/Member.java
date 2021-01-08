package member;

import java.util.Date;

public class Member {
	private String mcode;
	private String scode;
	private String mid;    
	private String mpass;
	private String mname; 
	private String resinum; 
	private String tel;  
	private String addr; 
	private Date join;   
	private String mdel;
	
	public String getMcode() {
		return mcode;
	}
	public void setMcode(String mcode) {
		this.mcode = mcode;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getMid() {
		return mid;
	}
	public void setMid(String mid) {
		this.mid = mid;
	}
	public String getMpass() {
		return mpass;
	}
	public void setMpass(String mpass) {
		this.mpass = mpass;
	}
	public String getMname() {
		return mname;
	}
	public void setMname(String mname) {
		this.mname = mname;
	}
	public String getResinum() {
		return resinum;
	}
	public void setResinum(String resinum) {
		this.resinum = resinum;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public Date getJoin() {
		return join;
	}
	public void setJoin(Date join) {
		this.join = join;
	}
	public String getMdel() {
		return mdel;
	}
	public void setMdel(String mdel) {
		this.mdel = mdel;
	}
	
}
