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
            background: linear-gradient(to bottom right, #ffffff, #f0f0f0);
            border-radius: 12px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
            padding: 20px;
            margin-bottom: 20px;
        }
        .welcome-msg {
            text-align: center;
            font-size: 24px;
            margin-bottom: 20px;
            color: #007bff;
        }
        .issue-details {
            margin-top: 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0px 2px 6px rgba(0, 0, 0, 0.1);
            padding: 20px;
        }
        .issue-details h2 {
            margin-bottom: 20px;
            color: #007bff;
            text-align: center;
        }
        .issue-details ul {
            list-style-type: none;
            padding-left: 0;
        }
        .issue-details li {
            margin-bottom: 15px;
            color: #555;
            font-size: 16px;
            line-height: 1.6;
        }
        .issue-details li strong {
            color: #007bff;
            font-weight: bold;
        }
    </style>
</head>
<body>
    <div class="container">
        <%@ include file="menu.jsp" %>
        <div class="card">
            <div class="welcome-msg">
                <h1>Welcome <%= session.getAttribute("name") %>!</h1>
                <p>This is our Issue Management System! This platform is designed to help you efficiently manage and track issues within your projects or organization. Whether you're a developer, project manager, or team member, our system provides tools to streamline the issue resolution process.</p>
            </div>
            <div class="issue-details">
                <h2>Issue Details</h2> 
                <ul>
                    <li><strong>Description:</strong> A brief description of the issue, providing context and details about what needs to be addressed.</li>
                    <li><strong>Status:</strong> The current status of the issue, indicating whether it's open, in progress, testing, or resolved.</li>
                    <li><strong>Priority:</strong> The importance or urgency level of the issue, helping you prioritize tasks and allocate resources effectively.</li>
                    <li><strong>Assigned To:</strong> The team member responsible for addressing the issue, ensuring accountability and clear ownership.</li>
                </ul>
            </div>
        </div>
    </div>
</body>
</html>
