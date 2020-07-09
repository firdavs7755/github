<%@ page import="uz.lesson.db.CategoryTable" %>
<%@ page import="uz.lesson.models.Category" %><%--
  Created by IntelliJ IDEA.
  User: User
  Date: 10.12.2019
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>category list</title>
    <link rel="stylesheet" href="../css/metro.css">
    <link rel="stylesheet" href="../css/metro-schemes.min.css">
    <script src="../js/jquery-1.11.3.min.js"></script>
    <script src="../js/metro.js"></script>
</head>
<body>
<div class="container">
    <%@include file="menuBar.jsp" %>
    <div style="margin-top: 100px" class="row">
        <h3 class="header">List of categories</h3>
        <table class="table striped hovered">
            <thead>
                <tr>
                    <td width="15%">id</td>
                    <td>title</td>
                    <td width="20%">actions</td>
                </tr>
            </thead>
            <tbody>
                <%
                    for (Category category : CategoryTable.getInstance().allCategories()) {%>
                        <tr>
                            <td><%=category.getId()%></td>
                            <td><%=category.getTitle()%></td>
                            <td>
                                <a href="/admin/addEditCategory.jsp?id=<%=category.getId()%>" class="button success">edit</a>
                                <a href="/delete?kind=category&id=<%=category.getId()%>" onclick="return confirm('are you sure want to delete?')" class="button warning">delete</a>
                            </td>
                        </tr>
                <%  }%>
            </tbody>
        </table>
        <a href="/admin/addEditCategory.jsp" class="button primary float-left">Add</a>
    </div>
</div>
</body>
</html>
