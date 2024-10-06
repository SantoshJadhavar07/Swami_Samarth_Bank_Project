<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Respond to Customer</title>
    <style>
    @import url('https://fonts.googleapis.com/css2?family=PT+Serif&family=Roboto+Serif:wght@100&display=swap');

    :root {
      --color-white: #ffffff;
      --color-darkgreen: #004d00;
      --color-darkgreen-alpha: rgba(0, 77, 0, 0.7);
      --color-green: rgba(0, 153, 0, 1);
    }

    * {
      box-sizing: border-box;
      margin: 0;
      padding: 0;
    }

    body {
      font-family: 'PT Serif', 'Roboto Serif', serif;
      font-size: 1rem;
      font-weight: 400;
      line-height: 1.5;
      color: var(--color-white);
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
      padding: 2rem;
    }

    .contain {
      max-width: 700px;
      margin: 0 auto;
      background: var(--color-darkgreen-alpha);
      padding: 2rem;
      border-radius: 0.5rem;
      box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    }

    h2.rsps {
      font-weight: 400;
      line-height: 1.2;
      text-align: center;
      margin-bottom: 2rem;
      color: var(--color-white);
    }

    form {
      display: flex;
      flex-direction: column;
    }

    label {
      margin-bottom: 0.5rem;
      font-weight: 600;
      color: var(--color-white);
    }

    .form-control {
      margin-bottom: 1.25rem;
      width: 100%;
      padding: 0.5rem;
      font-size: 1rem;
      border: 1px solid #ced4da;
      border-radius: 0.25rem;
      background-color: #ffffff;
      color: #495057;
      box-shadow: 0 0 0 0.1rem rgba(0, 123, 255, 0.25);
    }

    .form-control:focus {
      border-color: #80bdff;
      outline: 0;
      box-shadow: 0 0 0 0.2rem rgba(0, 123, 255, 0.25);
    }

    button {
      padding: 0.5rem 1rem;
      font-size: 1rem;
      color: #ffffff;
      background-color: var(--color-green);
      border: none;
      border-radius: 0.25rem;
      cursor: pointer;
      transition: background-color 0.3s ease;
    }

    button:hover {
      background-color: #005d00;
    }
</style>

</head>
<body>
<%
    String customerId = request.getParameter("customerId");

    if (customerId != null && !customerId.isEmpty()) {
        try {
            // Load MySQL JDBC driver
            Class.forName("com.mysql.jdbc.Driver");
            
            // Establish connection to the database
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");
            
            // Query to fetch customer details
            String query = "SELECT ufullName, uemail, umsg FROM usermsg WHERE umsgid = ?";
            PreparedStatement pstmt = con.prepareStatement(query);
            pstmt.setInt(1, Integer.parseInt(customerId));
            ResultSet rs = pstmt.executeQuery();

            if (rs.next()) {
                String name = rs.getString("ufullName");
                String email = rs.getString("uemail");
                String massage = rs.getString("umsg");
                
%>
    <div class="contain">
        <h2 class="rsps">Send Response to Customer</h2>
        <form action="sendResponse.jsp" method="post">
            <input type="hidden" name="customerId" value="<%= customerId %>">
            
            <label for="customer-name">Customer Name:</label>
            <input type="text" id="customer-name" name="customer-name" value="<%= name %>" required readonly>

            <label for="customer-email">Customer Email:</label>
            <input type="email" id="customer-email" name="customer-email" value="<%= email %>" required readonly>
            
            <label for="customer-email">Customer Massage:</label>
            <input type="text" id="customer-massage" name="customer-massage" value="<%= massage %>" required readonly>

            <label for="response">Response Message:</label>
            <textarea id="response" name="response" placeholder="Type your response here..." required></textarea>

            <button type="submit">Send Response</button>
        </form>
    </div>
<%
            } else {
%>
    <script>
        alert('Error: Customer not found.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
    </script>
<%
            }

            rs.close();
            pstmt.close();
            con.close();
        } catch (Exception e) {
%>
    <script>
        alert('Error: <%= e.getMessage() %>');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
    </script>
<%
            e.printStackTrace();
        }
    } else {
%>
    <script>
        alert('Error: Invalid Customer ID.');
        window.location.href = 'AdminDashboard.jsp';  // Redirect back to the response page
    </script>
<%
    }
%>
</body>
</html>
