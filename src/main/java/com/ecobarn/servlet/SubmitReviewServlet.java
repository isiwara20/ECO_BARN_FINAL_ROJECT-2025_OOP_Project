package com.ecobarn.servlet;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.nio.file.StandardCopyOption;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

import com.ecobarn.controller.ReviewController;

//@WebServlet("/SubmitReviewServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
                 maxFileSize = 1024 * 1024 * 10,      // 10MB
                 maxRequestSize = 1024 * 1024 * 50)   // 50MB
public class SubmitReviewServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private static final String UPLOAD_DIR = "img";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String comment = request.getParameter("comment");
        int rating = Integer.parseInt(request.getParameter("rating"));

        // Upload the image
        Part filePart = request.getPart("image");

        

        String uploadPath = getServletContext().getRealPath("/") + "img" ; 
        
     // Create the directory if it doesn't exist
        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Ensure directory is created if not already present
        }


        String fileName = filePart.getSubmittedFileName();
        
        if (fileName != null && !fileName.isEmpty()) {
            // Save the image in the "userprofiles" folder
            File file = new File(uploadPath + File.separator + fileName);
            Files.copy(filePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

            // Save relative path for the DB
            String imagePath = "img/" + fileName;



        boolean success = ReviewController.insertReview(name, comment, rating, imagePath);

        if (success) {
            response.sendRedirect("myprofilereviews.jsp?success=true");
        } else {
            response.sendRedirect("myprofilereviews.jsp?success=false");
        }
        
        }
    }
}
