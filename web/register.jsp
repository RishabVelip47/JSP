<%@ page import="bank.BankDAO" %>
<%
    String msg = "";
    if (request.getMethod().equals("POST")) {
        String name = request.getParameter("name");
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        BankDAO dao = new BankDAO();
        dao.register(name, username, password);
        msg = "Account created! Please login.";
    }
%>
<!DOCTYPE html>
<html>
<head><title>Register</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 100px;">
    <h2> Create Account</h2>
    <% if (!msg.isEmpty()) { %><p style="color:green"><%= msg %></p><% } %>
    <form method="post">
        <input type="text" name="name" placeholder="Full Name" required/><br/><br/>
        <input type="text" name="username" placeholder="Username" required/><br/><br/>
        <input type="password" name="password" placeholder="Password" required/><br/><br/>
        <button type="submit">Register</button>
    </form>
    <br/><a href="index.jsp">Already have an account? Login</a>
</body>
</html>