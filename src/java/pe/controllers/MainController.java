package pe.controllers;

import java.io.IOException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.*;
import pe.users.UserDAO;
import pe.users.UserDTO;
import pe.blogs.BlogDAO;
import pe.blogs.BlogDTO;

public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "loginPage/login.jsp";
    private static final String BLOG_PAGE = "blogPage/blogPage.jsp";
    private static final String BLOG_DETAIL = "blogDetailPage/blogDetail.jsp";
    private static final String BLOG_EDIT = "blogEditPage/blogEdit.jsp";
    private static final String BLOG_ERROR = "errorPage/errorPage.jsp";
    private static final String BLOG_CREATE = "blogCreatePage/blogCreate.jsp";
    private static final String CART_PAGE = "cartPage/cartPage.jsp";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        // Trang mặc định
        String url = LOGIN_PAGE;

        try {
            String action = request.getParameter("action");
            HttpSession session = request.getSession();
            BlogDAO blogDao = new BlogDAO();
            // search --> session != null
            if ("login".equalsIgnoreCase(action) || session == null) {
                    if("login".equalsIgnoreCase(action)) {
                    String username = request.getParameter("username");
                    
                    String password = request.getParameter("password");

                    UserDAO userDao = new UserDAO();
                    UserDTO user = userDao.login(username, password);

                    if (user != null) {
                        session = request.getSession(true);
                        session.setAttribute("usersession", user);
                        List<BlogDTO> cart = new ArrayList<>();
                        session.setAttribute("usercart", cart);
                        List<BlogDTO> blogList = blogDao.getAllBlogs();
                        request.setAttribute("BLOG_LIST", blogList);
                        url = BLOG_PAGE;
                    } else {
                        request.setAttribute("LOGIN_ERROR", "Invalid username or password!");
                        url = LOGIN_PAGE;
                    }
                } 
            }
            else if(request.getParameter("action").equalsIgnoreCase("Searching")) {
                        String keyword = request.getParameter("keyword");
                        List<BlogDTO> blogList = blogDao.searchByTitle(keyword);
                        request.setAttribute("BLOG_LIST", blogList);
                        url = BLOG_PAGE; 
            }
            else if(request.getParameter("action").equalsIgnoreCase("searchingByDate")) {
                        String keyword = request.getParameter("keyword");
                        LocalDate searchDate = LocalDate.parse(keyword);
                        List<BlogDTO> blogList = blogDao.searchByDate(searchDate);
                        request.setAttribute("BLOG_LIST", blogList);
                        url = BLOG_PAGE;     
            }
            else if(request.getParameter("action").equalsIgnoreCase("detail")) {
                        session = request.getSession(false);
                        UserDTO user = (UserDTO) session.getAttribute("usersession");
                        String id = request.getParameter("id");
                        BlogDTO blog = blogDao.responseBlog(id);
                        request.setAttribute("BLOG_DETAIL", blog);
                        url = BLOG_DETAIL;       
            }
            else if(request.getParameter("action").equalsIgnoreCase("forwardToEdit")) {
                        session = request.getSession(false);
                        UserDTO user = (UserDTO) session.getAttribute("usersession");
                        String id = request.getParameter("id");
                        BlogDTO blog = blogDao.responseBlog(id);
                        request.setAttribute("BLOG_DETAIL", blog);
                        url = BLOG_EDIT;             
            }
            else if(request.getParameter("action").equalsIgnoreCase("edit")) {
                        session = request.getSession(false);
                        UserDTO user = (UserDTO)session.getAttribute("usersession");
                        String id = request.getParameter("blogId");
                        String title = request.getParameter("title");
                        String content = request.getParameter("content");
                        String author = request.getParameter("author");
                        String publishDate = request.getParameter("publicationDate");    
                        LocalDate updateDate = LocalDate.parse(publishDate);
                        if(id.equals("") || title.equals("") || content.equals("") || author.equals("") || publishDate.equals("") ) {
                                    url = BLOG_ERROR;
                        }
                        else {
                                    int success = blogDao.updateBlog(id, title, content, author, updateDate);
                                    BlogDTO blog = blogDao.responseBlog(id);
                                    request.setAttribute("BLOG_DETAIL", blog);
                                    url = BLOG_DETAIL; 
                        }                        
            }
            else if(request.getParameter("action").equalsIgnoreCase("forwardToCreate")) {
                        session = request.getSession(false);
                        UserDTO user = (UserDTO) session.getAttribute("usersession");
                        url = BLOG_CREATE;  
            }
            else if(request.getParameter("action").equalsIgnoreCase("create")) {
                        session = request.getSession(false);
                        UserDTO user = (UserDTO)session.getAttribute("usersession");             
                        String title = request.getParameter("title");
                        String content = request.getParameter("content");
                        String author = request.getParameter("author");
                        String publishDate = request.getParameter("publicationDate");   
                        LocalDate updateDate = LocalDate.parse(publishDate);
                        if(title.equals("") || content.equals("") || author.equals("") || publishDate.equals("") ) {
                                    url = BLOG_ERROR;
                        }
                        else {
                                    int success = blogDao.createBlog(title, content, author, updateDate);
                                    List<BlogDTO> blogList = blogDao.getAllBlogs();
                                    request.setAttribute("BLOG_LIST", blogList);
                                    url = BLOG_PAGE;
                        }                        
            }
            else if(request.getParameter("action").equalsIgnoreCase("deletePost")) {
                        session = request.getSession(false);
                        UserDTO user = (UserDTO) session.getAttribute("usersession");
                        String id = request.getParameter("postId");
                        int success = blogDao.deleteBlog(id);
                        List<BlogDTO> blogList = blogDao.getAllBlogs();
                        request.setAttribute("BLOG_LIST", blogList);
                        url = BLOG_PAGE;   
            }
            else if(request.getParameter("action").equalsIgnoreCase("addToCart")) {
                        session = request.getSession(false);
                        if (session == null || session.getAttribute("usersession") == null) {
                                    response.sendRedirect("login.jsp");
                                    return;
                        }
                         List<BlogDTO> cart = (List<BlogDTO>) session.getAttribute("usercart");
                         if(cart == null) {
                                    cart = new ArrayList<>();
                                    session.setAttribute("usercart", cart);
                         }
                         int blogId = Integer.parseInt(request.getParameter("blogId"));
                         String title = request.getParameter("title");
                         String content = request.getParameter("content");
                         String author = request.getParameter("author");
                         String publishDate = request.getParameter("publishDate");
                         LocalDate localDate = LocalDate.parse(publishDate);
                         java.sql.Date date = java.sql.Date.valueOf(localDate);
                         cart.add(new BlogDTO(blogId, title, content, author, date));
                        List<BlogDTO> blogList = blogDao.getAllBlogs();
                        request.setAttribute("BLOG_LIST", blogList);
                         url = BLOG_PAGE;
            }
            else if(request.getParameter("action").equalsIgnoreCase("cartShow")) {
                        List<BlogDTO> cart = (List<BlogDTO>) request.getSession().getAttribute("usercart");
                        session.setAttribute("usercart", cart);
                        url = CART_PAGE;
            }
            else if(request.getParameter("action").equalsIgnoreCase("logout")) {
                        session = request.getSession(false);
                        if(session != null) {
                                    session.invalidate();
                        }
                        url = LOGIN_PAGE;
            }
            else {
                url = LOGIN_PAGE;
            }

        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        } finally {
            request.getRequestDispatcher(url).forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Main Controller";
    }

}
