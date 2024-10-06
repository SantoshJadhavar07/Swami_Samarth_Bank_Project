<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update User Account</title>
    
</head>
<body>
<%
    String id = request.getParameter("id");
    String fullName = request.getParameter("fullName");
    String fatherName = request.getParameter("fatherName");
    String dob = request.getParameter("dob");
    String aadhaar = request.getParameter("aadhaar");
    String pan = request.getParameter("pan");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");
    String accountType = request.getParameter("accountType");
    String occupation = request.getParameter("occupation");
    String services = request.getParameter("services");
    String additionalServices = request.getParameter("additionalServices");
    
    if (id != null && !id.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Update user account information
            String updateQuery = "UPDATE useraccountinfo SET fullname = ?, fathername = ?, dob = ?, adharno = ?, pancardno = ?, email = ?, mobileno = ?, address = ?, accounttype = ?, occupation = ?, services = ?, additionalser = ? WHERE accoundid = ?";
            PreparedStatement pstmt = con.prepareStatement(updateQuery);
            pstmt.setString(1, fullName);
            pstmt.setString(2, fatherName);
            pstmt.setString(3, dob);
            pstmt.setString(4, aadhaar);
            pstmt.setString(5, pan);
            pstmt.setString(6, email);
            pstmt.setString(7, mobile);
            pstmt.setString(8, address);
            pstmt.setString(9, accountType);
            pstmt.setString(10, occupation);
            pstmt.setString(11, services);
            pstmt.setString(12, additionalServices);
            pstmt.setInt(13, Integer.parseInt(id));
            
            int rowsUpdated = pstmt.executeUpdate();
            
            if (rowsUpdated > 0) {
%>
            <script>
                alert('User account with ID <%= id %> has been updated successfully!');
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
        }
    } else {
%>
    <script>
        alert('Invalid ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
    </script>
<%
    }
%>
</body>
</html>
