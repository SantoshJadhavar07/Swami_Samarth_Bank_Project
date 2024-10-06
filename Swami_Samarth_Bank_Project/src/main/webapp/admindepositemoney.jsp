<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*, java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Deposit Money</title>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
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
    </style>
</head>
<body>

<div class="container">
    <h2>Deposit Money</h2>
    <div>
    <a href="AdminDashboard.jsp" >Back to Dashboard</a>
  </div>
    <form action="admindeposite.jsp" method="post">
        <div class="form-group">
            <label for="customerid">UserId:</label>
            <input type="text" class="form-control" id="customerid" name="customerid" required>
        </div>
        <div class="form-group">
            <label for="accountNumber">User Account Number:</label>
            <input type="text" class="form-control" id="accountNumber" name="accountNumber" required>
        </div>
        <div class="form-group">
            <label for="amount">Deposit Amount:</label>
            <input type="number" class="form-control" id="amount" name="amount" required>
        </div>
        <div class="form-group">
            <label for="depositDate">Deposit Date:</label>
            <input type="date" class="form-control" id="depositDate" name="depositDate" required>
        </div>
        <button type="submit" class="submit-button">Deposit Now</button>
    </form>
</div>

</body>
</html>
