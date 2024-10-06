<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Card Application Form Submission</title>
</head>
<body>

<%
   String cardActionType = request.getParameter("s1");
   String newCardType = request.getParameter("s2");
   String fullName = request.getParameter("s3");
   String contactNumber = request.getParameter("s4");
   String address = request.getParameter("s5");
   String existingCardType = request.getParameter("s6");
   String existingCardNumber = request.getParameter("s7");
   String expiryDate = request.getParameter("s8");
   String cardAction = request.getParameter("cardAction");
   String reason = request.getParameter("s9");

   try {
       Class.forName("com.mysql.jdbc.Driver");
       Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

       String query = "INSERT INTO card_applications (card_action_type, new_card_type, full_name, contact_number, address, existing_card_type, existing_card_number, expiry_date, card_action, reason) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
       PreparedStatement ps = con.prepareStatement(query);
       
       ps.setString(1, cardActionType);
       ps.setString(2, newCardType);
       ps.setString(3, fullName);
       ps.setString(4, contactNumber);
       ps.setString(5, address);
       ps.setString(6, existingCardType);
       ps.setString(7, existingCardNumber);
       ps.setString(8, expiryDate);
       ps.setString(9, cardAction);
       ps.setString(10, reason);
       
       int result = ps.executeUpdate();

       if (result > 0) {
           out.println("<script>alert('Card application submitted successfully.'); window.location = 'UserDashboard.jsp';</script>");
       } else {
           out.println("<script>alert('Submission failed. Please try again.'); window.location = 'applyforcards.html';</script>");
       }
   } catch (Exception e) {
       out.println("<script>alert('Error: " + e.getMessage() + "'); window.location = 'applyforcards.html';</script>");
   }
%>

</body>
</html>
