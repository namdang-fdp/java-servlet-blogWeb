package pe.users;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import pe.utils.DBUtils;

public class UserDAO {
        public UserDTO login(String username, String password) throws ClassNotFoundException{
        
        UserDTO user = null;
        try {
                Connection con = DBUtils.getConnection();            
                String sql = " SELECT username, name FROM users ";
                sql += " WHERE username = ?  AND password = ?";
                               
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, username);
                stmt.setString(2, password);
                
                ResultSet rs = stmt.executeQuery();
                if (rs != null){
                    if (rs.next()){
                        user = new UserDTO();                        
                        user.setUsername(rs.getString("username"));
                        user.setName(rs.getString("name"));
                    }
                }
                con.close();
            } catch (SQLException ex) {                
                System.out.println("Error in servlet. Details:" + ex.getMessage());
                ex.printStackTrace(); 
            }
            return user;        
    }
}
