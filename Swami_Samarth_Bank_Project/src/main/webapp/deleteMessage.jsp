<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Delete User Response</title>
</head>
<body>
<%
    // Get the customer ID from the request parameter
    String customerId = request.getParameter("customerId");
    
    if (customerId != null && !customerId.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Prepare SQL delete query
            String deleteQuery = "DELETE FROM usermsg WHERE umsgid = ?";
            PreparedStatement pstmt = con.prepareStatement(deleteQuery);
            pstmt.setInt(1, Integer.parseInt(customerId));
            
            int rowsDeleted = pstmt.executeUpdate();
            
            if (rowsDeleted > 0) {
%>
            <script>
                alert('User response with ID <%= customerId %> has been deleted successfully!');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
            </script>
<%
            } else {
%>
            <script>
                alert('Error: User response with ID <%= customerId %> not found.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
            </script>
<%
            }
            
            pstmt.close();
            con.close();
        } catch (Exception e) {
%>
        <script>
            alert('Error: <%= e.getMessage() %>');
            window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
        </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Invalid Customer ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
    </script>
<%
    }
%>
</body>
</html>
