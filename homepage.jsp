<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
    <%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"  rel="stylesheet">
    <link rel="stylesheet" href="homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="   crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quillverse</title>

     <script>
        function getPosts() {
            var category = document.getElementById("category").value;
            document.getElementById("categoryForm").action = "PostsByCategoryServlet?category=" + category;
            document.getElementById("categoryForm").submit();
        }
    </script>
    <script>
        // Function to parse query parameters from URL
        function getQueryVariable(variable) {
            var query = window.location.search.substring(1);
            var vars = query.split("&");
            for (var i = 0; i < vars.length; i++) {
                var pair = vars[i].split("=");
                if (pair[0] === variable) {
                    return pair[1];
                }
            }
            return null;
        }

        // Function to display alert based on success query parameter
        window.onload = function () {
            var success = getQueryVariable("success");
            if (success === "true") {
                alert("Post added successfully!");
                // Remove the success query parameter from the URL to avoid showing the alert again on page refresh
                var newUrl = window.location.href.split("?")[0];
                window.history.replaceState({}, document.title, newUrl);
            }
        };
    </script>
    <style>
    .box {
    /* border: 2px solid green; */
    background-color: #fff;
    border-radius: 5px;
    width: 90%;
    }

    /* Styling for the category buttons */
    .category-button {
        background-color: #2d6a4f;
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 5px;
        cursor: pointer;
        border-radius: 5px;
          box-shadow: 0 5px 10px rgba(0, 0, 0, 0.1); /* Drop shadow for depth */
    }

    .category-button.selected {
        background-color: darkgreen !important; /* Ensure priority */
        color: white;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Drop shadow for depth */
    }
aside {
    position: sticky;
    top: 6px;
    height: 600px;
    border: 1px solid #ccc;
    border-radius: 5px;
    background-color: #fff;
    padding: 0 20px;
    margin: 0 15px;
    display: flex;
    flex-direction: column;
    width: 410px; /* Adjust as needed */
}

aside h2 {
    color: #888; /* Dimmed text color */
}

.explore-topics {
    flex: 1;
    display: flex;
    flex-direction: column;
    align-items: flex-start;
}

#categoryButtons {
    width: 100%;
}

.category-button {
    position: relative;
    width: 100%;
    padding: 10px; /* Adjust padding as needed */
    margin-bottom: 10px;
    background-color: #f0f0f0; /* Button background color */
    border: 1px solid #ccc; /* Button border */
    border-radius: 5px; /* Rounded corners */
    text-align: center; 
    color:#C0C0C0;
}

.category-button::before {
    content: '';
    position: absolute;
    left: 0px;
    top:0;
    width: 10px;
    height: 10px;
    background-color: lightgreen;
    border-radius: 50%;
    transform: translate(-50%, -50%);
}

.category-button:hover::before {
    background-color: limegreen;
}

#categoryForm button {
    width: 110%;
    padding: 10px; /* Match padding with category buttons */
    background-color: #7CB9E8;
    color: white;
    border: 1px solid #ccc;
    border-radius: 5px;
    text-align: center;
}

#categoryForm button:hover {
    background-color: #0056b3;
}



    /* Styling for the "Show Posts" button */
    button[type="button"] {
        background-color: 	#7393B3;
        color: white;
        border: none;
        padding: 10px 20px;
        margin: 5px;
        cursor: pointer;
        border-radius: 5px;
          box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1); /* Drop shadow for depth */
    }
  /* Style to make the anchor tag look like an input field */
  .fake-input {
    border: 1px solid #ccc;
    padding: 5px;
    display: inline-block;
    text-decoration: none;
    color: #000; /* Text color */
    cursor: pointer;
  }
  .content-wrapper {
    max-width: 100%; /* Adjust this value as needed */
    overflow-x: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
}
  
    

  /* Hover effect for username */

::-webkit-input-placeholder {
    /* WebKit browsers (Chrome, Safari) */
    color: #999; /* Placeholder text color */
 
     font-weight: bold; 
}
input[type="text"] {
font:bold;
    width: 200px; /* Set width */
    padding: 10px; /* Add padding */
    border: 1px solid #ccc; /* Add border */
    border-radius: 20px; /* Add rounded corners */
    height: 40px; /* Set height */
}

.user-btn a {
    text-decoration: none;
    font-size: 1.5rem;
    display: block;
    width: 2.5rem;
    height: 2.5rem;
    text-align: center;
    justify-content: center;
    padding: 2px;
    background-color: #D8F3DC;
    border: 1px solid #ccc;
    border-radius: 30%;
    margin-left: 23px;
}
.overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.7);
    z-index: 999;
}

#newPostForm {
    display: none;
    position: fixed;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    width: 60%;
    max-width: 800px;
    background: #2d3748;
    padding: 20px;
    border-radius: 10px;
    z-index: 1000;
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.2);
    color: #fff;
    overflow-y: auto;
    max-height: 80vh;
}

#newPostForm h2 {
    margin-top: 0;
    color: #a0aec0;
}

#newPostForm label {
    display: block;
    margin: 10px 0 5px;
    color: #cbd5e0;
}

#newPostForm input[type="text"],
#newPostForm textarea,
#newPostForm select,
#newPostForm input[type="file"] {
    width: 100%;
    padding: 10px;
    margin-bottom: 15px;
    border: 1px solid #4a5568;
    border-radius: 5px;
    background: #1a202c;
    color: #a0aec0;
}

#newPostForm input[type="submit"],
.close-btn {
    background: #4caf50;
    color: #fff;
    border: none;
    padding: 10px 20px;
    border-radius: 5px;
    cursor: pointer;
    text-align: center;
    margin-top: 20px;
}

#newPostForm input[type="submit"]:hover,
.close-btn:hover {
    background: #45a049;
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
                <li><a href="http://localhost:8080">Chat Room</a></li>
                <li><a href="#" onclick="toggleNewPostForm()"><input type="text" placeholder="Add New Post"></a></li>
            </ul>
            <div class="user">
                <% 
                    // Retrieve image URL from the database
                    String UserimageUrl = ""; // Initialize with default value
                    try {
                        // Establish database connection and retrieve image URL
                        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db?useSSL=false", "root", "Shahil");
                        PreparedStatement stmt = conn.prepareStatement("SELECT ImageURL FROM Users WHERE UserID = ?");
                        stmt.setInt(1, (int) session.getAttribute("userID"));
                        ResultSet rs = stmt.executeQuery();
                        if (rs.next()) {
                            UserimageUrl = rs.getString("ImageURL");
                        }
                %>
                <img src="<%= UserimageUrl %>" alt="userDP.png" style="width:35px; height:35px; border-radius:50%;">

                <% 
                        rs.close();
                        stmt.close();
                        conn.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </div>
        </nav>
    </header>
    <main>
 <section class="slider-container">
        <div class="top-reads-title">
            <h2>Top reads</h2>
        </div>

        <div class="book-slider-content">
            <div class="book-wrapper" id="slider">
                <i id="left" class="fa-solid fa-angle-left"></i>

                <!-- Iterate over the result set and display posts in the book-slider-content -->
                <% 
                try {
                    // Establish database connection
                    Class.forName("com.mysql.cj.jdbc.Driver");
                    Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db?useSSL=false", "root", "Shahil");
                    // Query to retrieve posts and usernames
                    String query = "SELECT p.*, u.username FROM Posts p INNER JOIN Users u ON p.UserID = u.UserID";
                    PreparedStatement pstmt = conn.prepareStatement(query);
                    ResultSet rs = pstmt.executeQuery();

                    // Iterate over the result set and display posts with usernames
                    while (rs.next()) {
                        // Retrieve post data and username
                        String title = rs.getString("Title");
                        String content = rs.getString("Content");
                        String username = rs.getString("username");
                        String imageUrl = rs.getString("ImageURL");
                        int postId = rs.getInt("PostID");
                        int halfLength = content.length() / 5;
                        String halfContent = content.substring(0, halfLength) + ". . . . . . . . . ."; // Concatenate ellipsis to the half content
                %>
                <a href="fullarticle.jsp?postId=<%= postId %>">
                <div class="book-content" style="background-image: url('<%= imageUrl %>')">
                    <h2><%= title %></h2>
                    <!-- Display only half of the content -->
                    <p><%= halfContent %></p>
                    <h5><%= username %></h5>
                </div>
                </a>
                <% 
                    }
                    rs.close();
                    pstmt.close();
                    conn.close();
                } catch (Exception e) {
                    e.printStackTrace();
                }
                %>

                <i id="right" class="fa-solid fa-angle-right"></i>
            </div>
        </div>
    </section>

       <section class="container">
        <aside>
    <h2>Explore Topics</h2>
    <div class="explore-topics">
        <div id="categoryButtons">
            <button class="category-button" value="1" onclick="getPosts(this)">Programming</button>
            <button class="category-button" value="2" onclick="getPosts(this)">self-growth</button>
            <button class="category-button" value="3" onclick="getPosts(this)">Productivity</button>
            <button class="category-button" value="4" onclick="getPosts(this)">Data Science</button>
            <button class="category-button" value="5" onclick="getPosts(this)">Technology</button>
            <button class="category-button" value="6" onclick="getPosts(this)">Relationship</button>
            <button class="category-button" value="7" onclick="getPosts(this)">Money</button>
            <button class="category-button" value="8" onclick="getPosts(this)">Food</button>
        </div>
        <form id="categoryForm" method="get" action="PostsByCategoryServlet">
            <input type="hidden" id="selectedCategory" name="category">
            <button type="button" onclick="submitForm()">Show Posts</button>
        </form>
    </div>
</aside>
            <div class="content">
        <% 
            try {
                // Establish database connection
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/blog_db?useSSL=false", "root", "Shahil");
                // Query to retrieve posts and usernames
                String query = "SELECT p.*, u.username FROM Posts p INNER JOIN Users u ON p.UserID = u.UserID";
                PreparedStatement pstmt = conn.prepareStatement(query);
                ResultSet rs = pstmt.executeQuery();

                // Iterate over the result set and display posts with usernames
                while (rs.next()) {
                    // Retrieve post data and username
                    String title = rs.getString("Title");
                    String content = rs.getString("Content");
                    String username = rs.getString("username");
                    String imageUrl = rs.getString("ImageURL");
                    int postId = rs.getInt("PostID");
                    int oneFourthLength = content.length() / 4;
                    String oneFourthContent = content.substring(0, oneFourthLength) + ". . . . . . . . . ."; // Concatenate ellipsis to the one-fourth content

                    %>
                    <div class="box slide">
                                                <% if (imageUrl != null) { %>
                                <img src="<%= imageUrl %>" alt="Image">
                            <% } %>
                        <div>
                            <h1><%= title %></h1>
                                        <!-- Display only half of the content -->
                    <p><%= oneFourthContent%></p>
                    <p><a href="fullarticle.jsp?postId=<%= postId %>" style="color: blue;">Read more</a></p>
                             </div>
                                     </div>
                                   
                <% 
                }
                rs.close();
                pstmt.close();
                conn.close();
            } catch (Exception e) {
                e.printStackTrace();
            }
        %> 
            </div>

  
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
            <li><a href="homepage.jsp">Home</a></li>
            <li><a href="aboutus.jsp">About Us</a></li>
            <li><a href="terms.jsp">Terms</a></li>
            <li><a href="privacy-policy.jsp">Privacy policy</a></li>
        </ul>
        <hr>
        <p class="copyright">Copyright &copy;2024 | Quillverse</p>
    </footer>
    <div class="overlay" onclick="toggleNewPostForm()"></div>

    <!-- New Post Form -->
    <div id="newPostForm">
        <h2>Add New Post</h2>
        <form action="AddPostServlet" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label>
            <input type="text" id="title" name="title" required>

            <label for="content">Content:</label>
            <textarea id="content" name="content" rows="10" required></textarea>

            <label for="image">Image:</label>
            <input type="file" id="image" name="image" accept="image/*">

            <label for="category">Category:</label>
            <select id="category" name="category">
                <option value="1">Programming</option>
                <option value="2">Self-growth</option>
                <option value="3">Productivity</option>
                <option value="4">Data Science</option>
                <option value="5">Technology</option>
                <option value="6">Relationship</option>
                <option value="7">Money</option>
                <option value="8">Food</option>
            </select>

            <input type="submit" value="Add Post">
            <div class="close-btn" onclick="toggleNewPostForm()">Close</div>
        </form>
    </div>


<script>
    function getPosts(button) {
        var categoryButtons = document.querySelectorAll('.category-button');
        categoryButtons.forEach(function(btn) {
            btn.classList.remove('selected');
        });
        button.classList.add('selected');
        var categoryValue = button.value;
        document.getElementById('selectedCategory').value = categoryValue;
    }

    function submitForm() {
        document.getElementById('categoryForm').submit();
    }
</script>

<script src="homepage.js"></script>
<script>function toggleNewPostForm() {
    var overlay = document.querySelector('.overlay');
    var newPostForm = document.getElementById('newPostForm');
    overlay.style.display = overlay.style.display === 'block' ? 'none' : 'block';
    newPostForm.style.display = newPostForm.style.display === 'block' ? 'none' : 'block';
}
</script>
</body>


</html>
