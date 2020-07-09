<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.ArticleTable" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 12.12.2019
  Time: 3:55
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/metro.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/metro-schemes.min.css">
    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/metro.js"></script>
</head>
<body>
<button class="button" onclick="showNotify(alert(document.location.href='https://www.google.com/'));">Notify Me</button>
<h1>da</h1>
<div class="list">
    <%
        int i = 0;
        for (Category category : CategoryTable.allCategories()) {
            i++;
    %>
    <a href="articleList.jsp?categoryid=<%=category.getId()%>" data-id="<%=category.getId()%>">
        <div class="list-group-item" data-id="<%=category.getId()%>">
            <span class=""><%=category.getTitle()%></span><br>
            <span class="text-muted">Article Count:<%=ArticleTable.getCategoryArticleCount(category.getId())%></span>
        </div>
    </a>
    <%}%>
</div>

<button class="button secondary" onclick="showSetupDemo()">Setup demo</button>
<script>
    function showSetupDemo(){
        var notify = Metro.notify;
        notify.setup({
            width: 300,
            duration: 1000,
            animation: 'easeOutBounce'
        });
        notify.create("This is a notify");
        notify.reset();
    }
</script>
</body>
</html>
