<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="profile.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quillverse</title>
    <style>  
        #username {
            font-size: 16px; /* Adjust font size */
            font-weight: bold; /* Bold text */
            color: #333; /* Text color */

        }
        .profile-pic img{
    border: 5px solid #eeeeee;
    border-radius: 50%;
    width: 132%;
    height: 130%;
    margin-left:-22px;
}
    </style>
</head>

<body>
    <header>
        <nav>
            <div class="logo-img">
                <img src="finalogo.png" height="42" width="42">
            </div>
            <ul class="nav-links">
                <li><a href="homepage.jsp">Home</a></li>
                <li><a href="aboutus.jsp">About</a></li>
                <li><a href="membership.jsp">Membership</a></li>
            </ul>
            <div class="user">
                <div class="user-btn"><i class="fa-solid fa-user" style="color: #2D6A4F;"></i></div>
            </div>
        </nav>
    </header>

    <main>
        <div class="cover-photo">
            <div class="img-buttons">
                <div class="settings"><a href="account-settings.jsp"><i class="fa-solid fa-gear"></i></a></div>
                
            </div>
        </div>
       <div class="profile-pic">
            <% 
                // Retrieve image URL from the database
                String imageUrl = ""; // Initialize with default value
                try {
                    // Establish database connection and retrieve image URL
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db", "root", "Shahil");
                    PreparedStatement stmt = conn.prepareStatement("SELECT ImageURL FROM Users WHERE UserID = ?");
                    stmt.setInt(1, (int) session.getAttribute("userID"));
                    ResultSet rs = stmt.executeQuery();
                    if (rs.next()) {
                        imageUrl = rs.getString("ImageURL");
                    }
                    // Close database resources
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
            <img src="<%= imageUrl %>" alt="Profile Picture">
            <a href="account-settings.jsp"><i class="fa-solid fa-camera"></i></a>
        </div>
        <div class="user-id">
            <div id="username"></div>
            <div class="details">
                <span class="followers">Followers</span><span>|</span><span class="following">Following</span>
            </div>
        </div>
        <div class="contents">
            <input type="radio" name="indicator" checked id="Library">
            <input type="radio" name="indicator" id="Bookmark">
            <input type="radio" name="indicator" id="Following">
            <input type="radio" name="indicator" id="Followers">
            <div class="list">
                <label for="Library" class="library">Library</label>
                <label for="Bookmark" class="bookmark">Bookmark</label>
                <label for="Following" class="following">Following</label>
                <label for="Followers" class="followers">Followers</label>
            </div>
            <hr color="#eee" style="margin: 0;">
        </div>
    </main>

    <footer>
        <div class="social">
            <a href="#"><i class="fab fa-instagram"></i></a>
            <a href="#"><i class="fab fa-snapchat"></i></a>
            <a href="#"><i class="fab fa-twitter"></i></a>
            <a href="#"><i class="fab fa-facebook-f"></i></a>
        </div>
        <ul class="links">
            <li><a href="homepage.html">Home</a></li>
            <li><a href="aboutus.html">About Us</a></li>
            <li><a href="terms.html">Terms</a></li>
            <li><a href="privacy-policy.html">Privacy policy</a></li>
        </ul>
        <hr>
        <p class="copyright">Copyright &copy;2024 | Quillverse</p>
    </footer>

    <script src="profile.js"></script>
</body>
<script>
    // Check if session contains username
    var username = "<%= session.getAttribute("username") %>";
    if (username && username.length > 0) {
        // Display username below user section
        document.getElementById("username").innerText =  username;
    }
</script>
</html>
