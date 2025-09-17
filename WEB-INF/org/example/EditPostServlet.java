package org.example;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.utils.Post;

import java.io.IOException;

@WebServlet("/editPost")
public class EditPostServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String idParam = request.getParameter("id");
        if (idParam == null || idParam.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/posts");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            Post post = Post.getPostById(id);

            if (post == null) {
                response.sendRedirect(request.getContextPath() + "/posts");
                return;
            }

            request.setAttribute("post", post);
            request.getRequestDispatcher("/WEB-INF/views/editPost.jsp").forward(request, response);

        } catch (Exception e) {
            throw new ServletException("Error loading post for editing", e);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idParam = request.getParameter("id");
        String title = request.getParameter("title");
        String content = request.getParameter("content");

        if (idParam == null || title == null || content == null) {
            response.sendRedirect(request.getContextPath() + "/posts");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            Post post = Post.getPostById(id);

            if (post == null) {
                response.sendRedirect(request.getContextPath() + "/posts");
                return;
            }

            boolean updated = Post.updatePost(id, title, content, post.getAuthor());

            if (updated) {
                response.sendRedirect(request.getContextPath() + "/viewPost?id=" + id);
            } else {
                request.setAttribute("post", post);
                request.setAttribute("error", "Failed to update post.");
                request.getRequestDispatcher("/WEB-INF/views/editPost.jsp").forward(request, response);
            }

        } catch (Exception e) {
            throw new ServletException("Error updating post", e);
        }
    }
}
