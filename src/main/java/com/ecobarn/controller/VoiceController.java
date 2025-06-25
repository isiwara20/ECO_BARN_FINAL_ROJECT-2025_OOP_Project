package com.ecobarn.controller;

import com.ecobarn.model.VoiceCommandProcessor;
import javax.servlet.*;                // ✅ FIXED
import javax.servlet.http.*;          // ✅ FIXED
import java.io.IOException;

public class VoiceController extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String command = request.getParameter("command");
        String result = VoiceCommandProcessor.processCommand(command);
        response.setContentType("text/plain");
        response.getWriter().write(result);
    }
}
