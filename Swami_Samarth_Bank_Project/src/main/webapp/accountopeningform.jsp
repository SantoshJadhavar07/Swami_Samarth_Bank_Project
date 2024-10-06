<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Account Opening Form Submission</title>
</head>
<body>

<%
    String fullName = request.getParameter("s1");
    String fatherName = request.getParameter("s2");
    String dob = request.getParameter("s3");
    String aadhaar = request.getParameter("s4");
    String pan = request.getParameter("s5");
    String email = request.getParameter("s6");
    String mobile = request.getParameter("s7");
    String address = request.getParameter("s8");
    String accountType = request.getParameter("s9");
    String occupation = request.getParameter("s10");
    String additionalServices = request.getParameter("s11");

    String[] services = request.getParameterValues("services[]");

    String servicesStr = "";
    if (services != null) {
        servicesStr = String.join(",", services);
    }

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
        
        // Check if email already exists
        String checkQuery = "SELECT COUNT(*) FROM useraccountinfo WHERE adharno = ?";
        PreparedStatement checkPs = con.prepareStatement(checkQuery);
        checkPs.setString(1, aadhaar);
        ResultSet rs = checkPs.executeQuery();
        rs.next();
        int count = rs.getInt(1);

        if (count > 0) {
            // Email already exists
            out.println("<script>alert('An account with this aadhar already exists.'); window.location = 'accountopeningform.html';</script>");
        } else {
            // Email does not exist, proceed with insert
            String query = "INSERT INTO useraccountinfo (accoundid, fullname, fathername, dob, adharno, pancardno, email, mobileno, address, accounttype, occupation, services, additionalser) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement ps = con.prepareStatement(query);
            
            ps.setInt(1, (int) session.getAttribute("userId"));
            ps.setString(2, fullName);
            ps.setString(3, fatherName);
            ps.setString(4, dob);
            ps.setString(5, aadhaar);
            ps.setString(6, pan);
            ps.setString(7, email);
            ps.setString(8, mobile);
            ps.setString(9, address);
            ps.setString(10, accountType);
            ps.setString(11, occupation);
            ps.setString(12, servicesStr);
            ps.setString(13, additionalServices);
            
           

            int result = ps.executeUpdate();

            if(result > 0) {
                out.println("<script>alert('Form submitted successfully.'); window.location = 'UserDashboard.jsp';</script>");
            } else {
                out.println("<script>alert('Submission failed. Please try again.'); window.location = 'accountopeningform.html';</script>");
            }
        }
        
        // Clean up
        rs.close();
        checkPs.close();
       
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred. Please try again.'); window.location = 'accountopeningform.html';</script>");
    }
%>

</body>
</html>
