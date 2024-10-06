<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin Information</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
     <style>
        :root {
            --color-white: #000000;
            --color-darkgreen: #FF00FF;
            --color-darkgreen-alpha: rgba(31, 94, 9, 0.84);
            --color-green: rgba(223, 76, 27, 1);
        }

        * {
            box-sizing: border-box;
        }

        body {
            font-family: 'PT Serif', 'Roboto Serif', serif;
            font-size: 1rem;
            font-weight: 400;
            line-height: 1;
            color: var(--color-white);
            margin: 0;
            background: var(--color-darkgreen);
            background-image: linear-gradient(
                115deg,
                rgba(115, 219, 78, 0.84),
                rgba(99, 208, 99, 0.84)
            ), url('https://media.istockphoto.com/photos/bank-building-picture-id640267784?k=20&m=640267784&s=612x612&w=0&h=3j1dH5Ty9qAq69ciYra7oBOn4C3zxyzMCgg2Hdo8ang=');
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
        }

        .container {
            max-width: 800px;
            margin: 3.125rem auto;
            padding: 1.25rem;
            background: var(--color-darkgreen-alpha);
            border-radius: 0.25rem;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
        }

        h2 {
            font-weight: 400;
            line-height: 1.2;
            text-align: center;
            margin-top: 0;
            margin-bottom: 0.5rem;
            color: var(--color-white);
        }

        .form-group {
            margin-bottom: 1.25rem;
        }

        label {
            display: block;
            font-size: 1.125rem;
            margin-bottom: 0.5rem;
            color: var(--color-white);
        }

        .form-control {
            width: 100%;
            padding: 0.375rem 0.75rem;
            border: 1px solid #ced4da;
            border-radius: 0.25rem;
            background-color: #fff;
            color: #495057;
            transition: border-color 0.15s ease-in-out, box-shadow 0.15s ease-in-out;
        }

        .form-control:focus {
            border-color: #80bdff;
            box-shadow: 0 0 0 0.2rem rgba(38, 143, 255, 0.25);
            outline: 0;
        }

        .submit-button {
            display: block;
            width: 100%;
            padding: 0.625rem;
            margin-top: 1.25rem;
            font-size: 1.125rem;
            font-weight: 600;
            color: #fff;
            background-color: var(--color-darkgreen);
            border: 1px solid var(--color-darkgreen);
            border-radius: 0.25rem;
            cursor: pointer;
            transition: background-color 0.3s, border-color 0.3s;
        }

        .submit-button:hover {
            background-color: var(--color-green);
            border-color: var(--color-green);
        }

        .form-group img {
            margin-top: 10px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.2);
        }
    </style>
</head>
<body>

<div class="container mt-4">
    <h2>Admin Information</h2>
    <% 
        // Get the admin ID from the request parameter
        
         int a=2;
        // Load MySQL JDBC driver
        Class.forName("com.mysql.jdbc.Driver");
        
        // Establish database connection
        Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
        
        // Query to retrieve admin information
        String query = "SELECT * FROM admininfo WHERE adid ='"+a+"'";
        PreparedStatement ps = con.prepareStatement(query);
        
        ResultSet rs = ps.executeQuery();

        if (rs.next()) {
            String adName = rs.getString("adname");
            String adEmail = rs.getString("ademail");
            String adUsername = rs.getString("adusername");
            String adPassword = rs.getString("adpassword");
            String adPhoneNo = rs.getString("adphoneno");
           
    %>
    <div class="container mt-3">
    <a href="AdminDashboard.jsp" class="btn btn-secondary">Back to Dashboard</a>
  </div>
    <form action="adminprofileup.jsp" method="post" enctype="multipart/form-data">
        <input type="hidden" name="adid" >
        <div class="form-group">
            <label for="adname">Name:</label>
            <input type="text" class="form-control" id="adname" name="adname" value="<%= adName %>" required>
        </div>
        <div class="form-group">
            <label for="ademail">Email:</label>
            <input type="email" class="form-control" id="ademail" name="ademail" value="<%= adEmail %>" required>
        </div>
        <div class="form-group">
            <label for="adusername">Username:</label>
            <input type="text" class="form-control" id="adusername" name="adusername" value="<%= adUsername %>" required>
        </div>
        <div class="form-group">
            <label for="adpassword">Password:</label>
            <input type="password" class="form-control" id="adpassword" name="adpassword" value="<%= adPassword %>" required>
        </div>
        <div class="form-group">
            <label for="adphoneno">Phone No:</label>
            <input type="text" class="form-control" id="adphoneno" name="adphoneno" value="<%= adPhoneNo %>" required>
        </div>
        
        
        
        
        
        
        
        <button type="submit" class="btn btn-primary">Update</button>
    </form>
    <% 
        } else {
            out.println("<p>No admin found with ID</p>");
        }

        // Close resources
        rs.close();
        ps.close();
        con.close();
    %>
</div>

</body>
</html>


