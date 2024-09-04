<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home Page</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            min-height: 100vh;
        }
        .container {
            width: 80%;
            margin: auto;
            padding: 20px;
        }
        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .welcome-msg {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            height: 70vh;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="menu.jsp" %>
        <div class="card">
            <div class="welcome-msg">
                <p>Issue successfully Updated.</p>
            </div>
        </div>
    </div>
</body>
</html>
