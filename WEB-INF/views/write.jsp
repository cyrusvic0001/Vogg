<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Write Post"/>
<head>
  <meta charset="UTF-8">
  <title>Vogg - Write</title>
<c:import url="/WEB-INF/views/includes/head.jsp"/>

<body>
<c:import url="/WEB-INF/views/includes/header.jsp"/>

<!-- Banner -->
<section style="background:#fff3e6; padding:30px; text-align:center;">
    <h1>Create a New Post</h1>
    <p style="color:#555; margin-top:8px;">
        Welcome, <strong>${sessionScope.username}</strong>
    </p>
</section>

<!-- Grid layout -->
<div style="display:grid; grid-template-columns:2fr 1fr; gap:20px; padding:20px;">

    <!-- Left: Write Form -->
    <div style="background:white; padding:20px; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
        <h2 style="margin-bottom:15px; color:#333;"> Write Your Post</h2>

        <form action="${pageContext.request.contextPath}/write" method="post">
            <div style="margin-bottom:15px;">
                <label style="font-weight:bold; display:block; margin-bottom:6px;">Title</label>
                <input type="text" name="title"
                       placeholder="Enter a catchy title..."
                       style="width:100%; padding:12px; border:1px solid #ccc; border-radius:6px;" required/>
            </div>

            <div style="margin-bottom:15px;">
                <label style="font-weight:bold; display:block; margin-bottom:6px;">Content</label>
                <textarea name="content" placeholder="Write your blog content here..."
                          style="width:100%; padding:12px; border:1px solid #ccc; border-radius:6px; resize:vertical;"
                          rows="10" required></textarea>
            </div>

            <button type="submit"
                    style="background:#ff6600; color:white; padding:12px 24px; font-size:1em;
                           border:none; border-radius:6px; cursor:pointer; transition:0.3s;">
                Publish Post
            </button>
        </form>
    </div>

    <!-- Right: Quick Actions -->
    <div style="background:white; padding:20px; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
        <h2 style="margin-bottom:15px; color:#333;"> Quick Actions</h2>

        <div style="margin-top:15px;">
            <a href="${pageContext.request.contextPath}/posts"
               style="display:block; background:#333; color:white; padding:12px; border-radius:6px;
                      text-align:center; text-decoration:none; transition:0.3s;">
                View All Posts
            </a>
        </div>
    </div>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
