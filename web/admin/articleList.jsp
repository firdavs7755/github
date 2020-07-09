<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.ArticleTable" %>
<%@ page import="uz.lesson.models.Article" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2019
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>article list</title>
    <link rel="stylesheet" href="../css/metro.css">
    <link rel="stylesheet" href="../css/bootstrap.css">
    <link rel="stylesheet" href="../css/metro-schemes.min.css">

    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/metro.js"></script>


</head>
<body>
<%@include file="menuBar.jsp" %>
<%
    int categoryId = -1;
    try {
        categoryId= CategoryTable.getInstance().allCategories().iterator().next().getId();
    }catch (Exception f){}
    try {
        categoryId = Integer.parseInt(request.getParameter("categoryid"));
    }catch (Exception f){}
%>
<div class="container" style="margin-top: 100px">
    <div class="row">
        <div class=" col-md-3">
            <div class="list">
                <%for (Category category : CategoryTable.getInstance().allCategories()) {%>
                <a href="articleList.jsp?categoryid=<%=category.getId()%>" data-id="<%=category.getId()%>">
                    <div class="list-group-item <%=categoryId==category.getId()?"active":""%>" data-id="<%=category.getId()%>">
                        <span><%=category.getTitle()%></span><br>
                        <span class="text-muted">Article Count:<%=ArticleTable.get().getCategoryArticleCount(category.getId())%></span>
                    </div>
                </a>
                <%}%>
            </div>
        </div>
        <div class="col-md-8">
            <h3 class="header">List of articles</h3>
            <table class="table striped hovered">
                <thead>
                <tr>
                    <td width="15%">id</td>
                    <td>title</td>
                    <td width="20%">actions</td>
                    <td width="10%">Publish</td>
                </tr>
                </thead>
                <tbody>
                <%for (Article  article : ArticleTable.get().getCategoryArticles(categoryId)){%>
                <tr>
                    <td><%=article.getId()%></td>
                    <td><%=article.getTitle()%></td>
                    <td>
                        <a href="/admin/addEditArticle.jsp?id=<%=article.getId()%>&categoryid=<%=categoryId%>" class="button success">edit</a>
                        <a href="/delete?kind=article&id=<%=article.getId()%>&categoryid=<%=categoryId%>" onclick="return confirm('are you sure you want to delete?')" class="button warning">delete</a>
                    </td>
                    <td>
                        <label class="switch-orginal">
                            <input type="checkbox" <%=article.isPublished()?"checked":""%> class="publisher"
                                data-id="<%=article.getId()%>"
                                   data-category-id="<%=article.getCategoryId()%>"
                            >
                            <span class="check"></span>
                        </label>
                    </td>
                </tr>
                <%}%>
                </tbody>
            </table>
        </div>
    </div>
</div>
</body>
<script>
   $('.publisher').on('change',function () {
       var published = $(this).is(':checked');
       var articleId = $(this).attr('data-id');
       var categoryId = $(this).attr('data-category-id');
       $.ajax({
           url:'/admin/publish',
           data:{
               published : published,
               articleId : articleId,
               categoryId : categoryId
           },
           method:'get',
           success :alert('lorem')
        })
   })
</script>
</html>
