package backend;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnector {

    private final String ip = "localhost";
    private final int port = 3306;
    private final String database = "cupcakeproject";
    private final String username = "seer";
    private final String password = "Hest123@hest.dk";
    private Connection conn = null;
    //test

    public Connection connectDB()
    {
        try
        {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            String url = "jdbc:mysql://" + ip + ":" + port + "/" + database;
            conn = (Connection) DriverManager.getConnection(url, username, password);
        } catch (ClassNotFoundException | IllegalAccessException | InstantiationException | SQLException e)
        {
            System.err.println(e);
        }
        return conn;
    }

}
