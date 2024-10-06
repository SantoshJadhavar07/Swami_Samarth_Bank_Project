<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Approval</title>
</head>
<body>
<%
    String id = request.getParameter("customerId");
    
    if (id != null && !id.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Update the status of the loan application to 'Approved'
            String updateQuery = "UPDATE loan_applications SET status = 'Rejected' WHERE id = ?";
            PreparedStatement pstmt = con.prepareStatement(updateQuery);
            pstmt.setInt(1, Integer.parseInt(id));
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
%>
            <script>
                alert('Loan application with ID <%= id %> has been approved successfully!');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to loan applications page
            </script>
<%
            } else {
%>
            <script>
                alert('Error: Loan application with ID <%= id %> not found.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to loan applications page
            </script>
<%
            }
            
            pstmt.close();
            con.close();
        } catch (Exception e) {
%>
        <script>
            alert('Error: <%= e.getMessage() %>');
            window.location.href = 'AdminDashboard.jsp';  // Redirect back to loan applications page
        </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Invalid Loan Application ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to loan applications page
    </script>
<%
    }
%>
</body>
</html>
