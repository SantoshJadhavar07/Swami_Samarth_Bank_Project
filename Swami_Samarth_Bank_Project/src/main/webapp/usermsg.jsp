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
    // Retrieving form data
    String fullName = request.getParameter("s1");
    String email = request.getParameter("s2");
    String msg = request.getParameter("s3");
    

    // Check if password and confirm password match
    
       
        	Class.forName("com.mysql.jdbc.Driver");

        	Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

            String query = "INSERT INTO usermsg (ufullname, uemail, umsg) VALUES (?, ?, ?)";
           PreparedStatement ps = con.prepareStatement(query);

            
            ps.setString(1, fullName);
            ps.setString(2, email);
            ps.setString(3, msg);
            
            int result = ps.executeUpdate();

           
            if(result > 0) {
                out.println("<script>alert('Message submitted successfully!'); window.location = 'raiseissue.jsp';</script>");
            } else {
                out.println("<script>alert('Submission failed. Please try again.'); window.location = 'raiseissue.jsp';</script>");
            }
        
   
%>


</body>
</html>