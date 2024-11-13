package com.User.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.User.model.User;

public class UserDAO {
	
	private String jdbcURL="jdbc:mysql://localhost:30006/Edonationwebsite";
    private String jdbcUserName="root";
    private String jdbcPasssword="root";
    
    
    private static final String INSERT_USER_SQL="Insert into Users"+"(user_id, username, email, password_hash, role) VALUES"+"(?,?,?,?,?);";
    private static final String SELECT_USER_BY_ID="SELECT * from USERS WHERE user_id =?;";
    private static final String SELECT_ALL_USERS = "SELECT * FROM USERS;";
    private static final String DELETE_USERS_SQL="DELETE FROM USERS WHERE user_id=?;";
    private static final String UPDATE_USERS_SQL="UPDATE USERS SET username=?,email=?,password_hash=?,role=? WHERE user_id=?;";
	private static final String SEELECT_USER_BY_ID = null;
	
    
    public UserDAO() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    public Connection getConnection() {
    	Connection connection=null;
    	
    	try {
    		Class.forName("com.mysql.cj.jdbc.Driver");
    		connection = DriverManager.getConnection(jdbcURL,jdbcUserName,jdbcPassword);
    	}catch(SQLException | ClassNotFoundException e) {
    		e.printStackTrace();
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    	return connection;
    }
    
    public void insertUser(User user) throws SQLException {
    	UserDAO dao = new UserDAO();
    	
    	try(Connection connection = dao.getConnection())
    	{
    		PreparedStatement preparedStatement = connection.prepareStatement(INSERT_USER_SQL);
    		preparedStatement.setString(1, user.getUsername());
    		preparedStatement.setString(2, user.getEmail());
    		preparedStatement.setString(3,user.getPassword_hash());
    		
    		preparedStatement.executeUpdate();
    	}
    	catch(Exception e) {
    		e.printStackTrace();
    	}
    }
    
    public User selectUser(int user_id) {
    	User user = new User();
    	UserDAO dao = new UserDAO();
    	
    	try(Connection connection = dao.getConnection()){
    		
    	    PreparedStatement preparedStatement=connection.prepareStatement(SEELECT_USER_BY_ID);
    		preparedStatement.setInt(1, user_id);
    		
    		ResultSet resultSet = preparedStatement.executeQuery();
    		
    		while(resultSet.next()) {
    			user.setUser_id(user_id);
    			user.setUsername(resultSet.getString("username"));
    			user.setEmail(resultSet.getString("email"));
    			user.setPassword_hash(resultSet.getString("password_hash"));
    		}
    		
    	    
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	return user;
    }
    
    public List<User> selectAllUsers(){
    	List<User> users = new ArrayList<User>();
    	UserDAO dao = new UserDAO();
    	try(Connection connection = dao.getConnection()){
    		PreparedStatement preparedStatement = connection.prepareStatement(SELECT_ALL_USERS);
    		ResultSet resultSet = preparedStatement.executeQuery();
    		
    		while(resultSet.next()) {
    			int id = resultSet.getInt()
    		}
    		
    	}catch(Exception e) {
    		e.printStackTrace();
    	}
    	
    }
    
    
}
