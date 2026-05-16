<%@ page import="bank.BankDAO" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) { response.sendRedirect("index.jsp"); return; }
    String msg = "";
    String color = "green";
    if (request.getMethod().equals("POST")) {
        double amount = Double.parseDouble(request.getParameter("amount"));
        String result = new BankDAO().withdraw(username, amount);
        if (result.equals("Success")) {
            msg = "Withdrawn Rs." + amount + " successfully!";
        } else {
            msg = result;
            color = "red";
        }
    }
%>
<!DOCTYPE html>
<html>
<head><title>Withdraw</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 100px;">
    <h2> Withdraw Money</h2>
    <% if (!msg.isEmpty()) { %><p style="color:<%= color %>"><%= msg %></p><% } %>
    <form method="post">
        <input type="number" name="amount" placeholder="Enter amount" min="1" required/><br/><br/>
        <button type="submit">Withdraw</button>
    </form>
    <br/><a href="dashboard.jsp">Back</a>
</body>
</html>