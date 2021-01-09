package product;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import javax.naming.*;
import javax.sql.DataSource;


import product.Product;

public class ProductDao {
	private static ProductDao instance=new ProductDao();
	private ProductDao() {}
	public static ProductDao getInstance() {
		return instance;
	}
	// DataBase Connection Pool
	private Connection getConnection() { 
		Connection conn = null;
		try {
			Context ctx = new InitialContext();
			DataSource ds = (DataSource)
				ctx.lookup("java:comp/env/jdbc/OracleDB");
			conn = ds.getConnection();
		}catch (Exception e) {
			System.out.println("연결에러 : "+e.getMessage());
		}
		return conn;
	}
	public int insert(Product pd, String mid) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		PreparedStatement pstmt_scode=null;
		ResultSet rs_scode=null;
		String scode = "";		
		String sql_scode_get = "select scode from member where mid=?";		
		
		String sql_pd_insert =
			"insert into product values(?,?,?,?,?,?,?)";
			// 제품 번호 , 판매자 번호, 제품 이름, 가격, 재고수량, 썸네일 이미지, 제품설명
			
		try {
			String pcode ="AA20210109001";// 제품 번호 카테고리 00~FF + DATE + pds_Seq
			
			pstmt_scode = conn.prepareStatement(sql_scode_get);		
			pstmt_scode.setString(1,mid);
			rs_scode = pstmt_scode.executeQuery();
			scode=rs_scode.getString("scode");
			
			pstmt = conn.prepareStatement(sql_pd_insert);
			pstmt.setString(1, pcode); 			// 제품 번호
			pstmt.setString(2, scode); 			// 판매자 번호
			pstmt.setString(3, pd.getPname());	// 제품이름
			pstmt.setInt(4, pd.getPrice());    	// 가격
			pstmt.setInt(5, pd.getPcount());  	// 재고수량
			pstmt.setString(6, pd.getPimage());	// 썸네일
			pstmt.setString(7, pd.getPcon());	// 제품설명
			result = pstmt.executeUpdate();
		}catch (Exception e) {
			System.out.println(e.getMessage());
		}finally {
			try {
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			}catch (Exception e) {	}
		}
		return result;
	}
	
	
	public List<Product> list() {
		List<Product> list = new ArrayList<Product>();
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql =
			"select * from product order by scode desc"; // 판매자 기준으로 정렬
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product pd = new Product();
				pd.setId(rs.getInt("scode"));
				pd.setFileName(rs.getString("fileName")); // 수정 진행중
				pd.setFileSize(rs.getInt("fileSize"));
				pd.setDescription(rs.getString("description"));
				list.add(pd);
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
}
