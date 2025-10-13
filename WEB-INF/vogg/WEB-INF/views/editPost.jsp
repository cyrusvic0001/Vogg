<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Edit Post"/>
<c:import url="/WEB-INF/views/includes/head.jsp"/>
<head>
  <meta charset="UTF-8">
  <title>Vogg - Edit</title>
<body>
<c:import url="/WEB-INF/views/includes/header.jsp"/>

<!-- Banner -->
<section style="background:#fff3e6; padding:30px; text-align:center;">
    <h1>Edit Post</h1>
</section>

<!-- Grid layout -->
<div style="display:grid; grid-template-columns:2fr 1fr; gap:20px; padding:20px;">

    <!-- Left: Edit Form -->
    <div style="background:white; padding:20px; border-radius:10px; box-shadow:0 2px 5px rgba(0,0,0,0.1);">
        <c:if test="${not empty post}">
            <form action="${pageContext.request.contextPath}/editPost" method="post">
                <input type="hidden" name="id" value="${post.id}"/>

                <div style="margin-bottom:15px;">
                    <label>Title:</label><br/>
                    <input type="text" name="title" value="${post.title}" style="width:100%; padding:10px;" required/>
                </div>

                <div style="margin-bottom:15px;">
                    <label>Content:</label><br/>
                    <textarea name="content" style="width:100%; padding:10px;" rows="10" required>${post.content}</textarea>
                </div>

                <button type="submit" style="background:#007bff; color:white; padding:10px 20px; border:none; border-radius:5px;">
                    Update Post
                </button>
            </form>
        </c:if>

        <c:if test="${empty post}">
            <p style="color:red;">Post not found.</p>
        </c:if>
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
    </div>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
