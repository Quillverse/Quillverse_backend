<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Add Post</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 50%;
            margin: 0 auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            margin-top: 40px;
            height:420px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        form {
            margin-top: 20px;
        }
        label {
            font-weight: bold;
        }
        input[type="text"],
        textarea,
        select {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            float: right;
                margin-right: 45%;
        }
        input[type="submit"]:hover {
            background-color: #45a049;
        }
        .image-upload {
            margin-top: 15px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Add New Post</h2>
        <form action="AddPostServlet" method="post" enctype="multipart/form-data">
            <label for="title">Title:</label><br>
            <input type="text" id="title" name="title"><br>

            <label for="content">Content:</label><br>
            <textarea id="content" name="content" rows="5" cols="50"></textarea><br>

            <label for="category">Category:</label><br>
            <select id="category" name="category">
                <option value="1">Programming</option>
                <option value="2">Self Improvement</option>
                <option value="3">Productivity</option>
                   <option value="4">Data Science</option>
                      <option value="5">Technology</option>
                         <option value="6">Relationship</option>
                            <option value="7">Money</option>
                               <option value="8">Food</option>
            </select><br>

            <label for="image">Image:</label><br>
            <input type="file" id="image" name="image" accept="image/*"><br>

            <input type="submit" value="Add Post">
        </form>
    </div>
</body>
</html>
