<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User Account Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>

<div >
    <h2>User Account Information</h2>
    <table border="1px" class="table table-striped table-dark">
        <thead >
            <tr>
                <th>ID</th>
                <th>Full Name</th>
                <th>Father's Name</th>
                <th>Date of Birth</th>
                <th>Aadhaar Number</th>
                <th>PAN Card Number</th>
                <th>Email</th>
                <th>Mobile Number</th>
                <th>Address</th>
                <th>Account Type</th>
                <th>Occupation</th>
                <th>Services</th>
                <th>Additional Services</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve user account information
                String query = "SELECT * FROM useraccountinfo";
                
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                // Iterate through the result set and display data in the table
                while (rs.next()) {
                    int id = rs.getInt("accoundid");
                    String fullName = rs.getString("fullname");
                    String fatherName = rs.getString("fathername");
                    String dob = rs.getString("dob");
                    String aadhaar = rs.getString("adharno");
                    String pan = rs.getString("pancardno");
                    String email = rs.getString("email");
                    String mobile = rs.getString("mobileno");
                    String address = rs.getString("address");
                    String accountType = rs.getString("accounttype");
                    String occupation = rs.getString("occupation");
                    String services = rs.getString("services");
                    String additionalServices = rs.getString("additionalser");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= fullName %></td>
                <td><%= fatherName %></td>
                <td><%= dob %></td>
                <td><%= aadhaar %></td>
                <td><%= pan %></td>
                <td><%= email %></td>
                <td><%= mobile %></td>
                <td><%= address %></td>
                <td><%= accountType %></td>
                <td><%= occupation %></td>
                <td><%= services %></td>
                <td><%= additionalServices %></td>
                <td class="action-buttons">
                    <form action="editUserAccount.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="btn btn-info btn-sm">Update</button>
                    </form>
                        <form action="DeleteAccount.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                    </form>
                    
                </td>
            </tr>
            <% 
                }
                
                // Close resources
                rs.close();
                stmt.close();
                con.close();
            %>
        </tbody>
    </table>
</div>

</body>
</html>
