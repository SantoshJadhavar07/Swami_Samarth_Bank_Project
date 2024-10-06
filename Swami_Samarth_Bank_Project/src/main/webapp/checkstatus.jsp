<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Application Status</title>
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
        }

        a:hover {
            background-color: #007bff;
            color: #fff;
        }
    </style>
    <script type="text/javascript">
        function showAlert(message) {
            alert(message);
        }
    </script>
</head>
<body>
    <h1>Application Status</h1>
    <%
        String userIdStr = request.getParameter("userId");
        if (userIdStr == null || userIdStr.isEmpty()) {
            out.println("<script>showAlert('Please provide a User ID.');</script>");
        } else {
            try {
                int userId = Integer.parseInt(userIdStr);

                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

                String query = "SELECT * FROM useraccountinfo WHERE accoundid = ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1, userId);
                ResultSet rs = ps.executeQuery();

                if (rs.next()) {
                    String accountStatus = rs.getString("status"); // Assuming 'status' field exists

                    %>
                    <div class="status-message">
                        <h2>Your account is <%= accountStatus.equalsIgnoreCase("active") ? "active" : "not active" %></h2>
                    </div>
                    <h2>Application Details</h2>
                    <table>
                        <tr><th>Full Name</th><td><%= rs.getString("fullname") %></td></tr>
                        <tr><th>Father's Name</th><td><%= rs.getString("fathername") %></td></tr>
                        <tr><th>Date of Birth</th><td><%= rs.getString("dob") %></td></tr>
                        <tr><th>Aadhaar Number</th><td><%= rs.getString("adharno") %></td></tr>
                        <tr><th>PAN Card Number</th><td><%= rs.getString("pancardno") %></td></tr>
                        <tr><th>Email</th><td><%= rs.getString("email") %></td></tr>
                        <tr><th>Mobile Number</th><td><%= rs.getString("mobileno") %></td></tr>
                        <tr><th>Address</th><td><%= rs.getString("address") %></td></tr>
                        <tr><th>Account Type</th><td><%= rs.getString("accounttype") %></td></tr>
                        <tr><th>Occupation</th><td><%= rs.getString("occupation") %></td></tr>
                        <tr><th>Services</th><td><%= rs.getString("services") %></td></tr>
                        <tr><th>Additional Services</th><td><%= rs.getString("additionalser") %></td></tr>
                    </table>
                    <%
                } else {
                    out.println("<script>showAlert('No application found with this User ID.');</script>");
                }

                rs.close();
                ps.close();
                con.close();
            } catch (Exception e) {
                e.printStackTrace();
                out.println("<script>showAlert('An error occurred. Please try again later.');</script>");
            }
        }
    %>
    <a href="accountopeningform.html">Go Back</a>
</body>
</html>
