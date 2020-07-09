<%@ page import="uz.lesson.models.Category" %>
<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="java.util.List" %>
<%@ page import="java.util.ArrayList" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2019
  Time: 12:29
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<%
    int id=-1;
    try{
        id = Integer.parseInt(request.getParameter("id"));//parametr categoryListni edit tugmasidan kelyabdi.Yoki mav. emas
    }catch (Exception e){}
    if (request.getMethod().equalsIgnoreCase("post")){
        String title = request.getParameter("title");

        Category category=new Category();
        category.setId(id);
        category.setTitle(title);
        CategoryTable.getInstance().saveCategory(category);
        response.sendRedirect("/admin/categoryList.jsp");
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
    <h3 style="margin-top: 100px"> <%=id==-1?"Add":"Edit"%> Category</h3>
    <div class="row">
        <form action="" method="post">
            <input type="hidden" value="<%=id%>">
            <input type="text" name="title" placeholder="Enter title" value=<%=id==-1?"":CategoryTable.getInstance().findById(id).getTitle()%> >
            <button type="submit" class="button primary">save</button>
        </form>
    </div>
</div>

</body>
</html>
