package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import models.User;
import util.DbUtil;

/**
 * Created by Ivan Minchev on 10/9/2017.
 */
public class UserDao {
    private Connection connection;

    public UserDao() {
        connection = DbUtil.getConnection();
    }

    public void addUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("INSERT INTO users(firstname, lastname, dob, phonenumber, email) VALUES (?, ?, ?, ?, ?)");
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getPhoneNumber());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.executeUpdate();
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }

    public void deleteUser(int userId) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("DELETE FROM users WHERE userid=?");
            preparedStatement.setInt(1, userId);
            preparedStatement.executeUpdate();
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }

    public void updateUser(User user) {
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("UPDATE users SET firstname=?, lastname=?, dob=?, phonenumber=?, email=?"
                     + "WHERE userid=?");
            preparedStatement.setString(1, user.getFirstName());
            preparedStatement.setString(2, user.getLastName());
            preparedStatement.setDate(3, new java.sql.Date(user.getDob().getTime()));
            preparedStatement.setString(4, user.getPhoneNumber());
            preparedStatement.setString(5, user.getEmail());
            preparedStatement.setInt(6, user.getUserid());
            preparedStatement.executeUpdate();
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
    }

    public List<User> getAllUsers(String sequence) {

        List<User> users = new ArrayList<>();
        try {
            String query = "";
            switch (sequence) {
                case "regular" :
                    query = "SELECT * FROM users";
                    break;
                case "sortbylastname":
                    query = "SELECT * FROM users ORDER BY lastName ASC";
                    break;
                case "sortbydate":
                    query = "SELECT * FROM users ORDER BY dob ASC";
                    break;
            }
            Statement statement = connection.createStatement();
//            ResultSet rs = statement.executeQuery("SELECT * FROM users");
            ResultSet rs = statement.executeQuery(query);
            while (rs.next()) {
                User user = new User();
                user.setUserid(rs.getInt("userid"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setPhoneNumber(rs.getString("phonenumber"));
                user.setEmail(rs.getString("email"));
                users.add(user);
            }
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
        return users;
    }

    public User getUserById(int userId) {
        User user = new User();
        try {
            PreparedStatement preparedStatement = connection
                    .prepareStatement("SELECT * FROM USERS WHERE userid=?");
            preparedStatement.setInt(1, userId);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                user.setUserid(rs.getInt("userid"));
                user.setFirstName(rs.getString("firstname"));
                user.setLastName(rs.getString("lastname"));
                user.setDob(rs.getDate("dob"));
                user.setPhoneNumber(rs.getString("phonenumber"));
                user.setEmail(rs.getString("email"));
            }
        } catch (SQLException sqlex) {
            sqlex.printStackTrace();
        }
        return user;
    }
}
