<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    // Retrieve parameters from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String phone = request.getParameter("phone");
    String password = request.getParameter("password");
    String confirmPassword = request.getParameter("confirmpassword");

    // Validate parameters
    if (name == null || email == null || phone == null || password == null || confirmPassword == null) {
        out.println("<script>alert('All fields are required.'); window.location = 'userprofileupdatefetch.jsp';</script>");
        return;
    }

    Connection con = null;
    PreparedStatement ps = null;

    try {
        // Load JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish database connection
        con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank?serverTimezone=UTC", "root", "");

        // Prepare SQL update statement
        String updateQuery = "UPDATE userinfo SET ufullname = ?, uphoneno = ?, upass = ?, ucpass = ? WHERE uemail = ?";
        ps = con.prepareStatement(updateQuery);

        // Set parameters for the SQL statement
        ps.setString(1, name);
        ps.setString(2, phone);
        ps.setString(3, password);
        ps.setString(4, confirmPassword);
        ps.setString(5, email); // Email used for WHERE clause

        // Execute update
        int result = ps.executeUpdate();
        if (result > 0) {
            out.println("<script>alert('Profile updated successfully.'); window.location = 'UserDashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Profile update failed.'); window.location = 'userprofileupdatefetch.jsp';</script>");
        }

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('Error: " + e.getMessage() + "'); window.location = 'userprofileupdatefetch.jsp';</script>");
    } finally {
        // Close resources
        try {
            if (ps != null) ps.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
