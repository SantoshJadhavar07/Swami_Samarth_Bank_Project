<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Registration</title>
</head>
<body>

<%
    // Retrieving form data
    String fullName = request.getParameter("s1");
    String email = request.getParameter("s2");
    String phone = request.getParameter("s3");
    String password = request.getParameter("s4");
    String confirmPassword = request.getParameter("s5");

    // Check if password and confirm password match
    if(password.equals(confirmPassword)) {
       
        try {
            // Load the MySQL JDBC Driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

            // Check if the email already exists
            String checkEmailQuery = "SELECT * FROM userinfo WHERE uemail = ?";
            PreparedStatement checkEmailStmt = con.prepareStatement(checkEmailQuery);
            checkEmailStmt.setString(1, email);
            ResultSet rs = checkEmailStmt.executeQuery();

            if (rs.next()) {
                // If the email already exists
                out.println("<script>"
                          + "if(confirm('User already exists with this email. Click OK to try again.')) {"
                          + " window.location = 'UserReg.html';"
                          + "} else {"
                          + " window.location = 'maindashboard.html';"
                          + "}"
                          + "</script>");
            } else {
                // If email doesn't exist, insert new user data
                String query = "INSERT INTO userinfo (ufullname, uemail, uphoneno, upass, ucpass) VALUES (?, ?, ?, ?, ?)";
                PreparedStatement ps = con.prepareStatement(query);

                ps.setString(1, fullName);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, password);
                ps.setString(5, confirmPassword);

                int result = ps.executeUpdate();

                if (result > 0) {
                    out.println("<script>"
                              + "if(confirm('Registration successful. Click OK to proceed to login.')) {"
                              + " window.location = 'Userlogin.html';"
                              + "} else {"
                              + " window.location = 'UserReg.html';"
                              + "}"
                              + "</script>");
                } else {
                    out.println("<script>"
                              + "if(confirm('Registration failed. Click OK to try again.')) {"
                              + " window.location = 'UserReg.html';"
                              + "} else {"
                              + " window.location = 'maindashboard.html';"
                              + "}"
                              + "</script>");
                }

                ps.close(); // Close PreparedStatement after use
            }

            rs.close();  // Close ResultSet after use
            checkEmailStmt.close(); // Close PreparedStatement after use
            con.close(); // Close Connection after use

        } catch (Exception e) {
            e.printStackTrace(); // Print the error for debugging
        }

    } else {
        // If passwords do not match
        out.println("<script>alert('Passwords do not match'); window.location = 'UserReg.html';</script>");
    }
%>

</body>
</html>
