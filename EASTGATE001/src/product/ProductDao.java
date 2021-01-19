package product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;
import util.StringUtils;

public class ProductDao {
	private static ProductDao instance = new ProductDao();
	// 다른 클래스에서 memberDao생성자를 사용할 수 없게 만듬
	private ProductDao() {} 
	public static ProductDao getInstance() {
		return instance;
	}
	
	private Connection getConnection() {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 getconnection : "+e.getMessage());
		}
		return conn;
	}
	
	
	// 제품 등록
		public int insert(Product pd)  {
			int result = 0;
			Connection conn = getConnection();
			PreparedStatement pstmt = null;		
			
			String sql_pd_insert = "insert into product values(?||lpad(pcode_seq.nextval,3,0)"
					+ ",?,?,?,?,?,?)";
			// 제품 번호 , 판매자 번호, 제품 이름, 가격, 재고수량, 썸네일 이미지, 제품설명

			try {

				pstmt = conn.prepareStatement(sql_pd_insert);
				pstmt.setString(1, pd.getPcode()); // 제품 번호
				pstmt.setString(2, pd.getPid()); // 판매자 번호
				pstmt.setString(3, pd.getPname()); // 제품이름				
				pstmt.setString(4, pd.getPimage()); // 썸네일
				pstmt.setInt(5, pd.getPrice()); // 가격
				pstmt.setInt(6, pd.getPcount()); // 재고수량
				pstmt.setString(7, pd.getExplain()); // 제품설명
				result = pstmt.executeUpdate();
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} 
			finally {
				try {
					if (pstmt != null)
						pstmt.close();
					if (conn != null)
						conn.close();
				} catch (Exception e) {
				}
			}
			return result;
		}

		
		// 전체등록된 책의 수를 얻어내는 메소드
		public int getProductCount() {
			Connection conn = null;
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			int x = 0;
			try {
				conn = getConnection();
				pstmt = conn.prepareStatement("select count(*) from product");
				rs = pstmt.executeQuery();
				if (rs.next()) {
					x = rs.getInt(1);
				}
			} catch (Exception e) {
				System.out.println(e.getMessage());
			} finally {
				if (rs != null)
					try {
						rs.close();
					} catch (SQLException ex) {
					}
				if (pstmt != null)
					try {
						pstmt.close();
					} catch (SQLException ex) {
					}
				if (conn != null)
					try {
						conn.close();
					} catch (SQLException ex) {
					}
			}
			return x;
		}

		public List<Product> list() {
			List<Product> list = new ArrayList<Product>();
			Connection conn = getConnection();
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql =
				"select * from product order by pid desc";
			try {
				pstmt = conn.prepareStatement(sql);			
				rs = pstmt.executeQuery();
				while (rs.next()) {
					 Product pdt= new Product();
		             pdt.setPcode(StringUtils.nvl(rs.getString("pcode"))); // 제품 번호
		             pdt.setPid(StringUtils.nvl(rs.getString("pid"))); // 판매자 번호
		             pdt.setPname(StringUtils.nvl(rs.getString("pname"))); // 제품이름
		             pdt.setPrice(rs.getInt("price")); // 가격
		             pdt.setPcount(rs.getInt("pcount")); // 재고수량
		             pdt.setPimage(StringUtils.nvl(rs.getString("image"))); // 썸네일
		             pdt.setExplain(StringUtils.nvl(rs.getString("explain"))); // 제품설명
		             list.add(pdt);
				}
			}catch (Exception e) {
				System.out.println(e.getMessage());
			}finally {
				try {
					if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn != null) conn.close();
				}catch (Exception e) {	}
			}
			return list;
		}
		// 제품 리스트 불러오기
		
		
		public ArrayList<Product> getProducts(String pcode){
		
			Connection conn = null;   
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			ArrayList<Product> productList = new ArrayList<Product>();
			String sql =
					"select * from product order by pid desc"; // 판매자 기준으로 정렬
//			String sql1="select * from product order by reg_date desc";
	        String sql2 = "select * from product where " +
	        		"pcode = ? order by scode desc";
			
	        try { conn = getConnection();           
	        if(pcode.equals("all")){
	        	 pstmt = conn.prepareStatement(sql);
	        }else{
	            pstmt = conn.prepareStatement(sql2);
	            pstmt.setString(1, pcode);
	        }
	    	rs = pstmt.executeQuery();
	    	while(rs.next()){
	             Product pdt= new Product();
	             pdt.setPcode(rs.getString("pcode")); // 제품 번호
	             pdt.setPid(rs.getString("pid")); // 판매자 번호
	             pdt.setPname(rs.getString("pname")); // 제품이름
	             pdt.setPrice(rs.getInt("price")); // 가격
	             pdt.setPimage(rs.getString("image")); // 썸네일
	             pdt.setPcount(rs.getInt("pcount")); // 재고수량	             
	             pdt.setExplain(rs.getString("explain")); // 제품설명
	                 
	             productList.add(pdt);
	    	}
	    } catch(Exception e) {System.out.println(e.getMessage());
	    } finally {
	        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
	        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
	        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
	    }
		return productList;
	}
		public Product select(String pcode) {
			Connection conn = getConnection(); 	
			Product pdt = null;
			PreparedStatement pstmt = null;		
			ResultSet rs = null;
			// 중복체크할 때는 탈퇴된 아이디를 사용 못하게 막아야 한다
			String sql = "select * from product where pcode=?";
			try {
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, pcode);
				rs = pstmt.executeQuery();
				if (rs.next()) {
					pdt= new Product();
					  pdt.setPcode(rs.getString("pcode")); // 제품 번호
			          pdt.setPid(rs.getString("pid")); // 판매자 번호
			          pdt.setPname(rs.getString("pname")); // 제품이름
			          pdt.setPrice(rs.getInt("price")); // 가격
			          pdt.setPcount(rs.getInt("pcount")); // 재고수량
			          pdt.setPimage(rs.getString("image")); // 썸네일
			          pdt.setExplain(StringUtils.nvl(rs.getString("explain"))); // 제품설명
				}
			}catch(Exception e){System.out.println(e.getMessage());
			}finally {
				try{if (rs != null) rs.close();
					if (pstmt != null) pstmt.close();
					if (conn  != null) conn.close();
				}catch (Exception e) {		}
			}
			return pdt;
		}
		public String selectPname(String pcode) {
			String pname = null;
			String sql = "select pname from product where pcode=?";
			try {
			Connection conn = getConnection(); 	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			ResultSet rs = pstmt.executeQuery();
			pname = rs.getString(pname);
			rs.close(); pstmt.close(); conn.close();
			} catch(Exception e) {
				
			}
			
			return pname;
		}
		public String selectPimage(String pcode) {
			String pimage = null;
			String sql = "select image from product where pcode=?";
			try {
			Connection conn = getConnection(); 	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			ResultSet rs = pstmt.executeQuery();
			pimage = rs.getString("image");
			rs.close(); pstmt.close(); conn.close();
			} catch(Exception e) {
				
			}
			
			return pimage;
		}
		public int selectPrice(String pcode) {
			int price = 0;
			String sql = "select price from product where pcode=?";
			try {
			Connection conn = getConnection(); 	
			PreparedStatement pstmt = conn.prepareStatement(sql);	
			ResultSet rs = pstmt.executeQuery();
			price = rs.getInt(price);
			rs.close(); pstmt.close(); conn.close();
			} catch(Exception e) {
				
			}
			
			return price;
		}
}
/*
	// 제품 등록
	public int insert(Product pd,Member mb) throws Exception {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;		

		String sql_pd_insert = "insert into product values(?||lpad(pcode_seq.nextval,3,0)"
				+ ",?,?,?,?,?,?)";
		// 제품 번호 , 판매자 번호, 제품 이름, 가격, 재고수량, 썸네일 이미지, 제품설명

		try {			
			String pid = mb.getId();

			pstmt = conn.prepareStatement(sql_pd_insert);
			pstmt.setString(1, pd.getPcode()); // 제품 번호
			pstmt.setString(2, pid); // 판매자 번호
			pstmt.setString(3, pd.getPname()); // 제품이름
			pstmt.setInt(4, pd.getPrice()); // 가격
			pstmt.setInt(5, pd.getPcount()); // 재고수량
			pstmt.setString(6, pd.getPimage()); // 썸네일
			pstmt.setString(7, pd.getPcon()); // 제품설명
			result = pstmt.executeUpdate();
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			try {
				if (pstmt != null)
					pstmt.close();
				if (conn != null)
					conn.close();
			} catch (Exception e) {
			}
		}
		return result;
	}

	// 전체등록된 책의 수를 얻어내는 메소드
	public int getProductCount() {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int x = 0;
		try {
			conn = getConnection();
			pstmt = conn.prepareStatement("select count(*) from product");
			rs = pstmt.executeQuery();
			if (rs.next()) {
				x = rs.getInt(1);
			}
		} catch (Exception e) {
			System.out.println(e.getMessage());
		} finally {
			if (rs != null)
				try {
					rs.close();
				} catch (SQLException ex) {
				}
			if (pstmt != null)
				try {
					pstmt.close();
				} catch (SQLException ex) {
				}
			if (conn != null)
				try {
					conn.close();
				} catch (SQLException ex) {
				}
		}
		return x;
	}

	// 제품 리스트 불러오기
	public ArrayList<Product> getProducts(String pcode){
			
		Connection conn = null;   
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		ArrayList<Product> productList = new ArrayList<Product>();
		String sql =
				"select * from product order by scode desc"; // 판매자 기준으로 정렬
//		String sql1="select * from product order by reg_date desc";
        String sql2 = "select * from product where " +
        		"pcode = ? order by scode desc";
		
        try { conn = getConnection();           
        if(pcode.equals("all")){
        	 pstmt = conn.prepareStatement(sql);
        }else{
            pstmt = conn.prepareStatement(sql2);
            pstmt.setString(1, pcode);
        }
    	rs = pstmt.executeQuery();
    	while(rs.next()){
             Product pdt= new Product();
             pdt.setPcode(rs.getString("pcode")); // 제품 번호
             pdt.setScode(rs.getString("scode")); // 판매자 번호
             pdt.setPname(rs.getString("pname")); // 제품이름
             pdt.setPrice(rs.getInt("price")); // 가격
             pdt.setPcount(rs.getInt("pcount")); // 재고수량
             pdt.setPimage(rs.getString("pimage")); // 썸네일
             pdt.setPcon(rs.getString("pcon")); // 제품설명
                 
             productList.add(pdt);
    	}
    } catch(Exception e) {System.out.println(e.getMessage());
    } finally {
        if (rs != null) try { rs.close(); } catch(SQLException ex) {}
        if (pstmt != null) try { pstmt.close(); } catch(SQLException ex) {}
        if (conn != null) try { conn.close(); } catch(SQLException ex) {}
    }
	return productList;
}}
*/

