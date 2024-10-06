<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*, java.io.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Quick Payment Submission</title>
</head>
<body>

<%
   String paymentType = request.getParameter("paymentType");
   String transferAccount = request.getParameter("transferAccount");
   String transferAmount = request.getParameter("transferAmount");
   String transferDate = request.getParameter("transferDate");
   String cardNumber = request.getParameter("cardNumber");
   String billAmount = request.getParameter("billAmount");
   String billDate = request.getParameter("billDate");
   String mobileNumber = request.getParameter("mobileNumber");
   String rechargeAmount = request.getParameter("rechargeAmount");
   String rechargeDate = request.getParameter("rechargeDate");
   String meterNumber = request.getParameter("meterNumber");
   String electricityAmount = request.getParameter("electricityAmount");
   String electricityBillDate = request.getParameter("electricityBillDate");

   HttpSession usersession = request.getSession();
   int userId = (int) usersession.getAttribute("userId");

   // Amount to subtract from user balance
   int amountToDeduct = 0;

   // Determine the amount based on the payment type
   if (paymentType.equals("quickTransfer")) {
       amountToDeduct = Integer.parseInt(transferAmount);
   } else if (paymentType.equals("creditCardBill")) {
       amountToDeduct = Integer.parseInt(billAmount);
   } else if (paymentType.equals("mobileRecharge")) {
       amountToDeduct = Integer.parseInt(rechargeAmount);
   } else if (paymentType.equals("electricityBill")) {
       amountToDeduct = Integer.parseInt(electricityAmount);
   }

   Class.forName("com.mysql.jdbc.Driver");
   Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/bank", "root", "");

   // Step 1: Get the user's current account balance
   String getBalanceQuery = "SELECT account_balance FROM userinfo WHERE uid = ?";
   PreparedStatement psGetBalance = con.prepareStatement(getBalanceQuery);
   psGetBalance.setInt(1, userId);
   ResultSet rs = psGetBalance.executeQuery();

   if (rs.next()) {
       int currentBalance = rs.getInt("account_balance");

       // Step 2: Check if the balance is sufficient for the payment
       if (currentBalance >= amountToDeduct) {
           int newBalance = currentBalance - amountToDeduct;

           // Step 3: Update the account balance
           String updateBalanceQuery = "UPDATE userinfo SET account_balance = ? WHERE uid = ?";
           PreparedStatement psUpdateBalance = con.prepareStatement(updateBalanceQuery);
           psUpdateBalance.setInt(1, newBalance);
           psUpdateBalance.setInt(2, userId);
           psUpdateBalance.executeUpdate();

           // Step 4: Insert payment details into the PaymentDetails table
           String insertPaymentQuery = "INSERT INTO paymentdetails (payment_type, transfer_account, transfer_amount, transfer_date, card_number, bill_amount, payment_date, mobile_number, recharge_amount, recharge_date, meter_number, electricity_amount, electricity_bill_date, uid) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
           PreparedStatement psInsertPayment = con.prepareStatement(insertPaymentQuery);

           psInsertPayment.setString(1, paymentType);
           psInsertPayment.setString(2, transferAccount);
           psInsertPayment.setString(3, transferAmount);
           psInsertPayment.setString(4, transferDate);
           psInsertPayment.setString(5, cardNumber);
           psInsertPayment.setString(6, billAmount);
           psInsertPayment.setString(7, billDate);
           psInsertPayment.setString(8, mobileNumber);
           psInsertPayment.setString(9, rechargeAmount);
           psInsertPayment.setString(10, rechargeDate);
           psInsertPayment.setString(11, meterNumber);
           psInsertPayment.setString(12, electricityAmount);
           psInsertPayment.setString(13, electricityBillDate);
           psInsertPayment.setInt(14, userId);

           int result = psInsertPayment.executeUpdate();

           if (result > 0) {
               // Success - Show JavaScript alert with the new balance
               out.println("<script>alert('Payment successful! Your new balance is: " + newBalance + "'); window.location = 'quickpayment.html';</script>");
           } else {
               out.println("<script>alert('Payment failed! Please try again.'); window.location = 'quickpayment.html';</script>");
           }
       } else {
           // Insufficient balance
           out.println("<script>alert('Insufficient balance! Your current balance is: " + currentBalance + "'); window.location = 'quickpayment.html';</script>");
       }
   } else {
       // User not found
       out.println("<script>alert('User not found. Please check your details.'); window.location = 'quickpayment.html';</script>");
   }

   con.close();
%>

</body>
</html>
