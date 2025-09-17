<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<c:set var="pageTitle" value="Welcome to Vogg"/>
<c:import url="/WEB-INF/views/includes/head.jsp"/>
<head>
  <meta charset="UTF-8">
  <title>Vogg - Home</title>
<body>
    <c:import url="/WEB-INF/views/includes/header.jsp"/>

    <!-- Hero Banner -->
    <section style="text-align:center; padding:80px 20px; background:#f7f7f7;">
        <h1 style="font-size:3em; font-weight:bold; margin-bottom:15px;">Welcome to <span style="color:#ff5722;">Vogg</span></h1>
        <p style="font-size:1.3em; color:#555; max-width:600px; margin:0 auto;">
            A modern blogging platform built for sharing stories, ideas, and knowledge with the world
        </p>
        <div style="margin-top:30px;">
            <a href="${pageContext.request.contextPath}/signup"
               style="padding:14px 30px; background:#ff5722; color:#fff; text-decoration:none; border-radius:30px; font-size:1.1em; margin:0 10px;">
               Get Started
            </a>
            <a href="${pageContext.request.contextPath}/login"
               style="padding:14px 30px; background:#fff; color:#ff5722; border:2px solid #ff5722; text-decoration:none; border-radius:30px; font-size:1.1em; margin:0 10px;">
               Login
            </a>
        </div>
    </section>

    <!-- About Section -->
    <section style="padding:60px 20px; text-align:center; background:#fff;">
        <h2 style="font-size:2em; margin-bottom:20px;">About Vogg</h2>
        <p style="max-width:800px; margin:0 auto; color:#666; font-size:1.1em;">
            Vogg is built for simplicity and creativity. Whether you're a writer, student, or tech enthusiast,
            Vogg makes it easy to publish, share, and connect. Inspired by recent modern platforms, we aim
            to give you a professional yet friendly blogging space.
        </p>
    </section>

    <!-- Features Section -->
    <section style="padding:60px 20px; background:#fafafa;">
        <h2 style="text-align:center; font-size:2em; margin-bottom:40px;">Why Choose Vogg?</h2>
        <div style="display:grid; grid-template-columns: repeat(auto-fit,minmax(220px,1fr)); gap:25px; max-width:1000px; margin:0 auto;">
            <div style="padding:20px; background:#fff; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.08); text-align:center;">
                <h3 style="font-size:1.3em;"> Fast & Easy</h3>
                <p style="color:#555;">Post your content in seconds with a clean, lightweight editor.</p>
            </div>
            <div style="padding:20px; background:#fff; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.08); text-align:center;">
                <h3 style="font-size:1.3em;"> Secure</h3>
                <p style="color:#555;">Your stories and data are always protected with strong security.</p>
            </div>
            <div style="padding:20px; background:#fff; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.08); text-align:center;">
                <h3 style="font-size:1.3em;"> Global Community</h3>
                <p style="color:#555;">Reach people from every corner of the world instantly.</p>
            </div>
            <div style="padding:20px; background:#fff; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.08); text-align:center;">
                <h3 style="font-size:1.3em;"> Mobile First</h3>
                <p style="color:#555;">Optimized for every screen to read & write on the go.</p>
            </div>
        </div>
    </section>

    <!-- Blog Previews -->
    <section style="padding:60px 20px; background:#fff;">
        <h2 style="text-align:center; font-size:2em; margin-bottom:40px;">Latest Blog Posts</h2>
        <div style="display:grid; grid-template-columns: repeat(auto-fit,minmax(280px,1fr)); gap:25px; max-width:1000px; margin:0 auto;">
            <div style="padding:20px; background:#fafafa; border-radius:12px; box-shadow:0 2px 6px rgba(0,0,0,0.05);">
                <h3>How to Create a Blog in Java</h3>
                <p style="color:#999; font-size:0.9em;">Posted by Admin on Aug 8, 2025</p>
                <p style="color:#555;">A beginner’s guide to building your own blog using Java and JSP.</p>
                <a href="#" style="color:#ff5722; text-decoration:none; font-weight:bold;">Read More </a>
            </div>
            <div style="padding:20px; background:#fafafa; border-radius:12px; box-shadow:0 2px 6px rgba(0,0,0,0.05);">
                <h3>10 Tips for Writing Clean Java Code</h3>
                <p style="color:#999; font-size:0.9em;">Posted by John Doe on Aug 7, 2025</p>
                <p style="color:#555;">Learn how to write elegant, efficient, and maintainable code.</p>
                <a href="#" style="color:#ff5722; text-decoration:none; font-weight:bold;">Read More </a>
            </div>
        </div>
    </section>

    <!-- FAQ -->
    <section style="padding:60px 20px; background:#fafafa;">
        <h2 style="text-align:center; font-size:2em; margin-bottom:20px;">FAQ</h2>
        <div style="max-width:800px; margin:0 auto; color:#555; line-height:1.6;">
            <p><b>Is it free?</b>  Yes, Vogg is free to use.</p>
            <p><b>Can I edit posts?</b>  Absolutely, anytime.</p>
            <p><b>Do I need coding skills?</b>  No, just write & publish.</p>
            <p><b>Can I use it on mobile?</b>  Yes, fully responsive.</p>
        </div>
    </section>

  <!-- Newsletter -->
  <section style="padding:60px 20px; text-align:center; background:#fff;">
      <h2 style="font-size:2em; margin-bottom:15px;">Stay Updated</h2>
      <p style="color:#555;">Subscribe to our newsletter and never miss an update</p>

      <form id="newsletterForm" style="margin-top:20px;">
          <input type="email" id="newsletterEmail" placeholder="Enter your email"
                 style="padding:12px; width:280px; border:1px solid #ddd; border-radius:25px; outline:none;" required />
          <button type="submit"
                  style="padding:12px 25px; background:#ff5722; color:#fff; border:none; border-radius:25px; margin-left:-40px; cursor:pointer;">
              Subscribe
          </button>
      </form>

      <!-- Success message (hidden by default) -->
      <p id="successMessage" style="display:none; margin-top:15px; color:green; font-weight:600;">
           Email successfully subscribed!
      </p>
  </section>

  <script>
    document.getElementById("newsletterForm").addEventListener("submit", function(event) {
      event.preventDefault(); // prevent actual form submit
      const email = document.getElementById("newsletterEmail").value.trim();

      if (email) {
        document.getElementById("successMessage").style.display = "block";
        document.getElementById("newsletterForm").reset(); // clear input
      }
    });
  </script>

    <c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
</html>
