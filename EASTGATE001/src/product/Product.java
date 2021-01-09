package product;

public class Product {
	private String pcode;  // 제품 코드
	private String scode;  // 판매자 코드
	
	private String pname;  // 판매자 이름 	writer
	private int price;     // 가격			option
	private int pcount;    // 재고 수량		product count
	private String pimage; // 썸네일 이미지 fileimg
	private String pcon;   // 제품 설명		contents
	
	public String getPcode() {
		return pcode;
	}
	public void setPcode(String pcode) {
		this.pcode = pcode;
	}
	public String getScode() {
		return scode;
	}
	public void setScode(String scode) {
		this.scode = scode;
	}
	public String getPname() { 
		return pname;
	}
	public void setPname(String pname) {
		this.pname = pname;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getPcount() {
		return pcount;
	}
	public void setPcount(int pcount) {
		this.pcount = pcount;
	}
	public String getPimage() {
		return pimage;
	}
	public void setPimage(String pimage) {
		this.pimage = pimage;
	}
	public String getPcon() {
		return pcon;
	}
	public void setPcon(String pcon) {
		this.pcon = pcon;
	} 
	
	
}
