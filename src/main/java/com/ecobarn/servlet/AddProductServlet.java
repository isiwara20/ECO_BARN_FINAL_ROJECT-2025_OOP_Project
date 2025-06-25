package com.ecobarn.servlet;

import com.ecobarn.DAO.AddProductDAO;
import com.ecobarn.Factory.AddProductDAOFactory;
import com.ecobarn.model.Product;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;

//@WebServlet("/AddProductServlet")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2,  // 2MB
maxFileSize = 1024 * 1024 * 10,       // 10MB
maxRequestSize = 1024 * 1024 * 50)    // 50MB
public class AddProductServlet extends HttpServlet {

    private static final String UPLOAD_DIR = "img"; // relative to project or webapp root

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Read form data
        String productName = request.getParameter("productName");
        String productType = request.getParameter("productType");
        String priceStr = request.getParameter("price");
        String quantityStr = request.getParameter("quantity");
        String description = request.getParameter("description");

        /**
         *  External References for Image Uploading in Java (Servlet-based Web Apps):
         *
         * 1. **Jakarta Servlet `Part` Interface (File Upload Handling)**:
         *    - Official API documentation for handling file uploads via `multipart/form-data`.
         *    - URL: https://jakarta.ee/specifications/servlet/5.0/apidocs/jakarta/servlet/http/Part
         *
         * 2. **File Upload with Servlets - Baeldung Guide**:
         *    - Step-by-step explanation for configuring and handling file uploads using Java Servlets.
         *    - URL: https://www.baeldung.com/servlets-file-upload
         *
         * 3. **Java NIO Files Utility (`Files.copy`)**:
         *    - Standard approach for saving uploaded file streams to disk using the Java NIO API.
         *    - URL: https://docs.oracle.com/javase/8/docs/api/java/nio/file/Files.html#copy-java.io.InputStream-java.nio.file.Path-java.nio.file.CopyOption...-
         *
         * 4. **Creating Upload Directory Dynamically (`mkdirs()`)**:
         *    - Java’s `File.mkdirs()` documentation for ensuring that upload directories exist before writing.
         *    - URL: https://docs.oracle.com/javase/8/docs/api/java/io/File.html#mkdirs--
         *
         * 5. **Multipart File Upload in JSP/Servlet (JournalDev Tutorial)**:
         *    - Practical example demonstrating file upload via HTML form + Java Servlet + directory saving.
         *    - URL: https://www.journaldev.com/21098/java-servlet-file-upload-example
         *
         * These references help ensure secure, correct, and scalable handling of file uploads in Java web applications.
         */
        
        
        Part filePart = request.getPart("productImage");

        String uploadPath = getServletContext().getRealPath("/") + "img"; 

        File uploadDir = new File(uploadPath);
        if (!uploadDir.exists()) {
            uploadDir.mkdirs(); // Ensure directory is created if not already present
        }
        // Validate numeric inputs
        double price = Double.parseDouble(priceStr);
        int quantity = Integer.parseInt(quantityStr);

        // Save image to disk (e.g., /webapp/uploaded_images)
      
        String fileName = filePart.getSubmittedFileName();
        if (fileName != null && !fileName.isEmpty()) {
            // Save the image in the "userprofiles" folder
            File file = new File(uploadPath + File.separator + fileName);
            Files.copy(filePart.getInputStream(), file.toPath(), StandardCopyOption.REPLACE_EXISTING);

        
            String imagePath = "img/" + fileName;

        
        

        int id = 0;
      
        Product product = new Product(id,productName, price,imagePath,productType, description, quantity );

        try {
            // Use Factory to get correct DAO
            AddProductDAO productadding = AddProductDAOFactory.getProductDAO(productType);
            productadding.inserProduct(product);

            request.setAttribute("productmessage", "Product added successfully!");
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("productmessage", "Failed to add product: " + e.getMessage());
        }

        request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);
        
        
        }else
        {
            request.setAttribute("productmessage", "Failed to add image");
            request.getRequestDispatcher("AdminDashboardStaticsServlet").forward(request, response);

        }
    }
        
    

    // Helper method to extract file name
    private String getFileName(Part part) {
        String header = part.getHeader("content-disposition");
        for (String content : header.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf("=") + 2, content.length() - 1);
            }
        }
        return "unknown.png";
    }
}
