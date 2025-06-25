package com.ecobarn.model;

import com.ecobarn.util.DBConnection;
import java.sql.*;
import java.util.*;

public class VoiceCommandProcessor {
    public static String processCommand(String command) {
        command = command.toLowerCase();

        if (command.contains("contact")) {
            return "NAVIGATE:jsp/contact.jsp";
        } else if (command.contains("order") || command.contains("track")) {
            return "NAVIGATE:jsp/trackOrder.jsp";
        } else if (command.contains("home")) {
            return "NAVIGATE:jsp/home.jsp";
        }

        String category = getCategory(command);
        int priceLimit = extractPrice(command);

        if (category != null && priceLimit > 0) {
            String table = getTableName(category);
            if (table != null) {
                List<Map<String, String>> items = fetchItemsUnderPrice(table, priceLimit);
                return generateHTML(items, category, priceLimit);
            }
        }

        return "Sorry, I didn't understand that. Try saying 'vegetables under 50'.";
    }

    private static String getCategory(String text) {
        String[] categories = {"vegetables", "fruits", "freshnuts", "leafygreen", "root"};
        for (String cat : categories) {
            if (text.contains(cat)) return cat;
        }
        return null;
    }

    private static String getTableName(String category) {
        return switch (category) {
            case "vegetables" -> "tbl_vegetablesitem";
            case "fruits" -> "tbl_fruitsitem";
            case "freshnuts" -> "tbl_nutsitem";
            case "leafygreen" -> "tbl_leafyitem";
            case "root" -> "tbl_rootsitem";
            default -> null;
        };
    }

    private static int extractPrice(String text) {
        for (String word : text.split(" ")) {
            try {
                return Integer.parseInt(word);
            } catch (NumberFormatException ignored) {}
        }
        return 0;
    }

    private static List<Map<String, String>> fetchItemsUnderPrice(String table, int priceLimit) {
        List<Map<String, String>> items = new ArrayList<>();
        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM " + table + " WHERE price < ?")) {

            ps.setInt(1, priceLimit);
            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Map<String, String> item = new HashMap<>();
                item.put("name", rs.getString("name"));
                item.put("price", rs.getString("price"));
                item.put("stock", rs.getString("stock"));
                items.add(item);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return items;
    }

    private static String generateHTML(List<Map<String, String>> items, String category, int price) {
        if (items.isEmpty()) {
            return "No " + category + " items found under Rs " + price + ".";
        }
        StringBuilder html = new StringBuilder("<h3>" + category + " under Rs " + price + ":</h3><ul>");
        for (Map<String, String> item : items) {
            html.append("<li>")
                .append(item.get("name"))
                .append(" - Rs ").append(item.get("price"))
                .append(" (").append(item.get("stock")).append(" left)")
                .append("</li>");
        }
        html.append("</ul>");
        return html.toString();
    }
}
