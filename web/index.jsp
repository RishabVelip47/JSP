<%@ page import="bank.BankDAO" %>
<%
    String error = "";
    if (request.getMethod().equals("POST")) {
        String username = request.getParameter("username");
        String password = request.getParameter("password");
        BankDAO dao = new BankDAO();
        if (dao.login(username, password)) {
            session.setAttribute("username", username);
            response.sendRedirect("dashboard.jsp");
            return;
        } else {
            error = "Invalid username or password.";
        }
    }
%>
<!DOCTYPE html>
<html>
<head><title>Login</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 100px;">
    <h2> Welcome to Simple Bank</h2>
    <% if (!error.isEmpty()) { %><p style="color:red"><%= error %></p><% } %>
    <form method="post">
        <input type="text" name="username" placeholder="Username" required/><br/><br/>
        <input type="password" name="password" placeholder="Password" required/><br/><br/>
        <button type="submit">Login</button>
    </form>
    <br/><a href="register.jsp">Don't have an account? Register</a>
</body>
</html>