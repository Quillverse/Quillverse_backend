package Servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");
             PreparedStatement ps = con.prepareStatement("SELECT UserID, username FROM users WHERE email = ? AND password = ?");
        ) {
            ps.setString(1, email);
            ps.setString(2, password);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("email", email);
                    session.setAttribute("username", rs.getString("username"));
                    session.setAttribute("userID", rs.getInt("UserID")); // Store UserID in session
                    response.sendRedirect("homepage.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=1");
                }
            }
        } catch (Exception e) {
            // Log the exception for debugging
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=2");
        }
    }
}

