<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Update</title>
    <link rel="stylesheet" href="userprofileupdate.css">
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Update Profile</h1>
            <p class="description">Update your profile information below.</p>
        </div>
        <%
            // Retrieve username from session
            String username = (String) session.getAttribute("username");
            if (username == null) {
                out.println("<p>User not logged in.</p>");
                return;
            }

            // Initialize variables to hold user data
            String name = "";
            String email = "";
            String phone = "";
            String password = "";
            String confirmPassword = "";

            // Database connection and query to fetch user data
            Connection con = null;
            PreparedStatement ps = null;
            ResultSet rs = null;

            try {
                Class.forName("com.mysql.jdbc.Driver"); // Use the correct driver class
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

                String query = "SELECT ufullname, uemail, uphoneno, upass, ucpass FROM userinfo WHERE uemail = ?";
                ps = con.prepareStatement(query);
                ps.setString(1, username);

                rs = ps.executeQuery();
                if (rs.next()) {
                    name = rs.getString("ufullname");
                    email = rs.getString("uemail");
                    phone = rs.getString("uphoneno");
                    password = rs.getString("upass");
                    confirmPassword = rs.getString("ucpass");
                } else {
                    out.println("<p>No user found with username: " + username + "</p>");
                }
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<p>Error: " + e.getMessage() + "</p>");
            } finally {
                // Close resources
                try {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        %>
        <form action="userprofileupdate.jsp" method="POST">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text" id="username" name="username" class="form-control" value="<%= username %>" readonly>
            </div>
            <div class="form-group">
                <label for="name">Name</label>
                <input type="text" id="name" name="name" class="form-control" value="<%= name %>" required>
            </div>
            <div class="form-group">
                <label for="email">Email</label>
                <input type="email" id="email" name="email" class="form-control" value="<%= email %>" required>
            </div>
            <div class="form-group">
                <label for="phone">Phone No</label>
                <input type="tel" id="phone" name="phone" class="form-control" value="<%= phone %>" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" class="form-control" value="<%= password %>" required>
            </div>
            <div class="form-group">
                <label for="confirmpassword">Confirm Password</label>
                <input type="password" id="confirmpassword" name="confirmpassword" class="form-control" value="<%= confirmPassword %>" required>
            </div>
            <button type="submit" class="submit-button">Update Profile</button>
        </form>
    </div>
</body>
</html>
