<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, javax.servlet.*, javax.servlet.http.*, javax.servlet.annotation.*, java.nio.file.Paths" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Admin Information</title>
</head>
<body>

<%
    // Retrieve form data
    int adminId = 2;
    String adName = request.getParameter("adname");
    String adEmail = request.getParameter("ademail");
    String adUsername = request.getParameter("adusername");
    String adPassword = request.getParameter("adpassword");
    String adPhoneNo = request.getParameter("adphoneno");
    

    try {
        // Load MySQL JDBC driver (update if needed)
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish database connection
        try (Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
             PreparedStatement ps = con.prepareStatement("UPDATE admininfo SET adname = ?, ademail = ?, adusername = ?, adpassword = ?, adphoneno = ? WHERE adid = ?")) {

            // Set parameters
            ps.setString(1, adName);
            ps.setString(2, adEmail);
            ps.setString(3, adUsername);
            ps.setString(4, adPassword);
            ps.setString(5, adPhoneNo);
           
            ps.setInt(7, adminId);

            int result = ps.executeUpdate();

            if (result > 0) {
                out.println("<script>alert('Admin information updated successfully.'); window.location = 'AdminDashboard.jsp?adid=" + adminId + "';</script>");
            } else {
                out.println("<script>alert('Update failed. Please try again.'); window.location = 'adminprofileupdate.jsp?adid=" + adminId + "';</script>");
            }
        }
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred. Please try again.'); window.location = 'AdminDashboard.jsp?adid=" + adminId + "';</script>");
    }
%>

</body>
</html>
