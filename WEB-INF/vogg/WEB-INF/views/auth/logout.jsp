<%@ page contentType="text/html; charset=UTF-8" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%
    session.invalidate();
%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <title>Vogg - Logout</title>
  <c:set var="pageTitle" value="Logout"/>
  <c:import url="/WEB-INF/views/includes/head.jsp" />

  <body>
    <c:import url="/WEB-INF/views/includes/header.jsp" />

    <div class="logout-container">
      <h2>You’ve been logged out</h2>
      <p class="message">We hope to see you again soon.</p>
      <a href="${pageContext.request.contextPath}/login" class="btn">Login Again</a>
    </div>

    <c:import url="/WEB-INF/views/includes/footer.jsp" />

    <style>
      body {
        font-family: 'Segoe UI', Arial, sans-serif;
        background: linear-gradient(135deg, #eef2ff, #f9fafb);
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 90vh;
        color: #111827;
      }
      .logout-container {
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
        color: #2563eb;
      }
      .message {
        font-size: 1rem;
        color: #6b7280;
        margin-bottom: 1.5rem;
      }
      .btn {
        display: inline-block;
        padding: 0.9rem 1.5rem;
        border-radius: 9999px;
        border: none;
        background: #2563eb;
        color: #fff;
        font-size: 1rem;
        font-weight: 600;
        cursor: pointer;
        transition: background 0.3s ease;
        text-decoration: none;
      }
      .btn:hover {
        background: #1e40af;
      }
    </style>
  </body>
</html>
