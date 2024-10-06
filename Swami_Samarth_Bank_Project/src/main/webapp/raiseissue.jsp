<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="javax.servlet.http.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Raise an Issue</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
</head>
<body>
<div class="container">
    <h2 class="mt-4">Raise an Issue</h2>
    <!-- Form to raise an issue -->
     <div>
    <a href="UserDashboard.jsp" >Back to Dashboard</a>
  </div>
    <form action="usermsg.jsp" method="post">
        <div class="form-group">
            <label for="fullName">Full Name</label>
            <input type="text" class="form-control" id="fullName" name="s1" placeholder="Enter your name" required>
        </div>
        <div class="form-group">
            <label for="emailAddress">Email Address</label>
            <input type="email" class="form-control" id="emailAddress" name="s2" placeholder="Enter your email" required>
        </div>
        <div class="form-group">
            <label for="message">Your Issue</label>
            <textarea class="form-control" id="message" rows="3" name="s3" placeholder="Describe your issue" required></textarea>
        </div>
        <button type="submit" class="btn btn-primary">Submit Issue</button>
    </form>

    <hr>
    
    <h3>Your Issues & Admin Responses</h3>
    <table class="table table-bordered">
        <thead>
            <tr>
                <th>Issue ID</th>
                <th>Issue</th>
                <th>Admin Response</th>
            </tr>
        </thead>
        <tbody>
            <%
            
                // Retrieve issues and admin responses for the current user
                Connection con = null;
                PreparedStatement ps = null;
                ResultSet rs = null;
                
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

                    // Fetching user's raised issues and responses
                    String email = (String)session.getAttribute("username"); // Assume user email is stored in session
                    
                    String query = "SELECT umsgid, umsg, aresponse FROM usermsg WHERE uemail = ?";
                    ps = con.prepareStatement(query);
                    ps.setString(1, email);
                    rs = ps.executeQuery();

                    while (rs.next()) {
                        int msgId = rs.getInt("umsgid");
                        String userMsg = rs.getString("umsg");
                        String adminResponse = rs.getString("aresponse");

                        out.println("<tr>");
                        out.println("<td>" + msgId + "</td>");
                        out.println("<td>" + userMsg + "</td>");
                        out.println("<td>" + (adminResponse != null ? adminResponse : "No response yet") + "</td>");
                        out.println("</tr>");
                    }
                } catch (Exception e) {
                    e.printStackTrace();
                } finally {
                    if (rs != null) rs.close();
                    if (ps != null) ps.close();
                    if (con != null) con.close();
                }
            %>
        </tbody>
    </table>
</div>



</body>
</html>
<style>
    :root {
        --color-white: #ffffff;
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
        line-height: 1.5;
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

    .table {
        width: 100%;
        margin-top: 2rem;
        color: #fff;
    }

    .table th, .table td {
        padding: 0.75rem;
        vertical-align: middle;
        border-top: 1px solid #dee2e6;
    }

    .table thead th {
        background-color: rgba(0, 0, 0, 0.2);
    }

    .table tbody tr:nth-child(even) {
        background-color: rgba(255, 255, 255, 0.1);
    }
</style>
