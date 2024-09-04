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

@WebServlet("/UpdateIssueServlet")
public class UpdateIssueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql:///issuedb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "harsha@1729#";

    private static final String SQL_UPDATE = "UPDATE Issue SET description=?, status=?, priority=?, assigned_to=? WHERE issue_id=?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int issueId = Integer.parseInt(request.getParameter("issue_id"));
        String description = request.getParameter("description");
        String status = request.getParameter("status");
        String priority = request.getParameter("priority");
        int assignedTo = Integer.parseInt(request.getParameter("assigned_to"));

        boolean isUpdated = false;
        try {
            isUpdated = updateIssue(issueId, description, status, priority, assignedTo);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (isUpdated) {
            response.sendRedirect("issueUpdated.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("<h2>Failed to update issue!</h2>");
            out.println("<a href='newUpdateIssue.jsp'>Try Again</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private boolean updateIssue(int issueId, String description, String status, String priority, int assignedTo)
            throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            preparedStatement = connection.prepareStatement(SQL_UPDATE);
            preparedStatement.setString(1, description);
            preparedStatement.setString(2, status);
            preparedStatement.setString(3, priority);
            preparedStatement.setInt(4, assignedTo);
            preparedStatement.setInt(5, issueId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0; // Returns true if at least one row was updated
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
