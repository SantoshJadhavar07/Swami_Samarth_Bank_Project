<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Retrieve the session object
    HttpSession userSession = request.getSession(false); // Get the current session, if it exists

    if (userSession != null) {
        // Invalidate the session
        userSession.invalidate();
        // Set a message to be displayed
        String message = "You have been logged out successfully.";
        // Display the message using JavaScript alert
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("window.location.href = 'Userlogin.html';"); // Redirect to login page or homepage
        out.println("</script>");
    } else {
        // Set a message to be displayed if no session exists
        String message = "No active session found.";
        // Display the message using JavaScript alert
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("window.location.href = 'Userlogin.html';"); // Redirect to login page or homepage
        out.println("</script>");
    }
%>
</body>
</html>
