<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div class="navbar">
    <span class="title">Issue Tracking System</span>
    <div class="menu-items">
        <a href="home.jsp">Home</a>
        <a href="addIssue.jsp">Add Issue</a>
        <a href="deleteIssue.jsp">Delete Issue</a>
        <a href="ViewIssueServlet">View Issue</a>
        <a href="updateIssue.jsp">Update Issue</a>
        <a class="logout-button" href="login.html">Logout</a>
    </div>
</div>
<style>
    .navbar {
        background: linear-gradient(to right, #007bff, #6610f2);
        overflow: hidden;
        border-radius: 12px;
        margin-bottom: 20px;
        display: flex;
        justify-content: space-between;
        align-items: center;
        padding: 10px 20px;
        box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
    }
    .title {
        color: #ffffff;
        font-size: 24px;
        font-weight: 900;
    }
    .menu-items {
        display: flex;
        justify-content: flex-end;
        align-items: center;
    }
    .menu-items a {
        color: #ffffff;
        text-decoration: none;
        padding: 10px 15px;
        font-size: 18px;
        margin-left: 10px;
        transition: background-color 0.3s ease, transform 0.3s ease;
    }
    .menu-items a:hover {
        background-color: rgba(255, 255, 255, 0.2);
        border-radius: 6px;
        transform: scale(1.05);
    }
    .logout-button {
        background-color: #dc3545; /* Bootstrap's danger color */
        padding: 10px 20px;
        border-radius: 6px;
        font-weight: bold;
    }
    .logout-button:hover {
        background-color: #c82333; /* Slightly darker shade of the danger color */
    }
</style>
