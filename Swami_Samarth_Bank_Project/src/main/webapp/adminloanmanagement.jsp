<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Loan Applications</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    
    
</head>
<body>

<div>
    <h2>Loan Applications</h2>
    <table  border="1px" class="table table-striped table-dark">
        <thead>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Address</th>
                <th>Aadhaar</th>
                <th>Loan Type</th>
                <th>Loan Amount</th>
                <th>Loan Tenure</th>
                <th>Occupation</th>
                <th>Terms Accepted</th>
                <th>Application Date</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve loan applications
                String query = "SELECT * FROM loan_applications";
                
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                // Iterate through the result set and display data in the table
                while (rs.next()) {
                    int id = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String mobile = rs.getString("mobile");
                    String address = rs.getString("address");
                    String aadhaar = rs.getString("aadhaar");
                    String loanType = rs.getString("loan_type");
                    BigDecimal loanAmount = rs.getBigDecimal("loan_amount");
                    int loanTenure = rs.getInt("loan_tenure");
                    String occupation = rs.getString("occupation");
                    boolean termsAccepted = rs.getBoolean("terms_accepted");
                    Timestamp applicationDate = rs.getTimestamp("application_date");
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= mobile %></td>
                <td><%= address %></td>
                <td><%= aadhaar %></td>
                <td><%= loanType %></td>
                <td><%= loanAmount %></td>
                <td><%= loanTenure %></td>
                <td><%= occupation %></td>
                <td><%= termsAccepted ? "Yes" : "No" %></td>
                <td><%= applicationDate %></td>
                <td><%= status %></td>
                <td class="action-buttons">
                    <form action="approveLoan.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="customerId" value="<%= id %>">
                        <button type="submit" class="btn btn-success btn-sm">Approve</button>
                    </form>
                    <form action="rejectLoan" method="post" style="display:inline;">
                        <input type="hidden" name="customerId" value="<%= id %>">
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
