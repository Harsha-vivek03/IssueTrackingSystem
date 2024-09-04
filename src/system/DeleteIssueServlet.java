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

@WebServlet("/DeleteIssueServlet")
public class DeleteIssueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    private static final String JDBC_URL = "jdbc:mysql:///issuedb";
    private static final String JDBC_USER = "root";
    private static final String JDBC_PASSWORD = "harsha@1729#";

    private static final String SQL_DELETE = "DELETE FROM Issue WHERE issue_id = ?";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int issueId = Integer.parseInt(request.getParameter("issue_id"));

        boolean isDeleted = false;
        try {
            isDeleted = deleteIssue(issueId);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        if (isDeleted) {
            response.sendRedirect("issueDeleted.jsp");
        } else {
            PrintWriter out = response.getWriter();
            out.println("<html>");
            out.println("<body>");
            out.println("<h2>Failed to delete issue!</h2>");
            out.println("<a href='deleteIssue.jsp'>Try Again</a>");
            out.println("</body>");
            out.println("</html>");
        }
    }

    private boolean deleteIssue(int issueId) throws SQLException {
        Connection connection = null;
        PreparedStatement preparedStatement = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(JDBC_URL, JDBC_USER, JDBC_PASSWORD);
            preparedStatement = connection.prepareStatement(SQL_DELETE);
            preparedStatement.setInt(1, issueId);

            int rowsAffected = preparedStatement.executeUpdate();

            return rowsAffected > 0; // Returns true if at least one row was deleted
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
