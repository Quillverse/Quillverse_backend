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

@WebServlet("/AccountSettingsServlet")
@MultipartConfig(maxFileSize = 16177215) // 16 MB
public class AccountSettingsServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection settings
    private String jdbcURL = "jdbc:mysql://localhost:3306/blog_db";
    private String jdbcUsername = "root";
    private String jdbcPassword = "Shahil";

    // SQL query
    private static final String UPDATE_USER_QUERY = "UPDATE Users SET Username = ?, Email = ?, ImageURL = ? WHERE UserID = ?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String uploadPath = "C:\\eclipse-workspace\\Quillverse_main\\src\\main\\webapp\\Items";

        // Check if upload directory exists, create if not
        File uploadDirectory = new File(uploadPath);
        if (!uploadDirectory.exists()) {
            uploadDirectory.mkdirs();
        }

        // Get form data
        String username = request.getParameter("username");
        String email = request.getParameter("email");

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
        Part filePart = request.getPart("image");
        if (filePart != null && filePart.getSize() > 0) {
            String fileName = getFileName(filePart);
            String filePath = uploadPath + File.separator + fileName;
            // Save the file to the server
            try (InputStream input = filePart.getInputStream()) {
                Files.copy(input, new File(filePath).toPath(), StandardCopyOption.REPLACE_EXISTING);
                image = "Items/" + fileName;
            } catch (IOException e) {
                e.printStackTrace();
                // Handle file upload error
            }
        }

        // Update user information in the database
        updateUser(userID, username, email, image);

        // Display alert and invalidate session
        session.invalidate();
        String alertMessage = "User information updated successfully. Please  log in again to reflect the changes.";
        String script = "<script>alert('" + alertMessage + "');";
        script += "window.location.href='login.jsp';</script>";
        response.setContentType("text/html");
        response.getWriter().println(script);
    }

    private void updateUser(int userId, String username, String email, String image) {
        try (Connection connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
             PreparedStatement preparedStatement = connection.prepareStatement(UPDATE_USER_QUERY)) {
            preparedStatement.setString(1, username);
            preparedStatement.setString(2, email);
            preparedStatement.setString(3, image);
            preparedStatement.setInt(4, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle database update error
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
