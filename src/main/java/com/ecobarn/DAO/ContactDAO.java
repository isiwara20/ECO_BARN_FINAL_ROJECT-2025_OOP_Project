package com.ecobarn.DAO;

import java.util.List;
import com.ecobarn.model.ContactTicket;

public interface ContactDAO {
    boolean insertTicket(ContactTicket ticket);
    boolean updateTicketStatus(String ticketID, String status);
    boolean deleteTicket(String ticketID);
    List<ContactTicket> getTicketsByUsername(String username);
}
