package com.ecobarn.DAO;

import java.sql.*;
import com.ecobarn.model.User;
import com.ecobarn.util.DBConnection;

public class Payment_detailsDAO {
	public static User getDetailsforPayment(String username) {
	    User user = null;
	    Connection con = null;
	    PreparedStatement stmt = null;
	    ResultSet rs = null;

	    try {
	        con = DBConnection.getConnection();
	        String sql = "SELECT username, email, fname, lname, phone FROM users WHERE username = ?";
	        stmt = con.prepareStatement(sql);
	        stmt.setString(1, username);
	        rs = stmt.executeQuery();

	        if (rs.next()) {
	            user = new User();
	            user.setUsername(rs.getString("username"));
	            user.setEmail(rs.getString("email"));
	            user.setFname(rs.getString("fname"));
	            user.setLname(rs.getString("lname"));
	            user.setPhone(rs.getString("phone"));
	        }
	    } catch (Exception e) {
	        e.printStackTrace(); // or log
	    } finally {
	        try { if (rs != null) rs.close(); } catch (SQLException ignored) {}
	        try { if (stmt != null) stmt.close(); } catch (SQLException ignored) {}
	        try { if (con != null) con.close(); } catch (SQLException ignored) {}
	    }

	    return user;
	}

}
