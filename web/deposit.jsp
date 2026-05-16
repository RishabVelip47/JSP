<%@ page import="bank.BankDAO" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) { response.sendRedirect("index.jsp"); return; }
    String msg = "";
    if (request.getMethod().equals("POST")) {
        double amount = Double.parseDouble(request.getParameter("amount"));
        new BankDAO().deposit(username, amount);
        msg = "Deposited Rs." + amount + " successfully!";
    }
%>
<!DOCTYPE html>
<html>
<head><title>Deposit</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 100px;">
    <h2>Deposit Money</h2>
    <% if (!msg.isEmpty()) { %><p style="color:green"><%= msg %></p><% } %>
    <form method="post">
        <input type="number" name="amount" placeholder="Enter amount" min="1" required/><br/><br/>
        <button type="submit">Deposit</button>
    </form>
    <br/><a href="dashboard.jsp">Back</a>
</body>
</html>