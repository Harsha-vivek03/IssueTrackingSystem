<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delete Issue</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
            display: flex;
            flex-direction: column;
            align-items: center;
            min-height: 100vh;
        }
        .container {
            width: 80%;
            margin-top: 20px;
            padding: 20px;
        }
        .card {
            background-color: #fff;
            border-radius: 12px;
            box-shadow: 0px 0px 20px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
            width:75vw;
        }
        .welcome-msg {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            height:70vh;
        }
        form {
            display: flex;
            flex-direction: column;
            align-items: center;
        }
        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin: 5px 0;
            box-sizing: border-box;
        }
        input[type="submit"] {
            background-color: #007bff;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
        }
        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="menu.jsp" %>
       <div class="container">
        <div class="card">
            <h2>Delete Issue</h2>
            <form action="DeleteIssueServlet" method="post">
                Issue ID: <input type="text" name="issue_id" required><br>
                <input type="submit" value="Delete Issue">
            </form>
        </div>
    </div>
    </div>
</body>
</html>
