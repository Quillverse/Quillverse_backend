<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="homepage.css">
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link
        href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css"
        integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <title>Sign-up</title>
    <style>
        * {
            margin: 0;
            padding: 0;
        }

        body {
            background-color: #D8F3DC;
            background: linear-gradient(to right, #e2e2e2, #D8F3DC);
            display: flex;
            align-items: center;
            justify-content: center;
            flex-direction: column;
            height: 100vh;
            height: 100dvh;
        }
    </style>
</head>

<body>
    <div class="log-in-container" id="logInContainer">
       
        <div class="form-container sign-in">
           <form action="SignUpServlet" method="POST">
                <h1>Create Account</h1>

                <span>or use your email for registration</span>
                <input type="text" name="username" placeholder="Username" required>
                <input type="email" name="email" placeholder="E-mail" required>
                <input type="password" name="password" id="password" placeholder="Password" required>
                <span id="passwordWarning" style="color: red; font-size: 12px;"></span>
                <button>Sign Up</button>
            </form>
        </div>
        <div class="toggle-container">
            <div class="toggle">
                <div class="toggle-panel toggle-right">
                    <h1>Quill your thoughts...</h1>
                    <p>Register to join our community</p>
                </div>
            </div>
        </div>
    </div>
    <script>
    document.getElementById("password").addEventListener("input", function () {
        var password = document.getElementById("password").value;
        var passwordWarning = document.getElementById("passwordWarning");
        if (!isValidPassword(password)) {
            passwordWarning.innerText = "Password must be at least 8 characters long and include a special character and a number";
        } else {
            passwordWarning.innerText = "";
        }
    });

    function isValidPassword(password) {
        // Password must be at least 8 characters long and include a special character and a number
        var regex = /^(?=.*[0-9])(?=.*[!@#$%^&*+=])(?=\S+$).{8,}$/;
        return regex.test(password);
    }
</script>

</body>

</html>