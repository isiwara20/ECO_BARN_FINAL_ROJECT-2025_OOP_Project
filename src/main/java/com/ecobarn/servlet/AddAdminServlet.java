package com.ecobarn.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

import com.ecobarn.model.Admin;
import com.ecobarn.util.AccountAdminUsernameGenerate;
import com.ecobarn.controller.AdminController;
//@WebServlet("/AddAdminServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
                 maxFileSize = 1024 * 1024 * 10,       // 10MB
                 maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class AddAdminServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String fname = request.getParameter("fname");
        String lname = request.getParameter("lname");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String password = request.getParameter("password");

        Part filePart = request.getPart("profile_pic_admin");

        // Get the relative path to save the image in the "img/userprofiles" folder inside webapp
        String uploadPath = getServletContext().getRealPath("/") + "img" + File.separator + "userprofiles"; 

        // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Ensure directory is created if not already present
        }

        // Process file upload if file exists
        String fileName = filePart.getSubmittedFileName();
        if (fileName != null && !fileName.isEmpty()) {
            // Save the image in the "userprofiles" folder
            File file = new File(uploadPath + File.separator + fileName);
            Files.copy(filePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            // Save relative path for the DB
            String imagePath = "img/userprofiles/" + fileName;

            // Generate username and store OTP
            String username = AccountAdminUsernameGenerate.generateUsernameAndStoreOTP(request);

            // Create the Admin object and save to the database
            Admin admin = new Admin(fname, lname, email, phone, password, username, imagePath);
            boolean isAdded = AdminController.addAdmin(admin);

            // Respond based on whether the admin was successfully added
            HttpSession session = request.getSession(false);
            if (session != null) {
                Object adminObj = session.getAttribute("adminlogindetails");

                if (adminObj != null && adminObj instanceof Admin) {
                    Admin admin1 = (Admin) adminObj;
                    // Now you can use admin.getId(), admin.getEmail(), etc.
                    if (isAdded) {
                    	
    	                request.setAttribute("adminlogindetails", admin1);

       				 request.setAttribute("admininsertmsgs", "Admin is Successfully added");

    	                request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);


                    } else {
                    	request.setAttribute("admininsertmsgs", "Admin sessions not found: Sign in and Try Again");

    	                request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
                    }
                    
                    
                    
                } 
            } else {
                // No session exists — redirect to login
                response.sendRedirect("signin.jsp");
            }
            
        } else {
    
            
        	request.setAttribute("admininsertmsgs", "Image Uploading Fail");

            request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
        }
    }
}
