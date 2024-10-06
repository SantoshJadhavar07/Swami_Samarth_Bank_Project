<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Card Approval</title>
</head>
<body>
<%
    String id = request.getParameter("customerId");
    
    if (id != null && !id.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Update the status of the card application to 'Approved'
            String updateQuery = "UPDATE card_applications SET status = 'Approved' WHERE id = ?";
            PreparedStatement pstmt = conn.prepareStatement(updateQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
%>
            <script>
                alert('Card application with ID <%= id %> has been approved successfully!');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to cards section
            </script>
<%
            } else {
%>
            <script>
                alert('Error: Card application with ID <%= id %> not found.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to cards section
            </script>
<%
            }
            
            pstmt.close();
            conn.close();
        } catch (Exception e) {
%>
        <script>
            alert('Error: <%= e.getMessage() %>');
            window.location.href = 'AdminDashboard.jsp';  // Redirect back to cards section
        </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Invalid Card Application ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to cards section
    </script>
<%
    }
%>
</body>
</html>
