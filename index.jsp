<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="newlanding.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quillverse</title>
</head>

<body>
    <header id="home">
        <nav class="navbar">
            <img src="finalogo.png" height="42" width="42">
            <ul class="nav-links">
                <li><a href="#home" class="scroll-link">Home</a></li>
                <li><a href="#aboutUs" class="scroll-link">About</a></li>
                <li><a href="#membership" class="scroll-link">Membership</a></li>
            </ul>
            <div class="hero__btn-container">
                <button id="redirectToLoginForm" class="hero-btn">Login</button>
                <script>
                    document.getElementById("redirectToLoginForm").addEventListener("click", function () {
                        window.location.href = "login.jsp?showSignUp=false";
                    });
                </script>
            </div>

        </nav>
    </header>
    <main>
        <section class="hero-sec">
            <div class="hero">
                <div class="hero__content">
                    <div class="welcome">
                        <h1>Your go-to place to <br> read
                            & write <br>insightful articles.</h1>
                        <p>Explore the boundless world of Quillverse with us and <br>embark on a journey of discovery,
                            learning,
                            and inspiration</p>
                    </div>
                    <div class="hero__btn-container">
                        <button id="redirectToRegForm" class="hero-btn">Get Started</button>
                        <script>
                            document.getElementById("redirectToRegForm").addEventListener("click", function () {
                                window.location.href = "signup.jsp?showSignUp=true";
                            });
                        </script>
                    </div>
                </div>
                <div class="hero-sec__img">
                    <img src="article-img.jpg">
                </div>
            </div>

        </section>
        <section class="illustration-container" id="aboutUs">
            <div class="illustration">
                <div class="illustration__img">
                    <img src="illustration1.jpg">
                </div>
                <div class="illustration__about">
                    <h3>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quidem at repudiandae quis corporis
                        officia nemo, natus soluta amet veniam similique, vero, ab eius voluptate possimus totam harum
                        hic perferendis. Aliquid!</h3>
                </div>
            </div>
            <div class="illustration">
                <div class="illustration__about">
                    <h3>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quidem at repudiandae quis corporis
                        officia nemo, natus soluta amet veniam similique, vero, ab eius voluptate possimus totam harum
                        hic perferendis. Aliquid!</h3>
                </div>
                <div class="illustration__img">
                    <img src="illustration2.jpg">
                </div>
            </div>
            <div class="illustration">
                <div class="illustration__img">
                    <img src="illustration3.jpg">
                </div>
                <div class="illustration__about">
                    <h3>Lorem ipsum dolor, sit amet consectetur adipisicing elit. Quidem at repudiandae quis corporis
                        officia nemo, natus soluta amet veniam similique, vero, ab eius voluptate possimus totam harum
                        hic perferendis. Aliquid!</h3>
                </div>
            </div>
        </section>
    </main>
    <footer id="membership">
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
    <script>

    </script>
</body>
<script src="newLanding.js"></script>

</html>