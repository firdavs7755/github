package uz.lesson.db;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;

public class MyConnection {

    private Connection connection;
    private Statement statement;

    private MyConnection(){
        try {
            Class.forName("org.postgresql.Driver").newInstance();
            connection = DriverManager.getConnection("jdbc:postgresql://localhost:5432/java_db","java_user","java_user");
            statement = connection.createStatement();
        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
        } catch (IllegalAccessException e) {
            e.printStackTrace();
        } catch (InstantiationException e) {
            e.printStackTrace();
        }
    }

    private static MyConnection instance;

    public static MyConnection get(){
        if (instance==null){
            instance = new MyConnection();
        }
        return instance;
    }

    public Statement getStatement(){
        return this.statement;//16-qatorni chaqirib beradi
    }

}
