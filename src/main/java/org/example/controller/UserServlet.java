package org.example.controller;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.example.utils.User;

@WebServlet("/users/*")
public class UserServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String pathInfo = request.getPathInfo(); // e.g. /admin or /test@gmail.com
        if (pathInfo == null || pathInfo.equals("/")) {
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "User identifier missing");
            return;
        }

        String identifier = pathInfo.substring(1); // remove leading "/"

        try {
            User user = User.getOneUser(identifier);

            if (user != null) {
                response.setContentType("text/plain");
                response.getWriter().println("Username: " + user.getUsername());
                response.getWriter().println("Full Name: " + user.getFullName());
                response.getWriter().println("Email: " + user.getEmail());
            } else {
                response.sendError(HttpServletResponse.SC_NOT_FOUND, "User not found");
            }

        } catch (Exception e) {
            throw new ServletException("Error retrieving user", e);
        }
    }
}
