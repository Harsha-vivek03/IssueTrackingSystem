<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Issue</title>
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
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s;
        }
        input[type="text"]:focus {
            border-color: #007bff;
            outline: none;
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
        <div class="card">
            <h2>Update Issue</h2>
            <form action="UpdateIssueServlet" method="post">
                <input type="hidden" name="issue_id" value="${issue.issueId}">
                Description: <input type="text" name="description" value="${issue.description}"><br>
                Status: <input type="text" name="status" value="${issue.status}"><br>
                Priority: <input type="text" name="priority" value="${issue.priority}"><br>
                Assigned To: <input type="text" name="assigned_to" value="${issue.assignedTo}"><br>
                <input type="submit" value="Update Issue">
            </form>
        </div>
    </div>
</body>
</html>
