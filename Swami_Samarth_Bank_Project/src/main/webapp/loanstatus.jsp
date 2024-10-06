<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Application Status</title>
    <link rel="stylesheet" href="styles.css"> <!-- Include your CSS file here -->
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            margin: 0;
            padding: 20px;
        }

        h1 {
            color: #333;
        }

        .container {
            max-width: 800px;
            margin: auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        .status-message {
            padding: 15px;
            background-color: #d4edda;
            color: #155724;
            border: 1px solid #c3e6cb;
            border-radius: 5px;
            margin-bottom: 20px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            border: 1px solid #ddd;
            background-color: #fff;
        }

        table th, table td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }

        table th {
            background-color: #f2f2f2;
            color: #333;
        }

        table tr:hover {
            background-color: #f5f5f5;
        }

        a {
            display: inline-block;
            padding: 10px 20px;
            color: #007bff;
            text-decoration: none;
            border: 1px solid #007bff;
            border-radius: 5px;
            background-color: #fff;
            margin-top: 20px;
            text-align: center;
        }

        a:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Loan Application Status</h1>
        <%
            String aadhaarr = request.getParameter("status_aadhaar");

            if (aadhaarr == null || aadhaarr.isEmpty()) {
                out.println("<div class='status-message'>Please provide an Aadhaar number.</div>");
            } else {
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;

                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver"); // Updated driver class

                    // Establish database connection
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

                    // Create SQL query for selecting the status of the loan application based on Aadhaar number
                    String query = "SELECT * FROM loan_applications WHERE aadhaar = ?";

                    // Create PreparedStatement
                    ps = con.prepareStatement(query);
                    ps.setString(1, aadhaarr);

                    // Execute the query
                    rs = ps.executeQuery();

                    if (rs.next()) {
                        // Display the loan application details
                        %>
                        <div class="status-message">
                            <h2>Application Details</h2>
                        </div>
                        <table>
                            <tr><th>Name</th><td><%= rs.getString("name") %></td></tr>
                            <tr><th>Email</th><td><%= rs.getString("email") %></td></tr>
                            <tr><th>Mobile</th><td><%= rs.getString("mobile") %></td></tr>
                            <tr><th>Address</th><td><%= rs.getString("address") %></td></tr>
                            <tr><th>Aadhaar Number</th><td><%= rs.getString("aadhaar") %></td></tr>
                            <tr><th>Loan Type</th><td><%= rs.getString("loan_type") %></td></tr>
                            <tr><th>Loan Amount</th><td><%= rs.getInt("loan_amount") %></td></tr>
                            <tr><th>Loan Tenure</th><td><%= rs.getInt("loan_tenure") %></td></tr>
                            <tr><th>Occupation</th><td><%= rs.getString("occupation") %></td></tr>
                            <tr><th>Terms Accepted</th><td><%= rs.getBoolean("terms_accepted") ? "Yes" : "No" %></td></tr>
                            <tr><th>Application Date</th><td><%= rs.getTimestamp("application_date") %></td></tr>
                            <tr><th>Status</th><td><%= rs.getString("status") %></td></tr>
                        </table>
                        <%
                    } else {
                        out.println("<div class='status-message'>No application found for the provided Aadhaar number.</div>");
                    }

                } catch (SQLException e) {
                    out.println("<div class='status-message'>SQL Error: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } catch (Exception e) {
                    out.println("<div class='status-message'>An unexpected error occurred: " + e.getMessage() + "</div>");
                    e.printStackTrace();
                } finally {
                    // Close the resources
                    try { if (rs != null) rs.close(); } catch (SQLException e) { /* ignored */ }
                    try { if (ps != null) ps.close(); } catch (SQLException e) { /* ignored */ }
                    try { if (con != null) con.close(); } catch (SQLException e) { /* ignored */ }
                }
            }
        %>
        <a href="loanapplicationform.html">Go Back</a>
    </div>
</body>
</html>
