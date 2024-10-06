<%@ page import="java.sql.*" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Processing Deposit</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
        }
        .container {
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        .alert {
            margin-top: 20px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Deposit Processing</h2>

    <%
        // Database connection settings
        String jdbcURL = "jdbc:mysql://localhost:3306/bank";
        String dbUser = "root";
        String dbPassword = "";

        // Get form parameters
        String customerId = request.getParameter("customerid");
        String accountNumber = request.getParameter("accountNumber");
        String depositAmountStr = request.getParameter("amount");
        double depositAmount = Double.parseDouble(depositAmountStr); // Convert deposit amount to integer

        Connection connection = null;
        PreparedStatement psSelect = null;
        PreparedStatement psUpdate = null;
        ResultSet resultSet = null;

        try {
            // Load JDBC driver
            Class.forName("com.mysql.jdbc.Driver");

            // Establish connection
            connection = DriverManager.getConnection(jdbcURL, dbUser, dbPassword);

            // Check if the user exists and get the current account balance
            String sqlSelect = "SELECT CAST(account_balance AS DOUBLE) AS account_balance FROM userinfo WHERE uid = ?";
            psSelect = connection.prepareStatement(sqlSelect);
            psSelect.setString(1, customerId);
           
            resultSet = psSelect.executeQuery();

            if (resultSet.next()) {
            	 double currentBalance = resultSet.getDouble("account_balance");

                 // Calculate the new balance
                 double newBalance = currentBalance + depositAmount;

                // Update the account balance
                String sqlUpdate = "UPDATE userinfo SET account_balance = ? WHERE uid = ?";
                psUpdate = connection.prepareStatement(sqlUpdate);
                psUpdate.setDouble(1, newBalance);
                psUpdate.setString(2, customerId);
                

                int rowsUpdated = psUpdate.executeUpdate();

                if (rowsUpdated > 0) {
                    // Use JavaScript alert dialog for success message with the new balance
    %>
                    <script>
                        alert("Deposit successful! Your new balance is: <%= newBalance %>");
                        window.location.href = "AdminDashboard.jsp"; // Redirect to the dashboard or any other page
                    </script>
    <%
                } else {
                    // Use JavaScript alert dialog for failure message
    %>
                    <script>
                        alert("Deposit failed! Please try again.");
                        window.history.back(); // Redirect back to the previous page
                    </script>
    <%
                }
            } else {
                // User not found, show alert
    %>
                <script>
                    alert("User or account not found! Please check the details and try again.");
                    window.history.back(); // Redirect back to the previous page
                </script>
    <%
            }
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            out.println("<div class='alert alert-danger'>Error: " + e.getMessage() + "</div>");
        } finally {
            // Close resources
            if (resultSet != null) try { resultSet.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (psSelect != null) try { psSelect.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (psUpdate != null) try { psUpdate.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</div>

</body>
</html>
