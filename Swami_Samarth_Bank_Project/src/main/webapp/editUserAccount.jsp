<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit User Account</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        @import url('https://fonts.googleapis.com/css2?family=PT+Serif&family=Roboto+Serif:wght@100&display=swap');

        :root {
          --color-white: #000000;
          --color-darkgreen: #FF00FF;
          --color-darkgreen-alpha: rgba(31, 94, 9, 0.84);
          --color-green: rgba(223, 76, 27, 1);
        }

        *,
        *::before,
        *::after {
          box-sizing: border-box;
        }

        body {
          font-family: 'PT Serif', 'Roboto Serif', serif;
          font-size: 1rem;
          font-weight: 400;
          line-height: 1;
          color: var(--color-white);
          margin: 0;
        }

        body::before {
          content: '';
          position: fixed;
          top: 0;
          left: 0;
          height: 100%;
          width: 100%;
          z-index: -1;
          background: var(--color-darkgreen);
          background-image: linear-gradient(
              115deg,
              rgba(115, 219, 78, 0.84),
              rgba(99, 208, 99, 0.84)
            ),
            url(https://media.istockphoto.com/photos/bank-building-picture-id640267784?k=20&m=640267784&s=612x612&w=0&h=3j1dH5Ty9qAq69ciYra7oBOn4C3zxyzMCgg2Hdo8ang=);
          background-size: cover;
          background-repeat: no-repeat;
          background-position: center;
        }

        h2 {
          font-weight: 400;
          line-height: 1.2;
          text-align: center;
          margin-bottom: 2rem;
        }

        .container {
          width: 100%;
          margin: 3.125rem auto 0 auto;
        }

        @media (min-width: 576px) {
          .container {
            max-width: 540px;
          }
        }

        @media (min-width: 768px) {
          .container {
            max-width: 720px;
          }
        }

        form {
          background: var(--color-darkgreen-alpha);
          padding: 2.5rem;
          border-radius: 0.25rem;
        }

        .form-group {
          margin: 0 auto 1.25rem auto;
          padding: 0.25rem;
        }

        .form-control {
          display: block;
          width: 100%;
          height: 2.375rem;
          padding: 0.375rem 0.75rem;
          color: #495057;
          background-color: #fff;
          background-clip: padding-box;
          border: 1px solid #ced4da;
          border-radius: 0.25rem;
          transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-control:focus {
          border-color: #80bdff;
          outline: 0;
          box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
        }

        .btn-primary {
          background-color: var(--color-green);
          border-color: var(--color-green);
        }

        .btn-primary:hover {
          background-color: #0056b3;
          border-color: #004085;
        }

        .text-center {
          text-align: center;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>Edit User Account</h2>
    <form action="updateUserAccount.jsp" method="post">
        <% 
            String id = request.getParameter("id");
            if (id != null && !id.isEmpty()) {
                try {
                    // Load MySQL JDBC driver
                    Class.forName("com.mysql.jdbc.Driver");
                    
                    // Establish connection to the database
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
                    
                    // Query to retrieve user account information
                    String query = "SELECT * FROM useraccountinfo WHERE accoundid = ?";
                    PreparedStatement pstmt = con.prepareStatement(query);
                    pstmt.setInt(1, Integer.parseInt(id));
                    
                    ResultSet rs = pstmt.executeQuery();
                    if (rs.next()) {
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
                    <div class="form-group">
                        <input type="hidden" name="id" value="<%= id %>">
                        <label for="fullName">Full Name:</label>
                        <input type="text" class="form-control" id="fullName" name="fullName" value="<%= fullName %>" required>
                    </div>
                    <div class="form-group">
                        <label for="fatherName">Father's Name:</label>
                        <input type="text" class="form-control" id="fatherName" name="fatherName" value="<%= fatherName %>" required>
                    </div>
                    <div class="form-group">
                        <label for="dob">Date of Birth:</label>
                        <input type="date" class="form-control" id="dob" name="dob" value="<%= dob %>" required>
                    </div>
                    <div class="form-group">
                        <label for="aadhaar">Aadhaar Number:</label>
                        <input type="text" class="form-control" id="aadhaar" name="aadhaar" value="<%= aadhaar %>" required>
                    </div>
                    <div class="form-group">
                        <label for="pan">PAN Card Number:</label>
                        <input type="text" class="form-control" id="pan" name="pan" value="<%= pan %>" required>
                    </div>
                    <div class="form-group">
                        <label for="email">Email:</label>
                        <input type="email" class="form-control" id="email" name="email" value="<%= email %>" required>
                    </div>
                    <div class="form-group">
                        <label for="mobile">Mobile Number:</label>
                        <input type="text" class="form-control" id="mobile" name="mobile" value="<%= mobile %>" required>
                    </div>
                    <div class="form-group">
                        <label for="address">Address:</label>
                        <textarea class="form-control" id="address" name="address" required><%= address %></textarea>
                    </div>
                    <div class="form-group">
                        <label for="accountType">Account Type:</label>
                        <input type="text" class="form-control" id="accountType" name="accountType" value="<%= accountType %>" required>
                    </div>
                    <div class="form-group">
                        <label for="occupation">Occupation:</label>
                        <input type="text" class="form-control" id="occupation" name="occupation" value="<%= occupation %>" required>
                    </div>
                    <div class="form-group">
                        <label for="services">Services:</label>
                        <input type="text" class="form-control" id="services" name="services" value="<%= services %>" required>
                    </div>
                    <div class="form-group">
                        <label for="additionalServices">Additional Services:</label>
                        <input type="text" class="form-control" id="additionalServices" name="additionalServices" value="<%= additionalServices %>" required>
                    </div>
                    <button type="submit" class="btn btn-primary">Update</button>
                    <% 
                    } else {
                    %>
                    <script>
                        alert('User not found.');
                        window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
                    </script>
                    <% 
                    }
                    pstmt.close();
                    con.close();
                } catch (Exception e) {
                    e.printStackTrace();
                    %>
                    <script>
                        alert('Error: <%= e.getMessage() %>');
                        window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
                    </script>
                    <% 
                }
            } else {
            %>
            <script>
                alert('Invalid ID.');
                window.location.href = 'AdminDashboard.jsp';  // Redirect back to user account information page
            </script>
            <% 
            }
            %>
    </form>
</div>
</body>
</html>
