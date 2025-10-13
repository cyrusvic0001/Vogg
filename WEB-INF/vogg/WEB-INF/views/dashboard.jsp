<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Dashboard"/>
<head>
  <meta charset="UTF-8">
  <title>Vogg - Dashboard</title>

<c:import url="/WEB-INF/views/includes/head.jsp"/>

<body>
<c:import url="/WEB-INF/views/includes/header.jsp"/>

<!-- Banner -->
<section style="background:#fff3e6; padding:30px; text-align:center;">
    <h1>Welcome, ${fullname}!</h1>
    <p>Username: ${username} | Email: ${email}</p>
</section>

<!-- Grid layout -->
<div style="display:grid; grid-template-columns:2fr 1fr; gap:20px; padding:20px;">

    <!-- Left: Posts & Example Blogs -->
    <div>
        <!-- Loop for latest posts -->
        <c:forEach var="post" items="${latestPosts}">
            <div style="margin-top:15px; padding:15px; border:1px solid #eee; border-radius:10px; background:#fff; box-shadow:0 2px 6px rgba(0,0,0,0.05);">
                <h3 style="margin:0; color:#333;">
                    <a href="${pageContext.request.contextPath}/viewPost?id=${post.id}"
                       style="text-decoration:none; color:#ff6600; font-weight:bold;">
                        ${post.title}
                    </a>
                </h3>
                <p style="color:#888; font-size:14px; margin:5px 0;">
                    Posted by <b>${post.author}</b> on ${post.createdAt}
                </p>
                <p style="color:#444; line-height:1.5;">
                    ${post.content.length() > 150 ? post.content.substring(0,150) + "..." : post.content}
                </p>
            </div>
        </c:forEach>

        <!-- View All Posts Button -->
        <div style="text-align:center; margin-top:30px;">
            <a href="${pageContext.request.contextPath}/posts"
               style="display:inline-block; background:linear-gradient(90deg, #ff6600, #ff8533);
                      color:white; padding:12px 25px; border-radius:30px;
                      font-weight:bold; text-decoration:none; font-size:16px;
                      box-shadow:0 4px 10px rgba(0,0,0,0.15); transition:all 0.3s ease;">
                View All Posts
            </a>
        </div>

        <!-- Example Blogs -->
        <section style="padding:20px 0;">
            <h3 style="margin-top:30px;">Example Blogs</h3>
            <div style="display:grid; grid-template-columns: repeat(auto-fit,minmax(280px,1fr)); gap:20px; margin-top:15px;">
                <div style="padding:20px; background:#fafafa; border-radius:12px; box-shadow:0 2px 6px rgba(0,0,0,0.05);">
                    <h4>How to Create a Blog in Java</h4>
                    <p style="color:#999; font-size:0.9em;">Posted by Admin on Aug 8, 2025</p>
                    <p style="color:#555;">A beginner’s guide to building your own blog using Java and JSP.</p>
                    <a href="#" style="color:#ff5722; text-decoration:none; font-weight:bold;">Read More</a>
                </div>
                <div style="padding:20px; background:#fafafa; border-radius:12px; box-shadow:0 2px 6px rgba(0,0,0,0.05);">
                    <h4>10 Tips for Writing Clean Java Code</h4>
                    <p style="color:#999; font-size:0.9em;">Posted by John Doe on Aug 7, 2025</p>
                    <p style="color:#555;">Learn how to write elegant, efficient, and maintainable code.</p>
                    <a href="#" style="color:#ff5722; text-decoration:none; font-weight:bold;">Read More</a>
                </div>
            </div>
        </section>
    </div>

    <!-- Right: Quick Actions -->
    <div style="background:white; padding:20px; border-radius:10px; box-shadow:0 2px 5px rgba(0,0,0,0.1);">
        <h2> Quick Actions</h2>

        <div style="margin-top:15px;">
            <a href="${pageContext.request.contextPath}/write"
               style="display:block; background:#ff6600; color:white; padding:10px; border-radius:5px; text-align:center;">
                Write New Post
            </a>
        </div>

        <div style="margin-top:15px;">
            <a href="${pageContext.request.contextPath}/posts"
               style="display:block; background:#333; color:white; padding:10px; border-radius:5px; text-align:center;">
                View All Posts
            </a>
        </div>

        <c:if test="${not empty lastPost}">
            <div style="margin-top:15px;">
                <a href="${pageContext.request.contextPath}/editPost"
                   style="display:block; background:#007bff; color:white; padding:10px; border-radius:5px; text-align:center;">
                    Edit Post
                </a>
            </div>

            <div style="margin-top:15px;">
                <a href="${pageContext.request.contextPath}/viewPost"
                   style="display:block; background:#28a745; color:white; padding:10px; border-radius:5px; text-align:center;">
                    View Post
                </a>
            </div>
        </c:if>
    </div>

</div> <!-- end grid -->


<c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
