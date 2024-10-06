<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fixed Deposit Submission</title>
</head>
<body>

<%
    String depositAmount = request.getParameter("depositAmount");
    String depositTenure = request.getParameter("depositTenure");
    String interestRate = request.getParameter("interestRate");
    String depositDate = request.getParameter("depositDate");
    String maturityDate = request.getParameter("maturityDate");
    String accountNumber = request.getParameter("accountNumber");

    try {
        // Load MySQL driver
        Class.forName("com.mysql.jdbc.Driver");
        // Establish connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

        // Prepare SQL statement
        String query = "INSERT INTO fixed_deposit_applications (deposit_amount, deposit_tenure, interest_rate, deposit_date, maturity_date, account_number) VALUES (?, ?, ?, ?, ?, ?)";
        PreparedStatement ps = con.prepareStatement(query);

        // Set parameters
        ps.setBigDecimal(1, new java.math.BigDecimal(depositAmount));
        ps.setInt(2, Integer.parseInt(depositTenure));
        ps.setBigDecimal(3, new java.math.BigDecimal(interestRate));
        ps.setDate(4, java.sql.Date.valueOf(depositDate));
        ps.setDate(5, java.sql.Date.valueOf(maturityDate));
        ps.setString(6, accountNumber);

        // Execute update
        int result = ps.executeUpdate();

        if (result > 0) {
            out.println("<script>alert('Fixed deposit application submitted successfully.'); window.location = 'UserDashboard.jsp';</script>");
        } else {
            out.println("<script>alert('Submission failed. Please try again.'); window.location = 'fixeddepo.html';</script>");
        }

        // Close the connection
        ps.close();
        con.close();
    } catch (Exception e) {
        out.println("Error: " + e.getMessage());
    }
%>

</body>
</html>
