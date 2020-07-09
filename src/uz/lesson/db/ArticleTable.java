package uz.lesson.db;

import com.sun.xml.internal.ws.server.ServerRtException;
import javafx.print.Collation;
import uz.lesson.models.Article;

import javax.servlet.http.HttpServlet;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class ArticleTable {
    private static ArticleTable instance;

    public static ArticleTable get(){
        if (instance==null){
            instance = new ArticleTable();
        }return instance;
    }

    private Statement statement;
    private ArticleTable(){
        this.statement = MyConnection.get().getStatement();
    }

    public void saveArticle(Article article) throws SQLException{
        article.setTitle(article.getTitle().replace("'","''"));
        article.setContent(article.getContent().replace("'","''"));
        String query = null;
        if (article.getId() == -1) {//add
            query = String.format("insert into article (title,content,category_id) values ('%s','%s',%d)",
                    article.getTitle(),article.getContent(),article.getCategoryId());
            statement.executeUpdate(query);
        }else {//edit
            query = String.format("update article set title='%s',content='%s',category_id=%d where id=%d",
                    article.getTitle(),article.getContent(),article.getCategoryId(),article.getId());
            statement.executeUpdate(query);
        }
    }

    public int getCategoryArticleCount(int categoryId) throws SQLException {
        int count = 0;
        ResultSet set = statement.executeQuery("select count(*) as count from article where category_id="+categoryId);
        set.next();
        count = set.getInt("count");
        return count;
    }

    public Collection<Article> getCategoryArticles(int categoryId) throws SQLException {
       List<Article> articles = new LinkedList<>();
       ResultSet resultSet = statement.executeQuery("select *from article where category_id="+categoryId);
       while (resultSet.next()){
           articles.add(resultToArticle(resultSet));
       }
        return articles;
    }

    public void deleteArticleById(int articleId) throws SQLException {
        statement.executeUpdate(String.format("delete from article where id = %d",articleId));
    }

    public  Article findArticleById(int articleId) throws SQLException {
        Article article = null;
        ResultSet set = statement.executeQuery("select  *from article where id="+articleId);
        if (set.next()){
            article = resultToArticle(set);
        }
        return article;
    }

    public void changePublishStatus(int articleId,boolean status) throws SQLException {
        String query = String.format("update article set is_published=%b where id=%d",status,articleId);
        statement.executeUpdate(query);
    }

    public List<Article> getTopArticles() throws SQLException {
        List<Article> allArticles = new LinkedList<>();
        ResultSet set = statement.executeQuery("select * from article order by seen_count desc limit 10");
        while (set.next()){
            allArticles.add(resultToArticle(set));
        }
        return allArticles;
    }

    private Article resultToArticle(ResultSet set) throws SQLException {
        Article article = new Article();
        article.setId(set.getInt("id"));
        article.setTitle(set.getString("title"));
        article.setContent(set.getString("content"));
        article.setCategoryId(set.getInt("category_id"));
        article.setPublished(set.getBoolean("is_published"));
        article.setCreatedDate(new Date(set.getTimestamp("created_date").getTime()));
        article.setSeenCount(set.getInt("seen_count"));
        return article;
    }

    public void increaseSeenCount(int articleId) throws SQLException {
        statement.executeUpdate("update article set seen_count = seen_count+1 where id="+articleId);
    }
}
