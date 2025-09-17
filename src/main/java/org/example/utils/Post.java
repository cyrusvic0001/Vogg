package org.example.utils;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class Post {
    private int id;
    private String title;
    private String content;
    private String author;
    private Date createdAt;

    // --- Constructors ---
    public Post() {}

    public Post(int id, String title, String content, String author, Date createdAt) {
        this.id = id;
        this.title = title;
        this.content = content;
        this.author = author;
        this.createdAt = createdAt;
    }

    // --- Get single post by ID ---
    public static Post getPostById(int id) {
        Post post = null;
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, title, content, author, created_at FROM posts WHERE id = ?";
            PreparedStatement stmt = conn.prepareStatement(sql);
            stmt.setInt(1, id);

            ResultSet rs = stmt.executeQuery();
            if (rs.next()) {
                post = new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getTimestamp("created_at")
                );
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return post;
    }

    // --- INSERT new post ---
    public static void addPost(String title, String content, String author) throws Exception {
        try (Connection conn = DBConnection.getConnection()) {
            conn.setAutoCommit(true); // Ensure auto-commit is ON
            String sql = "INSERT INTO posts (title, content, author, created_at) VALUES (?, ?, ?, NOW())";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, author);
            ps.executeUpdate();
        }
    }

    // --- FETCH all posts (no pagination) ---
    public static List<Post> getAllPosts() throws Exception {
        List<Post> posts = new ArrayList<>();
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "SELECT id, title, content, author, created_at FROM posts ORDER BY created_at DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                posts.add(new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getTimestamp("created_at")
                ));
            }
        }
        return posts;
    }

    // --- FETCH posts with Search + Pagination ---
    public static List<Post> getPosts(int offset, int limit, String keyword) throws Exception {
        List<Post> posts = new ArrayList<>();
        String sql = "SELECT id, title, content, author, created_at " +
                "FROM posts " +
                "WHERE title LIKE ? OR content LIKE ? " +
                "ORDER BY created_at DESC LIMIT ? OFFSET ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String search = "%" + (keyword == null ? "" : keyword) + "%";
            ps.setString(1, search);
            ps.setString(2, search);
            ps.setInt(3, limit);
            ps.setInt(4, offset);

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                posts.add(new Post(
                        rs.getInt("id"),
                        rs.getString("title"),
                        rs.getString("content"),
                        rs.getString("author"),
                        rs.getTimestamp("created_at")
                ));
            }
        }
        return posts;
    }

    // --- COUNT total posts for pagination ---
    public static int countPosts(String keyword) throws Exception {
        String sql = "SELECT COUNT(*) FROM posts WHERE title LIKE ? OR content LIKE ?";
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            String search = "%" + (keyword == null ? "" : keyword) + "%";
            ps.setString(1, search);
            ps.setString(2, search);

            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        }
        return 0;
    }

    // --- UPDATE existing post ---
    public static boolean updatePost(int id, String title, String content, String author) throws Exception {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "UPDATE posts SET title=?, content=?, author=? WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, title);
            ps.setString(2, content);
            ps.setString(3, author);
            ps.setInt(4, id);
            int rows = ps.executeUpdate();
            return rows > 0;
        }
    }

    // --- DELETE post ---
    public static void deletePost(int id) throws Exception {
        try (Connection conn = DBConnection.getConnection()) {
            String sql = "DELETE FROM posts WHERE id=?";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
        }
    }

    // --- Getters / Setters ---
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getContent() { return content; }
    public void setContent(String content) { this.content = content; }

    public String getAuthor() { return author; }
    public void setAuthor(String author) { this.author = author; }

    public Date getCreatedAt() { return createdAt; }
    public void setCreatedAt(Date createdAt) { this.createdAt = createdAt; }
}
