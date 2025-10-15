package org.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnection {

    public static Connection getConnection() throws SQLException {
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");

        // --- Local fallback for development ---
        if (url == null || url.isBlank())
            url = "jdbc:mysql://localhost:3307/test?useSSL=false&serverTimezone=UTC";
        if (user == null || user.isBlank())
            user = "root";
        if (pass == null)
            pass = "";

        // --- Debug info ---
        System.out.println("\n---- DATABASE CONNECTION DEBUG ----");
        System.out.println("URL: " + url);
        System.out.println("USER: " + user);
        System.out.println("PASS: " + (pass == null || pass.isEmpty() ? "(empty)" : "********"));
        System.out.println("------------------------------------");

        try {
            // Always ensure driver is loaded
            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection conn = DriverManager.getConnection(url, user, pass);
            System.out.println(" Connected successfully to database!");
            return conn;

        } catch (ClassNotFoundException e) {
            System.err.println(" MySQL Driver not found. Did you add it to your classpath?");
            throw new SQLException("Driver not found", e);

        } catch (SQLException e) {
            System.err.println(" Database connection failed: " + e.getMessage());
            System.err.println("  Check your DB_URL, DB_USER, DB_PASS, and network access.");
            throw e;
        }
    }
}
