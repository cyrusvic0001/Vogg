package org.example.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class User {
    private String username;
    private String password;
    private String email;
    private String fullName;

    // Constructor with password (for DB operations)
    public User(String username, String password, String email, String fullName) {
        this.username = username;
        this.password = password;
        this.email = email;
        this.fullName = fullName;
    }

    // Constructor without password (for safe display)
    public User(String username, String email, String fullName) {
        this.username = username;
        this.email = email;
        this.fullName = fullName;
    }

    // Getters
    public String getUsername() { return username; }
    public String getPassword() { return password; }
    public String getEmail() { return email; }
    public String getFullName() { return fullName; }

    // Create user
    public static void createUser(String username, String password, String email, String fullname) throws Exception {
        String sql = "INSERT INTO users (username, password, email, fullname) VALUES (?, ?, ?, ?)";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username.trim());
            stmt.setString(2, password);
            stmt.setString(3, email.trim());
            stmt.setString(4, fullname.trim());
            stmt.executeUpdate();
        }
    }

    // Update user
    public static void updateUser(String username, String password, String email, String fullname) throws Exception {
        String sql = "UPDATE users SET password = ?, email = ?, fullname = ? WHERE username = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, password);
            stmt.setString(2, email.trim());
            stmt.setString(3, fullname.trim());
            stmt.setString(4, username.trim());
            stmt.executeUpdate();
        }
    }

    // Delete user
    public static void deleteUser(String username) throws SQLException {
        String sql = "DELETE FROM users WHERE username = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, username.trim());
            stmt.executeUpdate();
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }

    // Check if email exists
    public static boolean checkEmail(String email) throws Exception {
        String sql = "SELECT 1 FROM users WHERE email = ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, email.trim());
            try (ResultSet rs = stmt.executeQuery()) {
                return rs.next();
            }
        }
    }

    // Get one user by username or email
    public static User getOneUser(String identifier) throws SQLException {
        String sql = "SELECT username, password, email, fullname FROM users WHERE username = ? OR email = ?";
        String id = identifier == null ? "" : identifier.trim();

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setString(1, id);
            stmt.setString(2, id);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    String u = rs.getString("username");
                    String p = rs.getString("password");
                    String e = rs.getString("email");
                    String f = rs.getString("fullname");
                    System.out.println("Found user: " + u + " (" + e + ")");
                    return new User(u, p, e, f);
                } else {
                    System.out.println("No user found for identifier: " + id);
                    return null;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException(e);
        }
    }
}
