<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<head>
  <meta charset="UTF-8">
  <title>Vogg - Posts</title>
  <c:set var="pageTitle" value="All Posts"/>
  <c:import url="/WEB-INF/views/includes/head.jsp"/>
</head>

<body style="display:flex; flex-direction:column; min-height:100vh;">

  <!-- Header -->
  <c:import url="/WEB-INF/views/includes/header.jsp"/>

  <!-- Main Content -->
  <div style="flex:1;">
    <!-- Banner -->
    <section style="background:#fff3e6; padding:30px; text-align:center;">
        <h1>All Posts</h1>
        <p style="color:#555;">Browse the latest posts from our community</p>
    </section>

    <!-- Search Form -->
    <div style="text-align:center; margin:20px;">
        <form method="get" action="${pageContext.request.contextPath}/posts">
            <input type="text" name="search" value="${searchQuery}"
                   placeholder="Search posts..."
                   style="padding:10px; width:250px; border:1px solid #ddd; border-radius:6px;">
            <button type="submit"
                    style="padding:10px 15px; background:#ff6600; color:white; border:none; border-radius:6px;">
                Search
            </button>
        </form>
    </div>

    <!-- Layout Grid -->
    <div style="display:grid; grid-template-columns:2fr 1fr; gap:20px; padding:20px;">

        <!-- Posts List -->
        <div style="background:white; padding:20px; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
            <h2 style="margin-bottom:20px; color:#333;">Latest Posts</h2>

            <c:choose>
                <c:when test="${not empty posts}">
                    <c:forEach var="post" items="${posts}">
                        <div style="margin-bottom:25px; padding-bottom:15px; border-bottom:1px solid #eee;">
                            <h3 style="margin:0;">
                                <a href="${pageContext.request.contextPath}/viewPost?id=${post.id}"
                                   style="color:#ff6600; text-decoration:none;">
                                    ${post.title}
                                </a>
                            </h3>
                            <p style="color:#777; font-size:0.9em;">
                                By ${post.author} •
                                <fmt:formatDate value="${post.createdAt}" pattern="dd MMM yyyy HH:mm"/>
                            </p>
                            <p>
                                <c:choose>
                                    <c:when test="${fn:length(post.content) > 180}">
                                        ${fn:substring(post.content, 0, 180)}...
                                    </c:when>
                                    <c:otherwise>
                                        ${post.content}
                                    </c:otherwise>
                                </c:choose>
                            </p>
                            <div style="margin-top:10px;">
                                <a href="${pageContext.request.contextPath}/viewPost?id=${post.id}"
                                   style="color:#ff6600; margin-right:15px;">View</a>
                                <a href="${pageContext.request.contextPath}/editPost?id=${post.id}"
                                   style="color:#333; margin-right:15px;">Edit</a>
                                <a href="${pageContext.request.contextPath}/deletePost?id=${post.id}"
                                   style="color:red;">Delete</a>
                            </div>
                        </div>
                    </c:forEach>

                    <!-- Pagination -->
                    <div style="text-align:center; margin-top:20px;">
                        <c:forEach begin="1" end="${totalPages}" var="i">
                            <c:choose>
                                <c:when test="${i == currentPage}">
                                    <span style="padding:8px 12px; background:#ff6600; color:white; border-radius:4px;">
                                        ${i}
                                    </span>
                                </c:when>
                                <c:otherwise>
                                    <a href="${pageContext.request.contextPath}/posts?page=${i}&search=${searchQuery}"
                                       style="padding:8px 12px; margin:2px; border:1px solid #ddd; border-radius:4px; text-decoration:none; color:#333;">
                                        ${i}
                                    </a>
                                </c:otherwise>
                            </c:choose>
                        </c:forEach>
                    </div>

                </c:when>
                <c:otherwise>
                    <p>No posts available yet. Be the first to write one!</p>
                </c:otherwise>
            </c:choose>
        </div>

        <!-- Sidebar -->
        <div style="background:white; padding:20px; border-radius:12px; box-shadow:0 2px 8px rgba(0,0,0,0.1);">
            <h2 style="color:#333;">Quick Actions</h2>
            <div style="margin-top:15px;">
                <a href="${pageContext.request.contextPath}/write"
                   style="display:block; background:#ff6600; color:white; padding:12px; border-radius:6px;
                          text-align:center; text-decoration:none;">
                     Write New Post
                </a>
            </div>
        </div>
    </div>
  </div> <!-- End Main -->

  <!-- Footer (always at bottom) -->
  <c:import url="/WEB-INF/views/includes/footer.jsp"/>

</body>
