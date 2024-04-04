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

@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate password
        if (!isValidPassword(password)) {
            out.println("<script type=\"text/javascript\">");
            out.println("alert('Password must be at least 8 characters long and include a special character and a number');");
            out.println("window.location.href='signup.jsp'");
            out.println("</script>");
            return;
        }

        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;
        try {
            // Load the MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");
            
            // Check if email already exists
            ps = con.prepareStatement("SELECT * FROM users WHERE email = ?");
            ps.setString(1, email);
            rs = ps.executeQuery();
            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Email already exists! Please use a different email.');");
                out.println("window.location.href='signup.jsp'");
                out.println("</script>");
                return;
            }
            
            // Check if username already exists
            ps = con.prepareStatement("SELECT * FROM users WHERE username = ?");
            ps.setString(1, username);
            rs = ps.executeQuery();
            if (rs.next()) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Username already exists! Please choose a different username.');");
                out.println("window.location.href='signup.jsp'");
                out.println("</script>");
                return;
            }
            
         // Prepare statement for registration
            ps = con.prepareStatement("INSERT INTO users (Username, Email, Password) VALUES (?, ?, ?)");
            ps.setString(1, username);
            ps.setString(2, email);
            ps.setString(3, password);

            
            // Execute registration query
            int i = ps.executeUpdate();
            if (i > 0) {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Registration successful!');");
                out.println("window.location.href='login.jsp'");
                out.println("</script>");
            } else {
                out.println("<script type=\"text/javascript\">");
                out.println("alert('Error in registration!');");
                out.println("window.location.href='signup.jsp'");
                out.println("</script>");
            }
        } catch (Exception e) {
            out.println(e);
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (ps != null) ps.close();
                if (con != null) con.close();
            } catch (Exception e) {
                out.println(e);
            }
        }

        out.close();
    }

    // Password validation method
    private boolean isValidPassword(String password) {
        // Password must be at least 8 characters long and include a special character and a number
        String regex = "^(?=.*[0-9])(?=.*[!@#$%^&*+=])(?=\\S+$).{8,}$";
        return password.matches(regex);
    }
}

