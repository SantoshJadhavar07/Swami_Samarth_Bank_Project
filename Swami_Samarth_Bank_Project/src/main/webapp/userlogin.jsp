<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Login</title>
</head>
<body>
<%
    // Retrieve form parameters
    String username = request.getParameter("s1");
    String password = request.getParameter("s2");

    // Use a different name for the session variable
    HttpSession userSession = request.getSession(); // Create or retrieve session

    try {
        // Load JDBC driver and establish connection
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

        // Prepare and execute SQL query
        PreparedStatement ps = con.prepareStatement("SELECT uid, uemail, upass FROM userinfo WHERE uemail = ? AND upass = ?");
        ps.setString(1, username);
        ps.setString(2, password);

        ResultSet rs1 = ps.executeQuery();

        if (rs1.next()) {
        	int userId = rs1.getInt(1);
            // Login successful, store user information in session
            userSession.setAttribute("username", username);
            userSession.setAttribute("userId", userId);
            
            out.println("<script>");
            out.println("alert('Login Successful');");
            out.println("window.location = 'UserDashboard.jsp';"); // Redirect to dashboard
            out.println("</script>");
        } else {
            out.println("<script>");
            out.println("alert('Login Failed');");
            out.println("window.location = 'Userlogin.html';"); // Redirect back to login
            out.println("</script>");
        }

        // Close resources
        rs1.close();
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>
</body>
</html>
