package uz.lesson.servlets;

import uz.lesson.db.ArticleTable;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;

public class  ArticlePublishServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        boolean published = Boolean.parseBoolean(req.getParameter("published"));
        int articleId = Integer.parseInt(req.getParameter("articleId"));
        int categoryId = Integer.parseInt(req.getParameter("categoryId"));
        try {
            ArticleTable.get().changePublishStatus(articleId,published);
        } catch (SQLException e) {
            e.printStackTrace();
        }

        System.out.println(published+"-"+articleId+"-"+categoryId);
    }
}
