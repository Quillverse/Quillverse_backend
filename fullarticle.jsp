<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quillverse</title>
</head>
<body>
    <header>
        <nav>
            <div class="logo-img">
                <img src="finalogo.png" height="42" width="42">
            </div>
            <ul class="nav-links">
                <li><a href="homepage.html">Home</a></li>
                <li><a href="aboutus.html">About</a></li>
<li><a href="http://localhost:8080">Chat Room</a></li>
            </ul>
            <div class="user">
                <div class="user-btn"><a href="userprofile.html"><i class="fa-solid fa-user"
                            style="color: #2D6A4F;"></i></a></div>
            </div>
        </nav>
    </header>
    <main>

        <section class="full-article">
            <div class="full-article__details">
                <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");

                    int postId = Integer.parseInt(request.getParameter("postId"));
                    String query = "SELECT p.*, u.username, u.ImageURL AS UserImageURL, p.CreatedAt FROM Posts p INNER JOIN Users u ON p.UserID = u.UserID WHERE PostID = ?";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, postId);
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                        String title = rs.getString("Title");
                        String content = rs.getString("Content");
                        String imageUrl = rs.getString("ImageURL");
                        String username = rs.getString("username");

                        // Display full article content
                %>
                        <h1 class="article__title"><%= title %></h1>
                        <div class="details__author">
                            <!-- Author Image -->
                             <img class="author__img" src="<%= rs.getString("UserImageURL") %>" alt="Author Image"> <!-- Display the user's image -->
                            <div class="author__metadata">
                                <div class="author__name">
                                   uploaded by: <b><%= username %></b><!-- Display the username -->
                               <p>Timestamp: <%= rs.getTimestamp("CreatedAt") %></p> <!-- Display the CreatedAt timestamp -->
                                </div>
                            </div>
                        </div>
                    
                        <% if (imageUrl != null) { %>
                            <div class="article__img">
                                <img src="<%= imageUrl %>" alt="Article Image">
                            </div>
                        <% } %>
                        <div class="full-article__content">
                            <div class="content-container"> <!-- Add a container around the content -->
                             <div class="boxsec"> <!-- Add a box around the content -->
                             <h3>Content</h3>
                                <%
                                    if (content != null) {
                                        // Split the content into lines
                                        String[] lines = content.split("\\r?\\n");
                            
                                        // Counter to keep track of the line number
                                        int lineCount = 0;
                            
                                        // Iterate over each line
                                        for (String line : lines) {
                                            // Output the line
                                            out.println("<p>" + line + "</p>");
                                
                                            // Increment the line count
                                            lineCount++;
                                
                                            // Insert paragraph gap after every third or fourth line
                                            if (lineCount % 3 == 0 || lineCount % 4 == 0) {
                                                out.println("<br>");
                                            }
                                        }
                                    }
                                %>
                            </div>
                        </div>
                <% } else { %>
                    <!-- Handle post not found -->
                    <h1>Post Not Found</h1>
                <% }

                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>
</div>

            </div>
        </section>
        
        
        

<div class="top-reads-title">
    <h2>More from author</h2>
</div>
<section class="slider-container">
    <div class="book-slider-content">
        <div class="book-wrapper">
            <i id="left" class="fa-solid fa-angle-left"></i>

            <!-- Fetch user ID of the author -->
            <% 
            int userId = 10; // Initialize user ID
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");

                int postId = Integer.parseInt(request.getParameter("postId"));
                String userIdQuery = "SELECT UserID FROM Posts WHERE PostID = ?";
                PreparedStatement userIdPstmt = conn.prepareStatement(userIdQuery);
                userIdPstmt.setInt(1, postId);
                ResultSet userIdRs = userIdPstmt.executeQuery();
                if (userIdRs.next()) {
                    userId = userIdRs.getInt("UserID");
                }
                userIdRs.close();
                userIdPstmt.close();

                // Query to retrieve all posts by the same user along with image URLs
                String userPostsQuery = "SELECT p.*, u.username FROM Posts p INNER JOIN Users u ON p.UserID = u.UserID WHERE p.UserID = ?";
                PreparedStatement userPostsPstmt = conn.prepareStatement(userPostsQuery);
                userPostsPstmt.setInt(1, userId);
                ResultSet userPostsRs = userPostsPstmt.executeQuery();

                // Iterate over the result set and display posts by the same user
                while (userPostsRs.next()) {
                    String title = userPostsRs.getString("Title");
                    String content = userPostsRs.getString("Content");
                    String imageUrl = userPostsRs.getString("ImageURL");
                    int postId2 = userPostsRs.getInt("PostID");
                    // Add more fields as needed
                    
                    // Display post content with background image
            %>
             <a href="fullarticle.jsp?postId=<%= postId2 %>">
            <div class="book-content" style="background-image: url('<%= imageUrl %>');">
                <h2><%= title %></h2>
                <p><%= content %></p>
              
            </div>
            <% 
                }
                userPostsRs.close();
                userPostsPstmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
            %>
</a>
            <i id="right" class="fa-solid fa-angle-right"></i>
        </div>
    </div>
</section>

        

<div class="top-reads-title">
    <h2>Recommended for you</h2>
</div>

<section class="full-article recommendations">
    <% 
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");

        // Fetch the category of the currently displayed post
        int postId = Integer.parseInt(request.getParameter("postId")); // Assuming you have the post ID
        String categoryQuery = "SELECT Category FROM Posts WHERE PostID = ?";
        PreparedStatement categoryStmt = conn.prepareStatement(categoryQuery);
        categoryStmt.setInt(1, postId);
        ResultSet categoryRs = categoryStmt.executeQuery();

        String category = "";
        if (categoryRs.next()) {
            category = categoryRs.getString("Category");
        }

        // Fetch posts from the same category
        String postQuery = "SELECT p.*, u.username, u.ImageURL AS UserImageURL FROM Posts p INNER JOIN Users u ON p.UserID = u.UserID WHERE p.Category = ?";
        PreparedStatement postStmt = conn.prepareStatement(postQuery);
        postStmt.setString(1, category);
        ResultSet rs = postStmt.executeQuery();

        while (rs.next()) {
            String title = rs.getString("Title");
            String content = rs.getString("Content");
            String imageUrl = rs.getString("ImageURL");
            String username = rs.getString("username");
            Timestamp createdAt = rs.getTimestamp("CreatedAt");
    %>
    <div class="rec-article">
        <img class="rec-article__img" src="<%= imageUrl %>">
        <div class="rec-article__info">
            <div class="info__row1">
                <img class="info__img" src="<%= rs.getString("UserImageURL") %>">
                <span><%= username %></span>
            </div>
            <h2><%= title %></h2>
            <p><%= content %></p>
            <span><%= createdAt %></span>
        </div>
    </div>
    <% 
        }
        
        rs.close();
        postStmt.close();
        categoryRs.close();
        categoryStmt.close();
        conn.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
    %>
</section>



    </main>
    <footer>
        <div class="social">
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-snapchat"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-facebook-f"></i></a>
        </div>
        <ul class="links">
            <li><a href="homepage.js">Home</a></li>
            <li><a href="aboutus.js">About Us</a></li>
            <li><a href="terms.js">Terms</a></li>
            <li><a href="privacy-policy.js">Privacy policy</a></li>
        </ul>
        <hr>
        <p class="copyright">Copyright &copy;2024 | Quillverse</p>
    </footer>
</body>
<script src="homepage.js"></script>
<script src="fullarticle.js"></script>



</html>
