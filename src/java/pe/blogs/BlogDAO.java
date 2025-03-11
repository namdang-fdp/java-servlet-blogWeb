package pe.blogs;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import pe.utils.DBUtils;
import java.sql.Date;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.logging.Level;
import java.util.logging.Logger;

public class BlogDAO {
            public List<BlogDTO> getAllBlogs() {
                        ArrayList<BlogDTO> blogList = new ArrayList<>();
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "SELECT PostID, Title, Content, Author, PublishDate from BlogPosts";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    ResultSet rs = stmt.executeQuery();
                                    while(rs.next()) {
                                                int  postID = rs.getInt("PostID");
                                                String title = rs.getString("Title");
                                                String content = rs.getString("Content");
                                                String author = rs.getString("Author");
                                                Date  publishDate = rs.getDate("PublishDate"); 
                                                BlogDTO newBlog = new BlogDTO(postID, title, content, author, publishDate);
                                                blogList.add(newBlog);
                                    }
                                    return blogList;    
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return null;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return null;
                        }
            }
            
            public List<BlogDTO> searchByTitle(String searchTitle) {
                         ArrayList<BlogDTO> blogList = new ArrayList<>();
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "SELECT PostID, Title, Content, Author, PublishDate from BlogPosts ";
                                    sql += "WHERE title LIKE  ? ";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    stmt.setString(1, "%" + searchTitle + "%");
                                    ResultSet rs = stmt.executeQuery();
                                    while(rs.next()) {
                                                int  postID = rs.getInt("PostID");
                                                String title = rs.getString("Title");
                                                String content = rs.getString("Content");
                                                String author = rs.getString("Author");
                                                Date  publishDate = rs.getDate("PublishDate"); 
                                                BlogDTO newBlog = new BlogDTO(postID, title, content, author, publishDate);
                                                blogList.add(newBlog);
                                    }
                                    return blogList;    
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return null;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return null;
                        }
            }
            
            public List<BlogDTO> searchByDate(LocalDate searchDate) {
                        ArrayList<BlogDTO> blogList = new ArrayList<>();
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "SELECT PostID, Title, Content, Author, PublishDate from BlogPosts ";
                                    sql += "WHERE PublishDate LIKE ?";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    stmt.setDate(1,  Date.valueOf(searchDate));
                                    ResultSet rs = stmt.executeQuery();
                                    while(rs.next()) {
                                                int  postID = rs.getInt("PostID");
                                                String title = rs.getString("Title");
                                                String content = rs.getString("Content");
                                                String author = rs.getString("Author");
                                                Date  publishDate = rs.getDate("PublishDate"); 
                                                BlogDTO newBlog = new BlogDTO(postID, title, content, author, publishDate);
                                                blogList.add(newBlog);
                                    }
                                    return blogList;    
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return null;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return null;
                        }
            }
            
            public BlogDTO  responseBlog(String id) {
                        BlogDTO newBlog = new BlogDTO();
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "SELECT PostID, Title, Content, Author, PublishDate from BlogPosts ";
                                    sql += "WHERE PostID  = ? ";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    stmt.setString(1, id);
                                    ResultSet rs = stmt.executeQuery();
                                    while(rs.next()) {
                                                int  postID = rs.getInt("PostID");
                                                String title = rs.getString("Title");
                                                String content = rs.getString("Content");
                                                String author = rs.getString("Author");
                                                Date  publishDate = rs.getDate("PublishDate"); 
                                                newBlog = new BlogDTO(postID, title, content, author, publishDate);
                                    }
                                    return newBlog;    
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return null;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return null;
                        }
            }
            public int  updateBlog(String id, String title, String content, String author, LocalDate publishDate) {
                        BlogDTO newBlog = new BlogDTO();
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "UPDATE BlogPosts ";
                                    sql += "SET Title = ? ,  Author = ?, PublishDate = ?, Content = ? ";
                                    sql += "WHERE PostID = ? ";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    stmt.setString(1, title);
                                    stmt.setString(2, author);
                                    stmt.setDate(3, Date.valueOf(publishDate));
                                    stmt.setString(4, content);
                                    stmt.setString(5, id);
                                    int success = stmt.executeUpdate();
                                     return success;
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return 0;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return 0;
                        }
            }
            public int getMaxId() {
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "SELECT MAX(PostID) AS maxId FROM BlogPosts ";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    ResultSet rs = stmt.executeQuery();
                                    if(rs.next()) {
                                            return rs.getInt("maxId");
                                    }
                                    return -1;    
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return -1;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return -1;
                        }
            }
            public int  createBlog(String title, String content, String author, LocalDate publishDate) {
                        int id = getMaxId() + 1;
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "INSERT INTO BlogPosts (PostID, Title, Content, Author, PublishDate) ";
                                    sql += "VALUES (? , ? , ? , ? , ?) ";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    stmt.setInt(1, id);
                                    stmt.setString(2, title);
                                    stmt.setString(3, content);
                                    stmt.setString(4, author);
                                    stmt.setDate(5, Date.valueOf(publishDate));
                                    int success = stmt.executeUpdate();
                                     return success;
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return 0;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return 0;
                        }
            }
            public int  deleteBlog(String id) {
                        try {
                                    Connection con = DBUtils.getConnection();
                                    String sql = "DELETE FROM BlogPosts WHERE PostID = ?";
                                    PreparedStatement stmt = con.prepareStatement(sql);
                                    stmt.setString(1, id);
                                    int success = stmt.executeUpdate();
                                     return success;
                        } catch (SQLException e) {
                                    System.out.println("Cannot connect to the database. Error: " + e.getMessage());
                                    e.printStackTrace();
                                    return 0;
                        } catch (ClassNotFoundException ex) {
                                    System.out.println("Class not found. Check your class");
                                    Logger.getLogger(BlogDAO.class.getName()).log(Level.SEVERE, null, ex);
                                    return 0;
                        }
            }
}
