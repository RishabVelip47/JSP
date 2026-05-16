<%@ page import="bank.BankDAO, java.sql.ResultSet" %>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) { response.sendRedirect("index.jsp"); return; }
    BankDAO dao = new BankDAO();
    ResultSet rs = dao.getAccountDetails(username);
    String name = ""; double balance = 0; int id = 0;
    if (rs.next()) {
        id = rs.getInt("id");
        name = rs.getString("name");
        balance = rs.getDouble("balance");
    }
%>
<!DOCTYPE html>
<html>
<head><title>Account Details</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 100px;">
    <h2>Account Details</h2>
    <table border="1" align="center" cellpadding="10">
        <tr><td>Account ID</td><td><%= id %></td></tr>
        <tr><td>Full Name</td><td><%= name %></td></tr>
        <tr><td>Username</td><td><%= username %></td></tr>
        <tr><td>Balance</td><td>Rs. <%= balance %></td></tr>
    </table>
    <br/><a href="dashboard.jsp">Back</a>
</body>
</html>