<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header style="background:#fff; border-bottom:2px solid #f97316; padding:1rem 2rem; display:flex; justify-content:space-between; align-items:center; font-family:'Segoe UI', Arial, sans-serif;">

    <!-- Logo / Brand -->
    <div style="display:flex; align-items:center;">
        <!-- Fancy V -->
        <div style="
            font-size:2rem;
            font-weight:bold;
            background: linear-gradient(45deg, #f97316, #ff6600);
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            margin-right:6px;
        ">
            V
        </div>

        <!-- Brand name -->
        <a href="${pageContext.request.contextPath}/"
           style="text-decoration:none; font-size:1.3rem; font-weight:bold; color:#111827;">
           ogg
        </a>
    </div>

    <!-- Navigation -->
    <nav>
        <ul style="list-style:none; display:flex; gap:1.5rem; margin:0; padding:0;">

            <!-- If user is logged in -->
            <c:if test="${not empty sessionScope.username}">
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard"
                       style="text-decoration:none; color:#111827; font-weight:500;">
                       Dashboard
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout"
                       style="text-decoration:none; color:#111827; font-weight:500;">
                       Logout
                    </a>
                </li>
            </c:if>

            <!-- If user is NOT logged in -->
            <c:if test="${empty sessionScope.username}">
                <li>
                    <a href="${pageContext.request.contextPath}/login"
                       style="text-decoration:none; color:#111827; font-weight:500;">
                       Login
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/signup"
                       style="text-decoration:none; color:#111827; font-weight:500;">
                       Signup
                    </a>
                </li>
            </c:if>

        </ul>
    </nav>
</header>
