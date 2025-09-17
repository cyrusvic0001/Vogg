<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<head>
  <meta charset="UTF-8">
  <title>Vogg - View</title>
<c:set var="pageTitle" value="${post.title}"/>
<c:import url="/WEB-INF/views/includes/head.jsp"/>

<body>
<c:import url="/WEB-INF/views/includes/header.jsp"/>

<!-- Banner -->
<section style="background:#fff3e6; padding:30px; text-align:center;">
    <h1>${post.title}</h1>
    <p style="color:#555;">Written by <b>${post.author}</b> on ${post.createdAt}</p>
</section>

<!-- Content Area -->
<div style="max-width:800px; margin:30px auto; background:white; padding:20px;
            border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.1); line-height:1.6;">
    <p style="color:#333; font-size:1.1em;">
        ${post.content}
    </p>
</div>

<!-- Actions -->
<div style="max-width:800px; margin:20px auto; display:flex; justify-content:space-between;">
    <a href="${pageContext.request.contextPath}/posts"
       style="background:#333; color:white; padding:10px 20px; border-radius:6px;
              text-decoration:none;">⬅ Back to Posts</a>
    <div>
        <a href="${pageContext.request.contextPath}/editPost?id=${post.id}"
           style="background:#ff6600; color:white; padding:10px 20px; border-radius:6px; text-decoration:none; margin-right:10px;">✏ Edit</a>
        <a href="${pageContext.request.contextPath}/deletePost?id=${post.id}"
           style="background:red; color:white; padding:10px 20px; border-radius:6px; text-decoration:none;">🗑 Delete</a>
    </div>
</div>

<c:import url="/WEB-INF/views/includes/footer.jsp"/>
</body>
