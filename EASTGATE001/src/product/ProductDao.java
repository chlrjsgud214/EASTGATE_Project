package product;

import java.sql.*;
import java.util.ArrayList;
import javax.naming.*;
import javax.sql.*;

public class ProductDao {
	private static ProductDao instance = new ProductDao();

	public static ProductDao getInstance() {
		if (instance == null) {
			instance = new ProductDao();
		}
		return instance;
	}

	private ProductDao() {
	}

	// DataBase Connection Pool
	private Connection getConnection() throws Exception {
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource) ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		} catch (Exception e) {
			System.out.println("연결에러 : " + e.getMessage());
		}
		return conn;
	}

	// 제품 등록
	public int insert(Product pd, String mid) throws Exception {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_scode = null;
		ResultSet rs_scode = null;
		String scode = "";
		String sql_scode_get = "select scode from member where mid=?";

		String sql_pd_insert = "insert into product values(?,?,?,?,?,?,?)";
		// 제품 번호 , 판매자 번호, 제품 이름, 가격, 재고수량, 썸네일 이미지, 제품설명

		try {
			String pcode = "AA20210109001";// 제품 번호 카테고리 00~FF + DATE + pds_Seq

			pstmt_scode = conn.prepareStatement(sql_scode_get);
			pstmt_scode.setString(1, mid);
			rs_scode = pstmt_scode.executeQuery();
			scode = rs_scode.getString("scode");

			pstmt = conn.prepareStatement(sql_pd_insert);
			pstmt.setString(1, pcode); // 제품 번호
			pstmt.setString(2, scode); // 판매자 번호
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
	public ArrayList<Product> getProduct(String pcode){
			
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


