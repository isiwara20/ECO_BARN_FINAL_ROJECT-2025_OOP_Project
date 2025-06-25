package com.ecobarn.DAO.impl;

import java.sql.*;

import java.util.*;
import com.ecobarn.model.ContactTicket;
import com.ecobarn.util.DBConnection;
import com.ecobarn.DAO.ContactDAO;

public class ContactDAOImpl implements ContactDAO {

    // Insert ticket into the database
    public boolean insertTicket(ContactTicket ticket) {
    	
    	String status = "Pending";
    			
        String query = "INSERT INTO contact (ticketID, username, name, email, phone, concern, status, respond) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ticket.getTicketID());
            ps.setString(2, ticket.getUsername());
            ps.setString(3, ticket.getName());
            ps.setString(4, ticket.getEmail());
            ps.setString(5, ticket.getPhone());
            ps.setString(6, ticket.getConcern());
            ps.setString(7, status);
            ps.setString(8, ticket.getRespond());  // Make sure 'respond' is properly set (initially empty)
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Update ticket status
    public boolean updateTicketStatus(String ticketID, String status) {
        String query = "UPDATE contact SET status=? WHERE ticketID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, status);
            ps.setString(2, ticketID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Delete a ticket
    public boolean deleteTicket(String ticketID) {
        String query = "DELETE FROM contact WHERE ticketID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ticketID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get list of tickets by username
    public List<ContactTicket> getTicketsByUsername(String username) {
        List<ContactTicket> list = new ArrayList<>();
        String query = "SELECT * FROM contact WHERE username=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                ContactTicket ct = new ContactTicket();
                ct.setTicketID(rs.getString("ticketID"));
                ct.setUsername(rs.getString("username"));
                ct.setName(rs.getString("name"));
                ct.setEmail(rs.getString("email"));
                ct.setPhone(rs.getString("phone"));
                ct.setConcern(rs.getString("concern"));
                ct.setStatus(rs.getString("status"));
                ct.setRespond(rs.getString("respond"));  // Get the 'respond' field
                list.add(ct);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
    }

    // Update ticket concern
    public boolean updateTicketConcern(String ticketID, String concern) {
        String query = "UPDATE contact SET concern=? WHERE ticketID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, concern);
            ps.setString(2, ticketID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

    // Get a ticket by its ID
    public ContactTicket getTicketByID(String ticketID) {
        String query = "SELECT * FROM contact WHERE ticketID=?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, ticketID);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                ContactTicket ct = new ContactTicket();
                ct.setTicketID(rs.getString("ticketID"));
                ct.setUsername(rs.getString("username"));
                ct.setName(rs.getString("name"));
                ct.setEmail(rs.getString("email"));
                ct.setPhone(rs.getString("phone"));
                ct.setConcern(rs.getString("concern"));
                ct.setStatus(rs.getString("status"));
                ct.setRespond(rs.getString("respond"));  // Get the 'respond' field
                return ct;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    // Respond to a ticket
    public boolean respondToTicket(String ticketID, String responseText) {
        String query = "UPDATE contact SET respond = ?, status = 'Completed' WHERE ticketID = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, responseText);
            ps.setString(2, ticketID);
            return ps.executeUpdate() > 0;
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }
}
