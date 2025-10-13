package org.example.utils;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection() throws Exception {
        // Read environment variables (with fallback defaults)
        String url = System.getenv("DB_URL");
        String user = System.getenv("DB_USER");
        String pass = System.getenv("DB_PASS");

        // Optional: default values if not set (for local testing)
        if (url == null) url = "jdbc:mysql://localhost:3307/vogg?useSSL=false&serverTimezone=UTC";
        if (user == null) user = "root";
        if (pass == null) pass = "";

        // Load MySQL driver
        Class.forName("com.mysql.cj.jdbc.Driver");

        // Return connection
        return DriverManager.getConnection(url, user, pass);
    }
}
