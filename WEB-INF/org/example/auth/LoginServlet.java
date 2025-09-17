package org.example.auth;

import com.mysql.cj.Session;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;

import org.example.utils.User;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        // Show login page
        req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {

        String email = req.getParameter("email");
        String password = req.getParameter("password");

        try {
            // Fetch user by email (or username depending on your User.getOneUser logic)
            User user = User.getOneUser(email);

            if (user != null && user.getPassword().equals(password)) {
                HttpSession session = req.getSession();

                // Save both the full user object (if needed later) AND the username
                session.setAttribute("user", user);
                session.setAttribute("username", user.getUsername());

                resp.sendRedirect(req.getContextPath() + "/dashboard");
                return;

            }
        } catch (Exception e) {
            throw new ServletException("Login error", e);
        }

        // If login fails
        req.setAttribute("error", "Invalid email or password");
        req.getRequestDispatcher("/WEB-INF/views/auth/login.jsp").forward(req, resp);
    }
}
