<%@ page import="java.sql.*, java.io.*, java.util.*" %>
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
                <li><a href="membership.html">Membership</a></li>
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
                    String query = "SELECT * FROM Posts WHERE PostID = ?";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    pstmt.setInt(1, postId);
                    ResultSet rs = pstmt.executeQuery();

                    if (rs.next()) {
                    	  String title = rs.getString("Title");
                          String content = rs.getString("Content");
                          String imageUrl = rs.getString("ImageURL");
                        

                        // Display full article content
                %>
                        <h1 class="article__title"><%= title %></h1>
                        <div class="details__author">
                            <!-- Author Image -->
                            <img class="author__img" src="author-img.png"> <!-- You can replace this with the actual author's image -->
                            <div class="author__metadata">
                             
                              
                            </div>
                        </div>
                        <% if (imageUrl != null) { %>
                            <div class="article__img">
                                <img src="<%= imageUrl %>" alt="Article Image">
                            </div>
                        <% } %>
                        <div class="full-article__content">
                           <div class="content-container"> <!-- Add a container around the content -->
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
        </section>

        <!-- Rest of your HTML content -->

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
<script src="fullarticle.js"></script>

</html>
