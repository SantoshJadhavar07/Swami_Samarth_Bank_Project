<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Fixed Deposit Applications</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    
</head>
<body>

<div >
    <h2>Fixed Deposit Applications</h2>
    <table border="1px" class="table table-striped table-dark">
        <thead>
            <tr>
                <th>ID</th>
                <th>Deposit Amount</th>
                <th>Deposit Tenure</th>
                <th>Interest Rate</th>
                <th>Deposit Date</th>
                <th>Maturity Date</th>
                <th>Account Number</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve fixed deposit applications
                String query = "SELECT * FROM fixed_deposit_applications";
                
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                // Iterate through the result set and display data in the table
                while (rs.next()) {
                    int id = rs.getInt("id");
                    BigDecimal depositAmount = rs.getBigDecimal("deposit_amount");
                    int depositTenure = rs.getInt("deposit_tenure");
                    BigDecimal interestRate = rs.getBigDecimal("interest_rate");
                    Date depositDate = rs.getDate("deposit_date");
                    Date maturityDate = rs.getDate("maturity_date");
                    String accountNumber = rs.getString("account_number");
                    String status = rs.getString("status");
            %>
            <tr>
                <td><%= id %></td>
                <td><%= depositAmount %></td>
                <td><%= depositTenure %></td>
                <td><%= interestRate %></td>
                <td><%= depositDate %></td>
                <td><%= maturityDate %></td>
                <td><%= accountNumber %></td>
                <td><%= status %></td>
                <td class="action-buttons">
                    <form action="approveFixedDeposit.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="btn btn-success btn-sm">Approve</button>
                    </form>
                    <form action="RejectFixedDeposit.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="id" value="<%= id %>">
                        <button type="submit" class="btn btn-danger btn-sm">Reject</button>
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
