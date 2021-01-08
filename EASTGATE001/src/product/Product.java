package product;

public class Product {
	private String pname; // 판매자 이름
	private int price;    // 가격
	private int pcount;   // 재고 수량
	private String pimage;// 썸네일 이미지
	private String pcon;  // 제품 설명
	
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
