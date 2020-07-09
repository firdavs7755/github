<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Article" %>
<%@ page import="uz.lesson.db.ArticleTable" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2019
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int id = -1;
    int categoryId = -1;
    try {
        id = Integer.parseInt(request.getParameter("id"));
        categoryId = Integer.parseInt(request.getParameter("categoryid"));
    } catch (Exception e) {
    }
    if (request.getMethod().equalsIgnoreCase("post")) {
        String title = request.getParameter("title");
        categoryId = Integer.parseInt(request.getParameter("category_id"));
        String content = request.getParameter("content");

        Article article = new Article();
        article.setId(id);
        article.setTitle(title);
        article.setCategoryId(categoryId);
        article.setContent(content);

        ArticleTable.get().saveArticle(article);
        response.sendRedirect("articleList.jsp?categoryid="+article.getCategoryId());
    }

    //todo edit mode
    Article article = null;
    if (id!=-1) {
        article = ArticleTable.get().findArticleById(id);
    }
%>

<html>
<head>
    <title>Title</title>
    <link rel="stylesheet" href="../css/metro.css">
    <link rel="stylesheet" href="../css/metro-icons.css">
    <link rel="stylesheet" href="../css/metro-schemes.min.css">
    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/metro.js"></script>
</head>
<body>
<%@include file="menuBar.jsp"%>
<div class="container">
    <h3 style="margin-top: 100px"><%=id == -1 ? "Add" : "Edit"%> Article</h3>
    <label>Select Ariticle category</label>
    <form action="" method="post">
        <input type="hidden" name="id" value="<%=id%>">
        <input type="hidden" name="old_category_id" value="<%=categoryId%>">
        <div class="row">
            <div class="col-md-3 col-sm-12">
                <select data-role="select" id="category_id" name="category_id">
                    <%for (Category category : CategoryTable.getInstance().allCategories()) {%>
                    <option class="fg-cyan" value="<%=category.getId()%>"> <%=category.getTitle()%> </option>
                    <%}%>
                </select>
            </div>
            <div class="col-md-3 col-sm-12">
                <input type="hidden" value="<%=id%>">
                <input type="text" name="title" placeholder="<%=id==-1?"Enter":"Change"%> artice title"
                       value=<%=id==-1?"":ArticleTable.get().findArticleById(id).getTitle()%>>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <%if (id==-1){%>
                <textarea  name="content" class="textarea" rows="5"></textarea>
                <%}else {%>
                <textarea  name="content" class="textarea" rows="5"><%=ArticleTable.get().findArticleById(id).getContent()%></textarea>
                <%}%>
            </div>
        </div>
        <div class="row">
            <div class="col-md-6 col-sm-12">
                <button type="submit" class="float-right button primary">save</button>
            </div>
        </div>
    </form>
</div>
</body>
<%if(id!=-1){%>
<script>
    $('#category_id').val(<%=categoryId%>);
</script>
<%}%>
</html>
