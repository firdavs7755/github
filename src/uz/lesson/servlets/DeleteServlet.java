package uz.lesson.servlets;

import uz.lesson.db.ArticleTable;
import uz.lesson.db.CategoryTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class DeleteServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        String kind = req.getParameter("kind");
        switch (kind){
            case "category":{
                int id = Integer.parseInt(req.getParameter("id"));
                try {
                    CategoryTable.getInstance().deleteCategory(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                resp.sendRedirect("/admin/categoryList.jsp");
                break;
            }
            case "article":{
                int categoryId = Integer.parseInt(req.getParameter("categoryid"));
                int id = Integer.parseInt(req.getParameter("id"));
                try {
                    ArticleTable.get().deleteArticleById(id);
                } catch (SQLException e) {
                    e.printStackTrace();
                }
                resp.sendRedirect("/admin/articleList.jsp?categoryid="+categoryId);
                break;
            }
            default:{
                resp.sendRedirect("404.html");
            }
        }
    }
}
