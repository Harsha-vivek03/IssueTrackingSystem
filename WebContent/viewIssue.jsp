<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Issues</title>
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f4f4f4;
        margin: 0;
        padding: 0;
    }
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
    h2 {
        text-align: center;
        color: #333;
    }
    table {
        width: 80%;
        margin: 20px auto;
        border-collapse: collapse;
    }
    th, td {
        padding: 10px;
        border-bottom: 1px solid #ddd;
        text-align: left;
    }
    th {
        background-color: #f2f2f2;
    }
</style>
</head>
<body>
    
    
   <div class="container">
     <%@ include file="menu.jsp" %>
        <div class="card">
    <h2>View Issues</h2>
    <table>
        <tr>
            <th>Issue ID</th>
            <th>Description</th>
            <th>Status</th>
            <th>Priority</th>
            <th>Assigned To</th>
        </tr>
        <c:forEach items="${issues}" var="issue">
            <tr>
                <td>${issue.issueId}</td>
                <td>${issue.description}</td>
                <td>${issue.status}</td>
                <td>${issue.priority}</td>
                <td>${issue.assignedTo}</td>
            </tr>
        </c:forEach>
    </table>
    </div>
    </div>
</body>
</html>
