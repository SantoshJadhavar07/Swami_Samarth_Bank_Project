<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
<%@ page import="javax.servlet.http.*, javax.servlet.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Dashboard</title>
    <link rel="stylesheet" href="UserDashboard.css">
    <link rel="stylesheet" href="responsive.css">
</head>

<body>

    <!-- Header Section -->
    <header>
        <div class="logosec">
            <div class="logo">User Dashboard</div>
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png"
                class="icn menuicn" id="menuicn" alt="menu-icon">
        </div>
        
      <div class="user-info">
        <h2>Welcome, <%= session.getAttribute("username") %>!</h2>
        <p>User ID: <%= session.getAttribute("userId") %></p>
        
    
    <% 
        // Database connection setup to fetch account balance
        String urll = "jdbc:mysql://localhost:3306/bank";
        String userr = "root";
        String passwordd = "";
        Connection con = null;
        Statement stmtt = null;
        ResultSet rsBalance = null;

        try {
            Class.forName("com.mysql.jdbc.Driver");
            con = DriverManager.getConnection(urll, userr, passwordd);
            stmtt = con.createStatement();

            // Query to fetch the account balance for the logged-in user
            String queryBalance = "SELECT account_balance FROM userinfo WHERE uid='" + session.getAttribute("userId") + "'";
            rsBalance = stmtt.executeQuery(queryBalance);

            if (rsBalance.next()) {
                BigDecimal accountBalance = rsBalance.getBigDecimal("account_balance");
                %>
                <div class="account-balance-container">
                    <h5>Account Balance: &#8377;<span class="balance-amount"><%= accountBalance %></span></h5>
                </div>
                <%
            } else {
                %>
                <div class="account-balance-container">
                    <h5>Account Balance: <span class="balance-amount">Not available</span></h5>
                </div>
                <%
            }
        } catch (Exception e) {
            %>
            <div class="account-balance-container">
                <h5>Error fetching account balance: <span class="error-message"><%= e.getMessage() %></span></h5>
            </div>
            <%
        
 
        } finally {
            try {
                if (rsBalance != null) rsBalance.close();
                if (stmtt != null) stmtt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                %>
                <p>Error closing connection: <%= e.getMessage() %></p>
                <%
            }
        }
    %>
    <br>
</div>
    </div>

        <div class="message">
            <div class="circle"></div>
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183322/8.png" class="icn" alt="">
            <div class="dp">
                <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png"
                    class="dpicn" alt="dp">
            </div>
        </div>
    </header>

    <!-- Main Container -->
    <div class="main-container">
        <div class="navcontainer">
            <nav class="nav">
                <div class="nav-upper-options">
                    <div class="nav-option option1">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png"
                            class="nav-img" alt="dashboard">
                        <h3>Dashboard</h3>
                    </div>

                    <div class="nav-option option2">
                        <img src="https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-vector-edit-profile-icon-png-image_758006.jpg"
                            class="nav-img" alt="Profile Update">
                        <h3><a href="userprofileupdatefetch.jsp">Profile Update</a></h3>
                    </div>

                   <div class="nav-option option3">
                      <img src="https://cdn-icons-png.flaticon.com/512/561/561129.png" class="nav-img" alt="Raise Issue"> <!-- Changed image URL -->
                      <h3><a href="raiseissue.jsp">Raise Issue</a></h3>
                  </div>


                    <div class="nav-option option5">
                        <img src="https://cdn-icons-png.flaticon.com/512/3765/3765518.png"
                            class="nav-img" alt="Fixed Deposits">
                        <h3><a href="fixeddepo.html">Fixed Deposits</a></h3>
                    </div>

                    <div class="nav-option option6">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183320/4.png"
                            class="nav-img" alt="Loans">
                        <h3><a href="loanapplicationform.html">Loans – Apply/View</a></h3>
                    </div>

                    <div class="nav-option option7">
                        <img src="https://cdn-icons-png.flaticon.com/512/9462/9462481.png" class="nav-img" alt="Cards">
                        <h3><a href="applyforcards.html">Cards - Activate/Block</a></h3>
                    </div>

                    <div class="nav-option option8">
                        <img src="https://cdn-icons-png.flaticon.com/512/9659/9659193.png" class="nav-img" alt="Payments">
                        <h3><a href="quickpayment.html">Payments</a></h3>
                    </div>

                    <div class="nav-option logout">
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/7.png"
                            class="nav-img" alt="logout">
                        <h3><a href="logout.jsp">Logout</a></h3>
                    </div>
                </div>
            </nav>
        </div>
   <div class="main">
            <!-- User ID Display Section -->


            <div class="searchbar2">
                <input type="text" placeholder="Search">
                <div class="searchbtn">
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png"
                        class="icn srchicn" alt="search-button">
                </div>
            </div>

            <div class="box-container">
                <div class="box box1">
                    <div class="text">
                        <h2 class="topic-heading"><a href="accountopeningform.html">Account Opening Process</a></h2>
                    </div>
                    <img src="https://cdn-icons-png.flaticon.com/512/1055/1055676.png" alt="Account Opening">
                </div>

                <div class="box box2">
                    <div class="text">
                        <h2 class="topic-heading"><a href="applyforcards.html">Credit-Debit Cards</a></h2>
                    </div>
                    <img src="https://png.pngtree.com/png-vector/20200718/ourlarge/pngtree-atm-card-banking-flat-icon-png-image_2307566.jpg"
                        alt="cards">
                </div>

                <div class="box box3">
                    <div class="text">
                        <h2 class="topic-heading"><a href="quickpayment.html">Pay - Quick Transfer</a></h2>
                    </div>
                    <img src="https://cdn-icons-png.flaticon.com/512/9659/9659193.png" alt="Quick Transfer">
                </div>

                <div class="box box4">
                    <div class="text">
                        <h2 class="topic-heading"><a href="loanapplicationform.html">Apply for Loan</a></h2>
                    </div>
                    <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210185029/13.png" alt="Loans">
                </div>
            </div>

            <!-- Transaction History Section -->
         
              
    <!-- Main Content Section -->
   

    <!-- Transaction History Section -->
    <div class="report-container">
        <div class="report-header">
            <h1 class="recent-Articles">Transaction History</h1>
        </div>

        <div class="report-body">
            <table class="transaction-table"  border="1" style="width:100%; border-collapse: collapse;">
        <thead>
            <tr>
                <th>Date</th>
                <th>Transaction Type</th>
                <th>Details</th>
                <th>Amount</th>
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
                    String query = "SELECT * FROM paymentdetails where uid='"+session.getAttribute("userId")+"'"; // Adjust query as needed
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
</div>
</div>
</div>




    <script>
        let menuicn = document.querySelector(".menuicn");
        let nav = document.querySelector(".navcontainer");

        menuicn.addEventListener("click", () => {
            nav.classList.toggle("navclose");
        });
    </script>
</body>
</html>
<<style>
/* Container for user information */
.user-info {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 20px;
    margin: 20px 0;
    font-family: 'Arial', sans-serif; /* Font family set to Arial */
    color: #333; /* General text color */
}

/* Styling for the user name */
.user-info h2 {
    font-size: 24px;
    color: #2e7d32; /* Dark green color for the heading */
    margin: 0;
}

/* Styling for the user ID */
.user-info .user-id {
    font-size: 18px;
    color: #555; /* Gray color for user ID */
    margin: 0;
}

/* Styling for the account balance */
.user-info .account-balance {
    font-weight: bold;
    color: #1565c0; /* Blue color for the account balance */
    font-size: 18px; /* Adjust font size as needed */
}

/* Additional space between elements */
.user-info > * {
    margin: 0 20px; /* Adds space between elements */
}

/* Container for account balance display */
.account-balance-container {
    padding: 0; /* No extra padding needed */
    margin-top: 0; /* No margin needed */
}

/* Heading for account balance */
.account-balance-container h5 {
    font-size: 20px;
    color: #2e7d32; /* Dark green for heading text */
    margin: 0;
}

/* Styling for the balance amount */
.balance-amount {
    font-weight: bold;
    color: #1565c0; /* Blue color for the balance */
    font-size: 22px;
}

/* Error message styling */
.error-message {
    font-weight: bold;
    color: #c62828; /* Red color for error message */
}

/* Navigation bar styling */
nav {
    margin-bottom: 0; /* Ensure no margin below the navigation bar */
    padding-bottom: 10px; /* Optional: Add some padding if needed */
}

</style>
