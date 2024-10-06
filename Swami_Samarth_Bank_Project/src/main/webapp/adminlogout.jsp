<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Logout</title>
</head>
<body>
<%
    // Retrieve the current session, if it exists
    HttpSession currentSession = request.getSession(false); // false means don't create a new session if one doesn't exist

    // Check if the session exists and invalidate it
    if (currentSession != null) {
        currentSession.invalidate();
       
        // Set a message to be displayed
        String message = "You have been logged out successfully.";
        // Display the message using JavaScript alert
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("window.location.href = 'adminlogin.html';"); // Redirect to login page or homepage
        out.println("</script>");
    } else {
        // Set a message to be displayed if no session exists
        String message = "No active session found.";
        // Display the message using JavaScript alert
        out.println("<script>");
        out.println("alert('" + message + "');");
        out.println("window.location.href = 'adminlogin.html';"); // Redirect to login page or homepage
        out.println("</script>");
    
    }

    // Redirect to the login page
    response.sendRedirect("adminlogin.html");
%>
</body>
</html>
