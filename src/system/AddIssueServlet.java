package system;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddIssueServlet")
public class AddIssueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql:///issuedb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "harsha@1729#";

    private static final String SQL_INSERT = "INSERT INTO Issue (description, status, priority, assigned_to) VALUES (?, ?, ?, ?)";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String priority = request.getParameter("priority");
        int assignedTo = Integer.parseInt(request.getParameter("assigned_to"));

        boolean isInserted = false;
        try {
            isInserted = addIssue(description, status, priority, assignedTo);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (isInserted) {
            PrintWriter out = response.getWriter();
            
            response.sendRedirect("issueAdded.jsp");
            
        } else {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("<h2>Failed to add issue!</h2>");
            out.println("<a href='addIssue.jsp'>Try Again</a>");
            out.println("</body>");
            out.println("</html>");
        } 
    }

    private boolean addIssue(String description, String status, String priority, int assignedTo)
            throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            preparedStatement = connection.prepareStatement(SQL_INSERT);
            preparedStatement.setString(1, description);
            preparedStatement.setString(2, status);
            preparedStatement.setString(3, priority);
            preparedStatement.setInt(4, assignedTo);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0; // Returns true if at least one row was inserted
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            return false;
        } finally {
            if (preparedStatement != null) {
                preparedStatement.close();
            }
            if (connection != null) {
                connection.close();
            }
        }
    }
}
