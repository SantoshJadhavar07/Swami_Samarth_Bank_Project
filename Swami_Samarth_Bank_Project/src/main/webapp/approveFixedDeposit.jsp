<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal, java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fixed Deposit Approval</title>
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
            
            // Update the status of the fixed deposit application to 'Approved'
            String updateQuery = "UPDATE fixed_deposit_applications SET status = 'Approved' WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(updateQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
%>
            <script>
                alert('Fixed deposit application with ID <%= id %> has been approved successfully!');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to fixed deposit applications page
            </script>
<%
            } else {
%>
            <script>
                alert('Error: Fixed deposit application with ID <%= id %> not found.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to fixed deposit applications page
            </script>
<%
            }
            
            pstmt.close();
            con.close();
        } catch (Exception e) {
%>
        <script>
            alert('Error: <%= e.getMessage() %>');
            window.location.href = 'AdminDashboard.jsp';  // Redirect back to fixed deposit applications page
        </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Invalid Fixed Deposit ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to fixed deposit applications page
    </script>
<%
    }
%>
</body>
</html>
