<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.math.BigDecimal" %>
    <!DOCTYPE html>
    <html lang="en">
    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport"  content="width=device-width,  initial-scale=1.0">
        <title>AdminDashboard</title>
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
        <link rel="stylesheet" href="./Admin1.css">
        <link rel="stylesheet"  href="responsive.css">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
        <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    </head> 
    <body>
        <!-- for header part -->
    <header>

        <div class="logosec">
            <div class="logo">Welcome to SSSB </div>
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182541/Untitled-design-(30).png"
                class="icn menuicn" id="menuicn"  alt="menu-icon">
        </div>

        <div class="searchbar">
            <input type="text" 
                   placeholder="Search">
            <div class="searchbtn">
              <!-- <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png" class="icn srchicn" alt="search-icon"> -->
              </div>
        </div>

        <div class="message">
            <div class="circle"></div>
                <p>180 340 9400(toll free) |</p> 
               <p> 022 780 091091(chargebale number) 24*7 | </p>
                <p>Swamisamarth@bank.com </p>
               
            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183322/8.png"  class="icn"  alt="">
            <div class="dp">
              <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180014/profile-removebg-preview.png"class="dpicn"  alt="dp">
              </div>
        </div>
    </header>
    
    <!-- sidebar -->
        <div class="main-container">
            <div class="navcontainer">
                <nav class="nav">
                    <div class="nav-upper-options">
                        <div class="nav-option option1">
                            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210182148/Untitled-design-(29).png" class="nav-img"  alt="dashboard">
                            <h3>Home</h3>
                        </div>
    
                        <div class="option2 nav-option">
                            <img src= "https://png.pngtree.com/png-vector/20190307/ourmid/pngtree-vector-edit-profile-icon-png-image_758006.jpg" class="nav-img"  alt="Profile Update">
                            <h4><a href="adminprofileupdate.jsp">Profile Update</a>  </h4>
                        </div>
    
                        <div class="nav-option option3">
                            <img src="https://cdn-icons-png.flaticon.com/512/9306/9306788.png"class="nav-img" alt="Transaction">
                            <h4><a href="admindepositemoney.jsp">Deposite Money</a></h4>
                        </div>
    
                        <div class="nav-option option4">
                            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCzxivJXCZk0Kk8HsHujTO3Olx0ngytPrWw&s" class="nav-img" alt="Reset password">
                                <h4><a href="usermanage.jsp">User Manage</a>  </h4>
                        </div>
    
                        <div class="nav-option option5" >
                            <img src="https://cdn.iconscout.com/icon/premium/png-256-thumb/fixed-deposit-3765518-3140325.png" class="nav-img"  alt="Fixed Deposits">
                                <h4><a href="adminfixeddepo.jsp">Fixed Deposits</a></h4>
                        </div>
    
                        <div class="nav-option option6">
                            <img src="https://thumbs.dreamstime.com/z/money-bag-16262524.jpg" class="nav-img"alt="settings">
                            <h4><a href="adminloanmanagement.jsp">Loan Management</a></h4>
                        </div>
    
                        <div class="nav-option logout">
                            <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210183321/7.png"  class="nav-img" alt="logout">
                            <h4><a href="adminlogout.jsp">Logout</a></h4>
                        </div>
                    </div>
                </nav>
            </div>
            <div class="main">
                <div class="searchbar2">
                    <input type="text"   name="serach" id="search"    placeholder="Search">
                    <div class="searchbtn">
                      <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210180758/Untitled-design-(28).png"class="icn srchicn"  alt="search-button">
                            
                      </div>
                </div>
    
                <!-- box coantiner -->
                <div class="box-container">
                    <div class="box box1">
                        <div class="text">
                            <h2 class="topic-heading"><a  href="adminprofileupdate.jsp"> Profile Update</a></h2>
                            
                        </div>
    
                        <img src="https://media.geeksforgeeks.org/wp-content/uploads/20221210184645/Untitled-design-(31).png"
                            alt="Views">
                    </div>
    
                    <div class="box box2">
                        <div class="text">
                            <h2 class="topic-heading"><a  href="admindepositemoney.jsp"> Deposite Money</a></h2>
                            <!-- <h2 class="topic">Likes</h2> -->
                        </div>
    
                        <img src="https://png.pngtree.com/png-vector/20200718/ourlarge/pngtree-atm-card-banking-flat-icon-png-image_2307566.jpg" 
                             alt="likes">
                    </div>
    
                    <div class="box box3">
                        <div class="text">
                            <h2 class="topic-heading"><a  href="usermanage.jsp"> User Manage</a></h2>
                        </div>
    
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRFCzxivJXCZk0Kk8HsHujTO3Olx0ngytPrWw&s"
                            alt="comments">
                    </div>
    
                    <div class="box box4">
                        <div class="text">
                            <h2 class="topic-heading"><a  href="generatereports.jsp"> Generate Report</a></h2>
                            
                        </div>
    
                        <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQk-2a-xjkE5iz5stSGPip31vn5TE8RUNGhRA&s" alt="published">
                    </div>
                </div>
      <br>
      <br>

      <!-- tables -->
<div class="container">
    <h2>Loan Section</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Loan Amount</th>
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
                
                // Query to retrieve loan applications
                String query = "SELECT id, name, email, loan_amount, status FROM loan_applications";
                Statement stmt = con.createStatement();
                ResultSet rs = stmt.executeQuery(query);
                
                // Iterate through the result set and display data in the table
                while (rs.next()) {
                    int customerId = rs.getInt("id");
                    String name = rs.getString("name");
                    String email = rs.getString("email");
                    String accountNumber = rs.getString("loan_amount");
                    String status = rs.getString("status");
            %>
                <tr>
                    <td><%= customerId %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= accountNumber %></td>
                    <td><%= status %></td>
                    <td class="action-buttons">
                        <form action="approveLoan.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="customerId" value="<%= customerId %>">
                            <button type="submit" class="btn btn-success btn-sm">Approve</button>
                        </form>
                        <form action="rejectLoan.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="customerId" value="<%= customerId %>">
                            <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                        </form>
                    </td>
                </tr>
            <% 
                }
                
                // Close the connections
                rs.close();
                stmt.close();
                con.close();
            %>
        </tbody>
    </table>
</div>
<br>
<br>

<div class="container">
    <h2 >Cards Section</h2>
    <table >
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Date</th>
                <th>Card_action_Type</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve card applications
                String query1 = "SELECT id, full_name, created_at, card_action_type, status FROM card_applications";
                Statement stmt1 = conn.createStatement();
                ResultSet rs1 = stmt1.executeQuery(query1);
                
                // Iterate through the result set and display data in the table
                while (rs1.next()) {
                    int customerId = rs1.getInt("id");
                    String name = rs1.getString("full_name");
                    String email = rs1.getString("created_at");
                    String accountNumber = rs1.getString("card_action_type");
                    String status = rs1.getString("status");
            %>
                <tr>
                    <td><%= customerId %></td>
                    <td><%= name %></td>
                    <td><%= email %></td>
                    <td><%= accountNumber %></td>
                    <td><%= status %></td>
                    
                    <td>
                        <div class="action-buttons">
                            <form action="approveCard.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="customerId" value="<%= customerId %>">
                                <button type="submit" class="btn btn-success btn-sm">Approve</button>
                            </form>
                            <form action="rejectCard.jsp" method="post" style="display:inline;">
                                <input type="hidden" name="customerId" value="<%= customerId %>">
                                <button type="submit" class="btn btn-danger btn-sm">Reject</button>
                            </form>
                        </div>
                    </td>
                </tr>
            <% 
                }
                
                // Close the connections
                rs.close();
                stmt.close();
                con.close();
            %>
        </tbody>
    </table>
</div>

<br>
<br>

<div class="container">
    <h2>Fixed Deposit Applications</h2>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>ID</th>
                <th>Deposit Amount</th>
                <th>Deposit Tenure</th>
                <th>Interest Rate</th>
                <th>Deposit Date</th>
                <th>Maturity Date</th>
                <th>Account Number</th>
                <th>status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection con4 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve fixed deposit applications
                String query4 = "SELECT * FROM fixed_deposit_applications";
                
                Statement stmt4 = con4.createStatement();
                ResultSet rs4 = stmt4.executeQuery(query4);
                
                // Iterate through the result set and display data in the table
                while (rs4.next()) {
                    int id = rs4.getInt("id");
                    BigDecimal depositAmount = rs4.getBigDecimal("deposit_amount");
                    int depositTenure = rs4.getInt("deposit_tenure");
                    BigDecimal interestRate = rs4.getBigDecimal("interest_rate");
                    Date depositDate = rs4.getDate("deposit_date");
                    Date maturityDate = rs4.getDate("maturity_date");
                    String accountNumber = rs4.getString("account_number");
                    String status = rs4.getString("status");
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

<div class="container">
    <h2>User Section</h2>
    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>Account Number</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection con2 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve data from useraccountinfo
                String query2 = "SELECT accoundid, fullname, email, account_number FROM useraccountinfo";
                
                Statement stmt2 = con2.createStatement();
                ResultSet rs2 = stmt2.executeQuery(query2);
                
                // Iterate through the result set and display data in the table
                while (rs2.next()) {
                    int customerId = rs2.getInt("accoundid");
                    String name = rs2.getString("fullname");
                    String email = rs2.getString("email");
                    long accountNumber = rs2.getLong("account_number");// Assuming 'account_number' is the correct column name
            %>
            <tr>
                <td><%= customerId %></td>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= accountNumber %></td>
                <td>
                    <div class="action-buttons">
                        <form action="editUserAccount.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= customerId %>">
                            <button type="submit" class="btn btn-success btn-sm">Update</button>
                        </form>
                        <form action="DeleteAccount.jsp" method="post" style="display:inline;">
                            <input type="hidden" name="id" value="<%= customerId %>">
                            <button type="submit" class="btn btn-danger btn-sm">Delete</button>
                        </form>
                    </div>
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

<br>
<br>

<div class="container">
    <h2>Response to User</h2>
    <table>
        <thead>
            <tr>
                <th>Customer ID</th>
                <th>Name</th>
                <th>Email</th>
                <th>User Massage</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
        </thead>
        <tbody>
            <% 
                // Load MySQL JDBC driver
                Class.forName("com.mysql.jdbc.Driver");
                
                // Establish database connection
                Connection con3 = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                
                // Query to retrieve data from usermsg
                String query3 = "SELECT umsgid, ufullName, uemail, umsg, status FROM usermsg";
                
                Statement stmt3 = con3.createStatement();
                ResultSet rs3 = stmt3.executeQuery(query3);
                
                // Iterate through the result set and display data in the table
                while (rs3.next()) {
                    int customerId = rs3.getInt("umsgid");
                    String name = rs3.getString("ufullName");
                    String email = rs3.getString("uemail");
                    String accountNumber = rs3.getString("umsg"); // Use getLong for bigint
                    String status = rs3.getString("status");
            %>
            <tr>
                <td><%= customerId %></td>
                <td><%= name %></td>
                <td><%= email %></td>
                <td><%= accountNumber %></td>
                <td><%= status %></td>
                <td>
                    <!-- Example action buttons -->
                    <form action="responseMessage.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="customerId" value="<%= customerId %>">
                        <button type="submit" class="btn btn-success btn-sm">Response</button>
                    </form>
                    <form action="deleteMessage.jsp" method="post" style="display:inline;">
                        <input type="hidden" name="customerId" value="<%= customerId %>">
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

 

</div>
</div>


            
    
    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
   
    
        <script src="./Admin1.js"></script>
</body>
</html>
      <style>
        table {
            width: 100%;
            border-collapse: collapse;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
        .action-buttons form {
            display: inline;
        }
    </style>
    
  
  