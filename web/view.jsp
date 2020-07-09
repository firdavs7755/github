<%@ page import="com.sun.org.apache.xalan.internal.xsltc.dom.AdaptiveResultTreeImpl" %>
<%@ page import="uz.lesson.models.Article" %>
<%@ page import="uz.lesson.db.ArticleTable" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 09.01.2020
  Time: 16:32
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>

    <link rel="stylesheet" href="css/metro.css">
    <link rel="stylesheet" href="css/bootstrap.css">
    <link rel="stylesheet" href="bootstrap-4.4.0-dist/css/bootstrap.css">
    <link rel="stylesheet" href="css/metro-schemes.min.css">
    <script src="js/jquery-1.11.3.min.js"></script>
    <script src="js/metro.js"></script>

<%
    int id = -1;
    try{
        id = Integer.parseInt(request.getParameter("id"));
        ArticleTable.get().increaseSeenCount(id);
    }catch (Exception e){
        response.sendRedirect("404.html");
    }
    Article article = ArticleTable.get().findArticleById(id);
    if (article==null){
        response.sendRedirect("404.html");
    }
%>

    <style>
        /*body{*/
        /*    background: url("img/asde.PNG");*/
        /*    background-repeat: no-repeat;*/
        /*    background-size: cover;*/
        /*}*/
        #content-text{
            border: 1px gray solid;
            padding: 15px;
            text-align: justify;
            line-height: 1.5;
            font-size: 16px;
            box-shadow: 0 0 20px rgba(58, 158, 255, 0.65);
            border-radius: 0px;
            margin-bottom: 20px;
        }
    </style>

</head>
<body>

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
                        <a href="/articles.jsp">Articles</a>
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
        <div class="col-md-10 offset-1">
            <h1>
                <a onclick="window.history.back()" class="button">Back</a>
                <%=article.getTitle()%>
            </h1>
            <p id="content-text">
                <%=article.getContent()%>
            </p>
        </div>
    </div>

</div>
</body>
</html>
