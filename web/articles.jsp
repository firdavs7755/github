<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.ArticleTable" %>
<%@ page import="uz.lesson.models.Article" %>
<%@ page import="uz.lesson.utils.DateUtils" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2019
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Articles</title>
    <link rel="stylesheet" href="css/metro.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap-4.4.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/metro-schemes.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/metro.js"></script>
    <style>
        .step-list > li:before {
            content: "";
        }

        .step-list {
            margin: 0;
        }

        .row .col-md-12 .app-bar .app-bar-menu a.active {
            background-color: #ce352c;
        }

        .row:nth-child(2) .col-md-3 ul li.active {
            background-color: #a72b26;
        }

    </style>
</head>
<body>

<%
    int c = -1;
    if (request.getParameter("c") != null) {
        try {
            c = Integer.parseInt(request.getParameter("c"));
        } catch (Exception e) {
        }
    }
    if (c == -1) {
        try {
            c = CategoryTable.getInstance().allCategories().iterator().next().getId();
        } catch (Exception e) {
        }
    }
%>

<div class="container-fluid">
    <div class="row mb-3">
        <div class="col-md-12">
            <div data-role="appbar" style="color: #f1f1f1;" class="darcula app-bar  header" data-expand-point="md">
                <a href="/index.jsp" class="brand no-hover">
                    OJD.uz
                </a>
                <ul class="app-bar-menu">
                    <li><a href="/index.jsp">Home</a></li>
                    <li>
                        <a href="/articles.jsp" class="active">Articles</a>
                    </li>
                    <li>
                        <a href="/top_articles.jsp">Top Articles</a>
                    </li>
                    <li><a href="#">Contact us</a></li>
                </ul>
            </div>

        </div>
    </div>
    <%--    ---------------------------------------%>
    <div class="row mt-5">
        <div class="col-md-3">
            <ul style="margin: 20px;background-color: rgba(44,43,42,0.93); color: #f1f1f1;" class="sidebar-menu">
                <%for (Category category : CategoryTable.getInstance().allCategories()) {%>
                <li class="<%=c==category.getId()?" active":""%> ">
                    <a href="articles.jsp?c=<%=category.getId()%>"><%=category.getTitle()%>
                    </a>
                </li>
                <%}%>
            </ul>
        </div>




         

        <div class="col-md-9">
            <ul class="step-list">
                <%
                    for (Article article : ArticleTable.get().getCategoryArticles(c)) {
                        if (!article.isPublished()) continue;
                %>

                <li>
                    <h2><%=article.getTitle()%>
                        <span class="place-right">
                        <span class="text-small"><b>Views</b>:<%=article.getSeenCount()%></span>
                        <span class="text-small"><b>  Published date</b>:<%=DateUtils.formatDate(article.getCreatedDate())%></span>
                        </span>
                        <span class="clear-fix"></span>
                    </h2>

                    <hr class="bg-cobalt-focus">
                    <div>
                        <p><%=article.getContent().length()>300?article.getContent().substring(0,300).concat(" ..."):article.getContent()%>
                            <br>
                            <a href="/view.jsp?c=<%=c%>&id=<%=article.getId()%>"
                               class="button dark place-right">More</a>
                            <span class="clear-fix"></span>
                    </div>
                </li>
                <%}%>
            </ul>
        </div>
    </div>

</div>
</body>
</html>
