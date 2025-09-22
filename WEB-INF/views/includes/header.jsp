<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<header style="background:#fff; border-bottom:2px solid #f97316; padding:1rem 2rem; display:flex; justify-content:space-between; align-items:center; font-family:'Segoe UI', Arial, sans-serif;">

    <!-- Logo / Brand -->
    <div style="display:flex; align-items:center;">
        <a href="${pageContext.request.contextPath}"
           style="text-decoration:none; font-size:1.6rem; font-weight:bold; color:#111827; display:flex; align-items:center;">
            <span style="
                background: linear-gradient(45deg, #f97316, #ff6600);
                -webkit-background-clip: text;
                -webkit-text-fill-color: transparent;
                margin-right:2px;
            ">
                VOGG
            </span>
        </a>
    </div>

    <!-- Navigation -->
    <nav>
        <ul style="list-style:none; display:flex; gap:1rem; margin:0; padding:0;">

            <!-- If user is logged in -->
            <c:if test="${not empty sessionScope.username}">
                <li>
                    <a href="${pageContext.request.contextPath}/dashboard"
                       style="padding:0.5rem 1rem; border:2px solid #f97316; border-radius:6px; background:#fff; color:#f97316; font-weight:600; text-decoration:none; transition:all 0.3s;">
                       Dashboard
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/logout"
                       style="padding:0.5rem 1rem; border:2px solid #f97316; border-radius:6px; background:#fff; color:#f97316; font-weight:600; text-decoration:none; transition:all 0.3s;">
                       Logout
                    </a>
                </li>
            </c:if>

            <!-- If user is NOT logged in -->
            <c:if test="${empty sessionScope.username}">
                <li>
                    <a href="${pageContext.request.contextPath}/login"
                       style="padding:0.5rem 1rem; border:2px solid #f97316; border-radius:6px; background:#fff; color:#f97316; font-weight:600; text-decoration:none; transition:all 0.3s;">
                       Login
                    </a>
                </li>
                <li>
                    <a href="${pageContext.request.contextPath}/signup"
                       style="padding:0.5rem 1rem; border:2px solid #f97316; border-radius:6px; background:#fff; color:#f97316; font-weight:600; text-decoration:none; transition:all 0.3s;">
                       Signup
                    </a>
                </li>
            </c:if>
        </ul>
    </nav>
</header>

<!-- Small inline hover style -->
<style>
    header nav a:hover {
        background:#f97316 !important;
        color:#fff !important;
    }
</style>
