<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%

String email = request.getParameter("a1");
String password = request.getParameter("a2");
String confirmPassword = request.getParameter("a3");


if (password.equals(confirmPassword)) {
    Class.forName("com.mysql.jdbc.Driver");
    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

    PreparedStatement ps = con.prepareStatement("UPDATE userinfo SET upass = ? WHERE uemail = ?");

   
    ps.setString(1, password);
    ps.setString(2, email);

   
    

    int result = ps.executeUpdate();

    if (result > 0) {
        out.println("<script>");
        out.println("alert('Password Reset Successfully');");
        out.println("window.location = 'Userlogin.html';");
        out.println("</script>");
    } else {
        out.println("<script>");
        out.println("alert('Reset Failed ! Please Enter your Register Email');");
        out.println("window.location = 'Userlogin.html';");
        out.println("</script>");
    }
    con.close();
} else {
    out.println("<script>");
    out.println("alert('New Passwords And Confirm Password do not match');");
    out.println("window.location = 'Userlogin.html';");
    out.println("</script>");
}
%>

</body>
</html>