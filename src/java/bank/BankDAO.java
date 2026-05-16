package bank;

import java.sql.*;

public class BankDAO {

    // Register a new account
    public boolean register(String name, String username, String password) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "INSERT INTO accounts (name, username, password, balance) VALUES (?, ?, ?, 0)";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, name);
        ps.setString(2, username);
        ps.setString(3, password);
        int rows = ps.executeUpdate();
        con.close();
        return rows > 0;
    }

    // Login check
    public boolean login(String username, String password) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM accounts WHERE username=? AND password=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ps.setString(2, password);
        ResultSet rs = ps.executeQuery();
        boolean found = rs.next();
        con.close();
        return found;
    }

    // Get balance
    public double getBalance(String username) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT balance FROM accounts WHERE username=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        ResultSet rs = ps.executeQuery();
        double balance = 0;
        if (rs.next()) balance = rs.getDouble("balance");
        con.close();
        return balance;
    }

    // Get full account details
    public ResultSet getAccountDetails(String username) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "SELECT * FROM accounts WHERE username=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setString(1, username);
        return ps.executeQuery();
    }

    // Deposit
    public boolean deposit(String username, double amount) throws Exception {
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE accounts SET balance = balance + ? WHERE username=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDouble(1, amount);
        ps.setString(2, username);
        int rows = ps.executeUpdate();
        con.close();
        return rows > 0;
    }

    // Withdraw
    public String withdraw(String username, double amount) throws Exception {
        double balance = getBalance(username);
        if (amount > balance) return "Insufficient funds!";
        Connection con = DBConnection.getConnection();
        String sql = "UPDATE accounts SET balance = balance - ? WHERE username=?";
        PreparedStatement ps = con.prepareStatement(sql);
        ps.setDouble(1, amount);
        ps.setString(2, username);
        ps.executeUpdate();
        con.close();
        return "Success";
    }
}