<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vogg - Signup</title>
  <c:set var="pageTitle" value="Signup"/>
  <c:import url="/WEB-INF/views/includes/head.jsp" />

  <body>
    <c:import url="/WEB-INF/views/includes/header.jsp" />

    <div class="form-container">
      <h2>Create Account</h2>
      <p class="subtitle">Join <b>Vogg</b> and start sharing your stories</p>

      <c:if test="${not empty error}">
        <p style="color: red; margin-bottom: 10px;">${error}</p>
      </c:if>

      <form method="post" action="${pageContext.request.contextPath}/signup">
        <div class="form-group">
          <label for="username">Username</label>
          <input id="username" type="text" name="username" placeholder="Enter username" required />
        </div>

        <div class="form-group">
          <label for="email">Email</label>
          <input id="email" type="email" name="email" placeholder="you@example.com" required />
        </div>

        <div class="form-group">
          <label for="fullname">Full Name</label>
          <input id="fullname" type="text" name="fullname" placeholder="John Doe" required />
        </div>

        <div class="form-group">
          <label for="password">Password</label>
          <input id="password" type="password" name="password" placeholder="••••••••" required />
        </div>

        <button type="submit" class="btn">Sign Up</button>
      </form>

      <p class="alt-link">
        Already have an account?
        <a href="${pageContext.request.contextPath}/login">Login</a>
      </p>
    </div>

    <c:import url="/WEB-INF/views/includes/footer.jsp" />

    <style>
      body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #fff7ed, #fffbeb); /* light orange-white gradient */
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 90vh;
        color: #111827;
      }
      .form-container {
        background: #fff;
        padding: 2rem;
        border-radius: 16px;
        box-shadow: 0 6px 20px rgba(0,0,0,0.08);
        width: 100%;
        max-width: 420px;
        text-align: center;
      }
      h2 {
        font-size: 1.8rem;
        margin-bottom: 0.5rem;
        color: #f97316;
      }
      .subtitle {
        font-size: 0.95rem;
        color: #6b7280;
        margin-bottom: 1.5rem;
      }
      .form-group {
        margin-bottom: 1rem;
        text-align: left;
      }
      .form-group label {
        display: block;
        margin-bottom: 0.4rem;
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
        border-color: #f97316; /* orange */
        box-shadow: 0 0 0 3px rgba(249,115,22,0.2);
      }
      .btn {
        margin-top: 0.5rem;
        display: inline-block;
        width: 100%;
        padding: 0.9rem;
        border-radius: 9999px;
        border: none;
        background: #f97316;
        color: #fff;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.3s ease;
      }
      .btn:hover {
        background: #ea580c;
      }
      .alt-link {
        margin-top: 1.5rem;
        font-size: 0.9rem;
        color: #6b7280;
      }
      .alt-link a {
        color: #f97316;
        text-decoration: none;
        font-weight: 600;
      }
      .alt-link a:hover {
        text-decoration: underline;
      }
    </style>
  </body>
</html>
