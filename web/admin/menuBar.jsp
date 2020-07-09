<div class="container mb-5">
    <div class="row">
        <div class="col-md-7 col-sm-12">
            <div data-role="appbar" class="app-bar green header" data-expand-point="md">
                <a href="/admin/index.jsp" class="brand no-hover">
                    administration
                </a>
                <ul class="app-bar-menu">
                    <li><a href="#">Home</a></li>
                    <li>
                        <a href="#" class="dropdown-toggle">Categories</a>
                        <ul class="d-menu" data-role="dropdown">
                            <li><a href="/admin/categoryList.jsp">Existing categories</a></li>
                            <li><a href="/admin/addEditCategory.jsp">Add categories</a></li>
                        </ul>
                    </li>
                    <li>
                        <a href="#" class="dropdown-toggle">Articles</a>
                        <ul class="d-menu" data-role="dropdown">
                            <li><a href="/admin/articleList.jsp">Existing articles</a></li>
                            <li><a href="/admin/addEditArticle.jsp">Add article</a></li>
                        </ul>
                    </li>
                    <li><a href="#">Contacts</a></li>
                </ul>
                <div class="float-right">
                    <p class="dropdown-toggle">Hi Admin!</p>
                    <ul class="d-menu green" data-role="dropdown">
                        <li><a href="/login?logout">Log out</a></li>
                    </ul>
                </div>
            </div>
        </div>

    </div>
</div>
