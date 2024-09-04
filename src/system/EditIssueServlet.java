package system;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/EditIssueServlet")
public class EditIssueServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int issueId = Integer.parseInt(request.getParameter("issue_id"));

        // Retrieve issue details from the database
        Issue issue = getIssueById(issueId);

        request.setAttribute("issue", issue);
        request.getRequestDispatcher("/newUpdateIssue.jsp").forward(request, response);
    }

    private Issue getIssueById(int issueId) {
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;
        Issue issue = null;
        
        try {
            // Establish connection
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/issuedb", "root", "harsha@1729#");

            // SQL query to retrieve issue details by ID
            String sql = "SELECT * FROM Issue WHERE issue_id = ?";

            // Create prepared statement
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, issueId);

            // Execute query
            rs = stmt.executeQuery();

            // Process result set
            if (rs.next()) {
                issue = new Issue();
                issue.setIssueId(rs.getInt("issue_id"));
                issue.setDescription(rs.getString("description"));
                issue.setStatus(rs.getString("status"));
                issue.setPriority(rs.getString("priority"));
                issue.setAssignedTo(rs.getInt("assigned_to"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

        return issue;
    }
}
