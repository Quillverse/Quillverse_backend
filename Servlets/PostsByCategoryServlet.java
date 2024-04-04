package Servlets;

import java.io.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.*;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/PostsByCategoryServlet")
public class PostsByCategoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        PrintWriter out = response.getWriter();
        String category = request.getParameter("category");
        
        // JDBC connection parameters
        String url = "jdbc:mysql://localhost:3306/blog_db";
        String username = "root";
        String password = "Shahil";
        
        List<String> titles = new ArrayList<>();
        List<String> contents = new ArrayList<>();
        List<String> usernames = new ArrayList<>(); // List to store usernames
        
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection con = DriverManager.getConnection(url, username, password);
            PreparedStatement pst = con.prepareStatement("SELECT Posts.Title, Posts.Content, Users.Username FROM Posts INNER JOIN Users ON Posts.UserID = Users.UserID WHERE Posts.category = ?");
            pst.setString(1, category);
            ResultSet rs = pst.executeQuery();
            
            while (rs.next()) {
                String title = rs.getString("Title");
                String content = rs.getString("Content");
                String username1 = rs.getString("Username");
                titles.add(title);
                contents.add(content);
                usernames.add(username1); // Add username to the list
            }
            
            con.close();
        } catch (ClassNotFoundException | SQLException e) {
            out.println("Exception: " + e.getMessage());
        }
        
        // Set the data as request attributes
        request.setAttribute("category", category);
        request.setAttribute("titles", titles);
        request.setAttribute("contents", contents);
        request.setAttribute("usernames", usernames); // Corrected attribute name
        
        // Forward the request to the Category.jsp page
        RequestDispatcher rd = request.getRequestDispatcher("Category.jsp");
        rd.forward(request, response);
    }
}
