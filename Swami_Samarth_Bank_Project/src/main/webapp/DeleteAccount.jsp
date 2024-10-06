<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User Account</title>
</head>
<body>
<%
    String id = request.getParameter("id");
    
    if (id != null && !id.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Delete user account information
            String deleteQuery = "DELETE FROM useraccountinfo WHERE accoundid = ?";
            PreparedStatement pstmt = con.prepareStatement(deleteQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            
            int rowsDeleted = pstmt.executeUpdate();
            
            if (rowsDeleted > 0) {
%>
            <script>
                alert('User account with ID <%= id %> has been deleted successfully!');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
            </script>
<%
            } else {
%>
            <script>
                alert('Error: User account with ID <%= id %> not found.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
            </script>
<%
            }
            
            pstmt.close();
            con.close();
        } catch (Exception e) {
%>
        <script>
            alert('Error: <%= e.getMessage() %>');
            window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
        </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Invalid User ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
    </script>
<%
    }
%>
</body>
</html>
