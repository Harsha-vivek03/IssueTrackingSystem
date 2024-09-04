package system;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String rollNumber = request.getParameter("roll_number");
        String password = request.getParameter("password");
        String name="Harsha";

        // Check if credentials are valid (for simplicity, just checking if roll number is equal to password)
        if (rollNumber.equals(password)) {
            // Create a session and store user information
            HttpSession session = request.getSession();
            session.setAttribute("roll_number", rollNumber);
            session.setAttribute("name", name);
            // Redirect to home page or any other page after successful login
            response.sendRedirect("home.jsp");
        } else {
            // If credentials are invalid, redirect back to the login page
            response.sendRedirect("login.html");
        }
    }
}
