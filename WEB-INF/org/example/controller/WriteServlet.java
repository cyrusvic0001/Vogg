package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import org.example.utils.Post;

import java.io.IOException;

@WebServlet("/write")
public class WriteServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Show the write page (no author field)
        request.getRequestDispatcher("/WEB-INF/views/write.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            // Get form inputs
            String title = request.getParameter("title");
            String content = request.getParameter("content");

            // Fetch username from session (no redirect, just fallback if null)
            HttpSession session = request.getSession(false);
            String author = (session != null && session.getAttribute("username") != null)
                    ? (String) session.getAttribute("username")
                    : "username";

            // Save the post
            Post.addPost(title, content, author);

        } catch (Exception e) {
            e.printStackTrace();
        }

        // After posting, go back to posts page
        response.sendRedirect(request.getContextPath() + "/posts");
    }
}
