package org.example.utils;

import java.sql.Connection;

public class TestDB {
    public static void main(String[] args) {
        try (Connection conn = DBConnection.getConnection()) {
            System.out.println(" Connected to DB!");
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
