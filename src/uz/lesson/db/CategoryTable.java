package uz.lesson.db;
import uz.lesson.models.Category;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.*;

public class CategoryTable {
    private static CategoryTable instance;

    public static CategoryTable getInstance(){
        if (instance==null){
            instance = new CategoryTable();
        }
        return instance;
    }

    private CategoryTable(){
        this.statement = MyConnection.get().getStatement();
    }

    private Statement statement;

    public void saveCategory(Category category) throws SQLException {
        category.setTitle(category.getTitle().replace("'","''"));
        if (category.getId() != -1){//edit
            String query = String.format("update category set title='%s' where id=%d"
                    ,category.getTitle(),category.getId());
            statement.executeUpdate(query);
        }else {//add
            String query = String.format("insert into category (title) values ('%s')" , category.getTitle());
            statement.executeUpdate(query);
        }
    }

    public Collection<Category>allCategories() throws SQLException {
        List<Category> categories = new LinkedList<>();
        ResultSet resultSet = statement.executeQuery("select  * from category");
        while (resultSet.next()){
            Category category = new Category();
            category.setId(resultSet.getInt("id"));
            category.setTitle(resultSet.getString("title"));
            categories.add(category);
        }
        return categories;
    }

    public  void deleteCategory(int id) throws SQLException {
        statement.executeUpdate("delete  from category where id="+id);
    }

    public Category findById(int id) throws SQLException {
        ResultSet resultSet = statement.executeQuery("select * from category where id = "+id);
        Category category = null;
        if (resultSet.next()){
            category = new Category();
            category.setId(resultSet.getInt("id"));//ustun nomi
            category.setTitle(resultSet.getString("title"));
        }
        return category;
    }


}
