<%
    String username = (String) session.getAttribute("username");
    if (username == null) { response.sendRedirect("index.jsp"); return; }
%>
<!DOCTYPE html>
<html>
<head><title>Dashboard</title></head>
<body style="font-family: Arial; text-align: center; margin-top: 80px;">
    <h2>Hello, <%= username %>!</h2>
    <h3>What would you like to do?</h3>
    <a href="accountDetails.jsp"><button> Account Details</button></a><br/><br/>
    <a href="deposit.jsp"><button> Deposit</button></a><br/><br/>
    <a href="withdraw.jsp"><button> Withdraw</button></a><br/><br/>
    <%-- Logout: just clear the session --%>
    <a href="logout.jsp"><button style="color:red"> Logout</button></a>
</body>
</html>