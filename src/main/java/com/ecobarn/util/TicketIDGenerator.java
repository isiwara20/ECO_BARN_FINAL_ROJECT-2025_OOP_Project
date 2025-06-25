package com.ecobarn.util;

import java.util.UUID;

public class TicketIDGenerator {
    public static String generateID() {
        return "TICKET-" + UUID.randomUUID().toString().substring(0, 8).toUpperCase();
    }
}
