package com.ecobarn.service;

import java.util.List;
import com.ecobarn.model.ContactTicket;

public interface ContactService {
    boolean raiseTicket(ContactTicket ticket);
    boolean closeTicket(String ticketID);
    boolean removeTicket(String ticketID);
    List<ContactTicket> viewMyTickets(String username);
}
