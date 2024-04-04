package Servlets;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LikePostServlet")
public class LikePostServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Get the current session
        HttpSession session = request.getSession();

        // Check if the user is logged in
        Integer userId = (Integer) session.getAttribute("userID");
        if (userId == null) {
            // Redirect to login page if user is not logged in
            response.sendRedirect("login.jsp");
            return;
        }

        // Get the post ID from the request parameter
        int postId = Integer.parseInt(request.getParameter("postId"));

        // Check if the user has already liked the post
        if (!hasUserLikedPost(userId, postId)) {
            // If not, insert a new like
            insertLike(userId, postId);
        }

        // Redirect back to the homepage after liking the post
        response.sendRedirect("homepage.jsp");
    }

    // Method to check if a user has already liked a post
    private boolean hasUserLikedPost(int userId, int postId) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");
             PreparedStatement pstmt = conn.prepareStatement("SELECT 1 FROM PostLikes WHERE UserID = ? AND PostID = ? LIMIT 1")) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, postId);
            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            // Log or handle the exception
            return false;
        }
    }

    // Method to insert a new like into the database
    private void insertLike(int userId, int postId) {
        try (Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");
             PreparedStatement pstmt = conn.prepareStatement("INSERT INTO PostLikes (UserID, PostID) VALUES (?, ?)")) {
            pstmt.setInt(1, userId);
            pstmt.setInt(2, postId);
            pstmt.executeUpdate();
        } catch (SQLException e) {
            // Log or handle the exception
        }
    }
}
