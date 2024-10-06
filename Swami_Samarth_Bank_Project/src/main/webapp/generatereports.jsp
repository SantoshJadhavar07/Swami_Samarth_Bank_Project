<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Generate User Reports</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.14.3/dist/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.1.3/dist/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>
    

</head>
<body>

<h1>User Transaction Reports</h1>

 <table border="1px" class="table table-striped table-dark">
        <thead>
            <tr>
                <th>Date</th>
                <th>Transaction Type</th>
                <th>Details</th>
                <th>Amount</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <%
                // Database connection setup
                String url = "jdbc:mysql://localhost:3306/bank";
                String user = "root";
                String password = "";
                Connection conn = null;
                Statement stmt = null;
                ResultSet rs = null;

                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = DriverManager.getConnection(url, user, password);
                    stmt = conn.createStatement();
                    String query = "SELECT * FROM paymentdetails"; // Adjust query as needed
                    rs = stmt.executeQuery(query);

                    boolean dataFound = false; // Flag to check if any data is retrieved

                    while (rs.next()) {
                        dataFound = true; // Set flag to true if data is found

                        // Quick Transfer
                        BigDecimal transferAmount = rs.getBigDecimal("transfer_amount");
                        if (transferAmount != null) {
                            String transferDate = rs.getString("transfer_date");
                            String transferType = rs.getString("payment_type");
                            String transferAccount = rs.getString("transfer_account");
                            String cardNumber = rs.getString("card_number");
                            %>
                            <tr>
                                <td><%= transferDate %></td>
                                <td>Transfer</td>
                                <td>Account: <%= transferAccount %>, Card: <%= cardNumber %></td>
                                <td>&#8377;<%= transferAmount %></td>
                                 <td>
                                    <!-- Button or Action for Completion -->
                                    <form action="completeTransaction.jsp" method="post">
                                    
                                        <button type="submit" class="btn btn-success">Completed</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                        }

                        // Mobile Recharge
                        BigDecimal rechargeAmount = rs.getBigDecimal("recharge_amount");
                        if (rechargeAmount != null) {
                            String rechargeDate = rs.getString("recharge_date");
                            String mobileNumber = rs.getString("mobile_number");
                            %>
                            <tr>
                                <td><%= rechargeDate %></td>
                                <td>Mobile Recharge</td>
                                <td>Mobile Number: <%= mobileNumber %></td>
                                <td>&#8377;<%= rechargeAmount %></td>
                                 <td>
                                    <!-- Button or Action for Completion -->
                                    <form action="completeTransaction.jsp" method="post">
                                    
                                        <button type="submit" class="btn btn-success">Completed</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                        }

                        // Electricity Bill Payment
                        BigDecimal electricityAmount = rs.getBigDecimal("electricity_amount");
                        if (electricityAmount != null) {
                            String electricityBillDate = rs.getString("electricity_bill_date");
                            String meterNumber = rs.getString("meter_number");
                            %>
                            <tr>
                                <td><%= electricityBillDate %></td>
                                <td>Electricity Bill</td>
                                <td>Meter Number: <%= meterNumber %></td>
                                <td>&#8377;<%= electricityAmount %></td>
                                 <td>
                                    <!-- Button or Action for Completion -->
                                    <form action="completeTransaction.jsp" method="post">
                                    
                                        <button type="submit" class="btn btn-success">Completed</button>
                                    </form>
                                </td>
                            </tr>
                            <%
                        }
                    }

                    if (!dataFound) {
                        %>
                        <tr>
                            <td colspan="4">No transactions found</td>
                        </tr>
                        <%
                    }
                } catch (Exception e) {
                    %>
                    <tr>
                        <td colspan="4">Error fetching data: <%= e.getMessage() %></td>
                    </tr>
                    <%
                } finally {
                    // Clean up resources
                    try {
                        if (rs != null) rs.close();
                        if (stmt != null) stmt.close();
                        if (conn != null) conn.close();
                    } catch (SQLException e) {
                        %>
                        <tr>
                            <td colspan="4">Cleanup Error: <%= e.getMessage() %></td>
                        </tr>
                        <%
                    }
                }
            %>
        </tbody>
    </table>
</div>
</body>
</html>
