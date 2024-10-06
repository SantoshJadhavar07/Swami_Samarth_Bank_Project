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
String x=request.getParameter("s1");
String y=request.getParameter("s2");

HttpSession currentSession = request.getSession(); 

Class.forName("com.mysql.jdbc.Driver");

Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

PreparedStatement ps = con.prepareStatement("SELECT * FROM admininfo WHERE adusername = ? AND adpassword = ?");
ps.setString(1, x);
ps.setString(2, y);

ResultSet rs1 = ps.executeQuery();

if (rs1.next()) {
	
	int adminId = rs1.getInt("adid");

    // Set session attribute
    currentSession.setAttribute("adid", adminId);

    
    out.println("<script>");
    out.println("alert('Login Successful');");
    out.println("window.location = 'AdminDashboard.jsp';");
    out.println("</script>");
} else {
    out.println("<script>");
    out.println("alert('Login Failed');");
    out.println("window.location = 'adminlogin.html';");
    out.println("</script>");
}
	           %>
	           
</body>
</html>