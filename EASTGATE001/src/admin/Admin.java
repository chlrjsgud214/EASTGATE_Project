package admin;

public class Admin {
	private String acode; 
	private String aid;      
	private String pass;  
	private String ename;   
	private String tel;   
	private String adel;
	
	public String getAcode() {
		return acode;
	}
	public void setAcode(String acode) {
		this.acode = acode;
	}
	public String getAid() {
		return aid;
	}
	public void setAid(String aid) {
		this.aid = aid;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAdel() {
		return adel;
	}
	public void setAdel(String adel) {
		this.adel = adel;
	}

	@Override
	public String toString() {
		return "ID = " + aid + ", PASS = " + pass;
	}
	
}
