<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Send Response</title>
</head>
<body>
<%
    // Fetch parameters from the request
    String customerId = request.getParameter("customerId");
    String responseMessage = request.getParameter("response");

    if (customerId != null && !customerId.isEmpty() && responseMessage != null && !responseMessage.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Update response and status
            String updateQuery = "UPDATE usermsg SET aresponse = ?, status = 'Responded' WHERE umsgid = ?";
            PreparedStatement pstmt = con.prepareStatement(updateQuery);
            pstmt.setString(1, responseMessage);
            pstmt.setInt(2, Integer.parseInt(customerId));
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
%>
            <script>
                alert('Response sent successfully!');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to the dashboard page
            </script>
<%
            } else {
%>
            <script>
                alert('Error: Unable to send response.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to the dashboard page
            </script>
<%
            }

            pstmt.close();
            con.close();
        } catch (Exception e) {
%>
    <script>
        alert('Error: <%= e.getMessage() %>');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to the dashboard page
    </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Missing information.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to the dashboard page
    </script>
<%
    }
%>
</body>
</html>
