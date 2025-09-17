package org.example.controller;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import org.example.utils.Post;

import java.io.IOException;

@WebServlet("/viewPost")
public class ViewPostServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        String idParam = req.getParameter("id");

        if (idParam == null) {
            resp.sendRedirect(req.getContextPath() + "/posts");
            return;
        }

        try {
            int id = Integer.parseInt(idParam);
            Post post = Post.getPostById(id);

            if (post == null) {
                resp.sendRedirect(req.getContextPath() + "/posts");
                return;
            }

            req.setAttribute("post", post);
            req.getRequestDispatcher("/WEB-INF/views/viewPost.jsp").forward(req, resp);

        } catch (Exception e) {
            throw new ServletException("Error loading post", e);
        }
    }
}
