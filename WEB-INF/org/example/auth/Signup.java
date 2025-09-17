package org.example.auth;
import org.example.utils.*;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;


@WebServlet("/signup")
public class Signup extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        //  Show signup form
        request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String email = request.getParameter("email");
        String fullname = request.getParameter("fullname");

        //  Validate input fields
        if (username == null || password == null || email == null || fullname == null ||
                username.isBlank() || password.isBlank() || email.isBlank() || fullname.isBlank()) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        //  Check if email already exists
        try {
            if (User.checkEmail(email)) {
                request.setAttribute("error", "Email is already registered.");
                request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
                return;
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "Database error. Please try again later.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        //  Attempt to create user
        try {
            User.createUser(username, password, email, fullname);
        } catch (Exception e) {
            e.printStackTrace();
            request.setAttribute("error", "User or email already exists.");
            request.getRequestDispatcher("/WEB-INF/views/auth/signup.jsp").forward(request, response);
            return;
        }

        //  Redirect to login servlet (not directly to JSP)
        response.sendRedirect(request.getContextPath() + "/login");
    }
}
