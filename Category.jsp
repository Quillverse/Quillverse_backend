<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %> <!-- Import List class -->
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"  rel="stylesheet">
    <link rel="stylesheet" href="homepage.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Categories</title>
    <style>
        body {
            font-family: 'Poppins', sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f8f8f8;
        }

        .container {
            width: 70%;
            margin: 0 auto; /* Center the container horizontally */
            padding: 20px; /* Adjust padding as needed */
            background-color: #fff;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 20px;
        }

        .post-container {
            margin-bottom: 20px;
            padding: 15px;
            border: 1px solid #ccc;
            border-radius: 5px;
            background-color: #f9f9f9;
        }

        h3 {
            color: #555;
            font-size: 24px;
            margin-top: 0;
            margin-bottom: 10px;
        }

        p {
            color: #777;
            font-size: 16px;
            line-height: 1.6;
            margin-bottom: 10px;
        }

        .author {
            color: #999;
            font-size: 14px;
            margin-top: 5px;
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
                <div class="user-btn"><a href="userprofile.jsp"><i class="fa-solid fa-user" style="color: #2D6A4F;"></i></a></div>
                <div id="username"></div>
            </div>
        </nav>
    </header>
    <main>
        <section class="container">
            <div class="content">
                <%-- Retrieve the titles, contents, and usernames from the request attributes --%>
                <% List<String> titles = (List<String>) request.getAttribute("titles");
                   List<String> contents = (List<String>) request.getAttribute("contents");
                   List<String> usernames = (List<String>) request.getAttribute("usernames"); // Added usernames retrieval
                %>
                
                <%-- Iterate through the lists and display the titles, content, and usernames --%>
                <%
                    for (int i = 0; i < titles.size(); i++) {
                %>
                        <div class="post-container">
                            <h3><%= titles.get(i) %></h3>
                            <p><%= contents.get(i) %></p>
                            <p class="author">Posted by <%= usernames.get(i) %></p>
                        </div>
                <% } %>
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
    <!-- Your HTML content goes here -->

</body>
</html>
