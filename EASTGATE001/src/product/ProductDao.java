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
	public int insert(Product pd) {
		int result = 0;
		Connection conn = getConnection();
		PreparedStatement pstmt = null;
		String sql =
			"insert into product values(pds_seq.nextval,?,?,?)";
		try {
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, pd.getFileName()); // 수정 필요
			pstmt.setInt(2, pd.getFileSize());
			pstmt.setString(3, pd.getDescription());
			
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
			"select * from product order by scode desc";
		try {
			pstmt = conn.prepareStatement(sql);			
			rs = pstmt.executeQuery();
			while (rs.next()) {
				Product pd = new Product();
				pd.setId(rs.getInt("scode"));
				pd.setFileName(rs.getString("fileName")); // 수정 진행중
				pd.setFileSize(rs.getInt("fileSize"));
				pd.setDescription(rs.getString("description"));
				list.add(pi);
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
