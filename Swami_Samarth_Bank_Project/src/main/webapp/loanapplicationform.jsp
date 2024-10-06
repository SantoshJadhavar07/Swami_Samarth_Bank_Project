<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Application Form Submission</title>
</head>
<body>

<%
    // Retrieve form data from the request
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String mobile = request.getParameter("mobile");
    String address = request.getParameter("address");
    String aadhaar = request.getParameter("aadhaar");
    String loanType = request.getParameter("loan_type");
    String loanAmount = request.getParameter("loan_amount");
    String loanTenure = request.getParameter("loan_tenure");
    String occupation = request.getParameter("occupation");
    String termsAccepted = request.getParameter("terms");

    // Handle MySQL database connection and insertion
    try {
        // Load MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");

        // Establish database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

        // Create SQL query for inserting data into loan_applications table
        String query = "INSERT INTO loan_applications (name, email, mobile, address, aadhaar, loan_type, loan_amount, loan_tenure, occupation, terms_accepted) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        // Create PreparedStatement
        PreparedStatement ps = con.prepareStatement(query);

        // Set the values from the form to the query
        ps.setString(1, name);
        ps.setString(2, email);
        ps.setString(3, mobile);
        ps.setString(4, address);
        ps.setString(5, aadhaar);
        ps.setString(6, loanType);
        ps.setString(7, loanAmount);
        ps.setString(8, loanTenure);
        ps.setString(9, occupation);
        ps.setInt(10, (termsAccepted != null && termsAccepted.equals("on")) ? 1 : 0); // Set terms_accepted to 1 if checked, else 0

        // Execute the update
        int result = ps.executeUpdate();

        // Check if the insertion was successful
        if(result > 0) {
            out.println("<script>alert('Loan application submitted successfully.'); window.location = 'UserDashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Submission failed. Please try again.'); window.location = 'loanapplicationform.html';</script>");
        }

        // Close the connection
        ps.close();
        con.close();

    } catch (Exception e) {
        e.printStackTrace();
        out.println("<script>alert('An error occurred. Please try again later.'); window.location = 'loanapplicationform.html';</script>");
    }
%>

</body>
</html>
