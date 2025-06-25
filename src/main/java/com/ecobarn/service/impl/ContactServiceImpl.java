package com.ecobarn.service.impl;

import java.util.List;

import com.ecobarn.DAO.ContactDAO;
import com.ecobarn.DAO.impl.ContactDAOImpl;
import com.ecobarn.model.ContactTicket;
import com.ecobarn.service.ContactService;

public class ContactServiceImpl implements ContactService {

    private ContactDAO contactDAO = new ContactDAOImpl();

    public boolean raiseTicket(ContactTicket ticket) {
        ticket.setStatus("Open");
        return contactDAO.insertTicket(ticket);
    }

    public boolean closeTicket(String ticketID) {
        return contactDAO.updateTicketStatus(ticketID, "Closed");
    }

    public boolean removeTicket(String ticketID) {
        return contactDAO.deleteTicket(ticketID);
    }

    public List<ContactTicket> viewMyTickets(String username) {
        return contactDAO.getTicketsByUsername(username);
    }
}
