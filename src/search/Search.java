package search;
import models.User;
import util.DbUtil;

import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.DriverManager;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Created by Ivan Minchev on 10/10/2017.
 */
public class Search extends HttpServlet {
    private static Connection connection = null;
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        Statement statement;
        try {
            Properties prop = new Properties();
            InputStream inputStream = Search.class.getClassLoader().getResourceAsStream("/db.properties");
            prop.load(inputStream);
            String driver = prop.getProperty("driver");
            String url = prop.getProperty("url");
            String user = prop.getProperty("user");
            String password = prop.getProperty("password");
            Class.forName(driver).newInstance();
            connection = DriverManager.getConnection(url, user, password);

            String searchedUser = request.getParameter("search");

            List<User> users = new ArrayList<>();

            //Query - full match
//            String query = "SELECT * FROM users WHERE firstname='" + searchedUser + "' ";

            //Query - partial match
            String query = "SELECT * FROM users WHERE firstname LIKE '%" + searchedUser + "%'";
            statement = connection.createStatement();
            ResultSet rs = statement.executeQuery(query);

            while (rs.next()) {
                User searchUser = new User();
                searchUser.setUserid(rs.getInt("userid"));
                searchUser.setFirstName(rs.getString("firstname"));
                searchUser.setLastName(rs.getString("lastname"));
                searchUser.setDob(rs.getDate("dob"));
                searchUser.setPhoneNumber(rs.getString("phonenumber"));
                searchUser.setEmail(rs.getString("email"));
                users.add(searchUser);
            }

            request.setAttribute("users", users);
            RequestDispatcher view = request.getRequestDispatcher("/searchview.jsp");
            view.forward(request, response);
            connection.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
