<%@ page contentType="text/html; charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vogg - Login</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
    body {
      font-family: 'Segoe UI', Arial, sans-serif;
      background: linear-gradient(135deg, #fff7f0, #ffffff);
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      color: #111827;
    }

    .login-container {
      background: #fff;
      padding: 2.5rem;
      border-radius: 16px;
      box-shadow: 0 6px 20px rgba(0,0,0,0.08);
      width: 100%;
      max-width: 400px;
      text-align: center;
      animation: fadeIn 0.6s ease;
      border-top: 6px solid #ff6b00; /* orange accent */
    }

    .login-container h2 {
      margin-bottom: 1rem;
      font-size: 1.8rem;
      font-weight: 700;
      color: #ff6b00; /* orange heading */
    }
    .login-container p {
      font-size: 0.95rem;
      color: #6b7280;
      margin-bottom: 1.8rem;
    }

    .error {
      color: red;
      font-size: 0.9rem;
      margin-bottom: 1rem;
    }

    .form-group {
      margin-bottom: 1.3rem;
      text-align: left;
    }
    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      font-weight: 600;
      font-size: 0.95rem;
      color: #374151;
    }
    .form-group input {
      width: 100%;
      padding: 0.9rem;
      border-radius: 10px;
      border: 1px solid #d1d5db;
      outline: none;
      font-size: 1rem;
      transition: border-color 0.3s;
    }
    .form-group input:focus {
      border-color: #ff6b00;
      box-shadow: 0 0 0 3px rgba(255,107,0,0.2);
    }

    .btn {
      display: inline-block;
      width: 100%;
      padding: 0.9rem;
      border-radius: 9999px;
      border: none;
      background: #ff6b00;
      color: #fff;
      font-size: 1rem;
      font-weight: 600;
      cursor: pointer;
      transition: background 0.3s ease;
    }
    .btn:hover {
      background: #e65c00;
    }

    .alt-link {
      margin-top: 1.5rem;
      font-size: 0.9rem;
      color: #6b7280;
    }
    .alt-link a {
      color: #ff6b00;
      text-decoration: none;
      font-weight: 600;
    }
    .alt-link a:hover {
      text-decoration: underline;
    }

    @keyframes fadeIn {
      from { opacity: 0; transform: translateY(15px); }
      to { opacity: 1; transform: translateY(0); }
    }
  </style>
</head>
<body>
  <div class="login-container">
    <h2>Welcome Back</h2>
    <p>Login to continue your journey on Vogg</p>

    <!-- Show error if present -->
    <%
      String error = (String) request.getAttribute("error");
      if (error != null) {
    %>
      <div class="error"><%= error %></div>
    <%
      }
    %>

    <form action="<%= request.getContextPath() %>/login" method="post">
      <div class="form-group">
        <label for="email">Email</label>
        <input type="email" id="email" name="email" placeholder="you@example.com" required>
      </div>

      <div class="form-group">
        <label for="password">Password</label>
        <input type="password" id="password" name="password" placeholder="••••••••" required>
      </div>

      <button type="submit" class="btn">Login</button>
    </form>

    <p class="alt-link">
      Don’t have an account?
      <a href="<%= request.getContextPath() %>/signup">Sign Up</a>
    </p>
  </div>
</body>
</html>
