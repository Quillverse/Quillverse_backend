package Servlets;

import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.nio.file.Files;
import java.nio.file.StandardCopyOption;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@WebServlet("/AddPostServlet")
@MultipartConfig
public class AddPostServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String uploadPath = "C:\\eclipse-workspace\\Quillverse_main\\src\\main\\webapp\\Items";

        // Check if upload directory exists, create if not
        File uploadDirectory = new File(uploadPath);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs();
        }

        // Get form data
        String title = request.getParameter("title");
        String content = request.getParameter("content");
        String category = request.getParameter("category");

        // Get UserID from session
        HttpSession session = request.getSession();
        int userID = -1; // Default value for userID
        if (session.getAttribute("userID") != null) {
            userID = (int) session.getAttribute("userID");
        } else {
            // Handle the case when userID is not found in session
            response.sendRedirect("login.jsp");
            return;
        }

        // Process file upload
        String image = null;
        for (Part part : request.getParts()) {
            if (part.getName().equals("image") && part.getSize() > 0) {
                String fileName = getFileName(part);
                String filePath = uploadPath + File.separator + fileName;
                // Save the file to the server
                try (InputStream input = part.getInputStream()) {
                    Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
                }
                image = "Items/" + fileName;
            }
        }

        // Insert post into database
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db?useSSL=false", "root", "Shahil");
                PreparedStatement stmt = conn.prepareStatement("INSERT INTO Posts (Title, Content, UserID, Category, ImageURL) VALUES (?, ?, ?, ?, ?)")) {
            stmt.setString(1, title);
            stmt.setString(2, content);
            stmt.setInt(3, userID);
            stmt.setString(4, category);
            stmt.setString(5, image);

            stmt.executeUpdate();
            response.sendRedirect("homepage.jsp?success=true");
        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("addpost.jsp?success=false");
        }
    }

    private String getFileName(final Part part) {
        final String partHeader = part.getHeader("content-disposition");
        for (String content : partHeader.split(";")) {
            if (content.trim().startsWith("filename")) {
                return content.substring(content.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
