<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,400;0,500;0,600;0,700;1,400;1,500;1,600;1,700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="account-settings.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" integrity="sha512-DTOQO9RWCH3ppGqcWaEA1BIZOC6xxalwEsw9c2QQeAIftl+Vegovlnee1c9QX4TctnWMn13TZye+giMm8e2LwA==" crossorigin="anonymous" referrerpolicy="no-referrer" />
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Quillverse</title>
</head>
<body>
    <main>
        <div class="area">
            <h1>Account Settings</h1>
            <div class="container">
                <div class="content">
                    <input type="radio" name="indicator" checked id="General">

                    <div class="tabs">
                        <label for="General" class="general">General</label>
                        <div class="indicator"></div>
                    </div>
                    <div class="inside-content">
                        <div class="inside inside-general">
                            <div class="title"><b>General</b></div>
                            <div class="form">
                                <form action="AccountSettingsServlet" method="post" enctype="multipart/form-data">
                                    <!-- Hidden input for user ID -->
                                    <input type="hidden" name="userId" value="${userId}">
                                    <div class="profile-pic-sec">
                                        <span class="dp"><img id="profile-pic" src="people.png" alt="error"></span>
                                        <input type="file" name="image" accept="image/*">
                                    </div>
                                    <div class="input user-name">
                                        <div class="form-lable">
                                            <label>Username:</label>
                                        </div>
                                        <div>
                                            <input type="text" name="username" placeholder="UserName">
                                        </div>
                                    </div>
                                    <div class="input profession">
                                        <div class="form-lable">
                                            <label>Email</label>
                                        </div>
                                        <div>
                                            <input type="text" name="email" placeholder="email">
                                        </div>
                                    </div>
                                    <button type="submit" class="save">Save Changes</button>
                                    <button type="button" class="cancel">Cancel</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="buttons">
                <button class="save">Save Changes</button>
                <button class="cancel">Cancel</button>
            </div>
        </div>
    </main>
    <script src="account-settings.js"></script>
</body>
</html>
