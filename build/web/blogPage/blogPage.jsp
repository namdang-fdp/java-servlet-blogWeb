<%@page import="pe.users.UserDTO"%>
<%@page import="pe.blogs.BlogDTO"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Blog Page</title>
    <link rel="stylesheet" href ="blogPage/blogPage.css">
</head>
<body>
    <% 
        UserDTO user = (UserDTO)session.getAttribute("usersession"); 
        String name =user.getName();
    %>
    <header class="site-header">
        <div class="container">
            <div class="header-left">
                <div class="welcome-container">
                    <div class="welcome-message">Hello <%=name %></div>
                </div>
            </div>
            <div class="header-right">
                <form action="MainController" method="POST" class="logout-btn">
                    <input type="hidden" name="action" value="logout">
                    <button type="submit">Log out</button>
                </form>
            </div>
        </div>
    </header>

    <main class="site-main">
        <div class="container">
            <div class="page-header">
                <h2>Blog Posts</h2>
                <div class="search-forms-container">
                    <form action="MainController" class="search-form" method="GET">
                        <input type="hidden" name="action" value="searching">
                         <div class="search-wrapper">
                                 <div class="search-icon"></div> 
                                <input name="keyword" type="text" class="search-input" placeholder="Search" value="<%=request.getParameter("keyword")!=null?request.getParameter("keyword"):""%>">
                        </div>
                        <button type="submit" class="search-button" value="Search">Search</button>
                     </form>
                </div>
            </div>
             <div class="filter-cart-container">
            <form action="MainController" class="date-search-form" method="GET">
                <input type="hidden" name="action" value="searchingByDate">
                <div class="date-search-wrapper">
                    <div class="date-icon">
                        <svg xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                    </div>
                    <input  name="keyword" type="date" class="date-search-input" placeholder="Filter by date..." value="<%=request.getParameter("keyword")!=null?request.getParameter("keyword"):""%>">
                </div>
                <button type="submit" class="date-search-button">Filter by Date</button>
            </form>
                <form action="MainController" method="GET">
                        <input type="hidden" name="action" value="cartShow">
                        <button type="submit" class="cart-button">
                        <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                          <circle cx="9" cy="21" r="1"></circle>
                          <circle cx="20" cy="21" r="1"></circle>
                          <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                        </svg>
                        My Cart
                      </button>
                    </form>
             </div>
        </div>
    </div>

            <div class="blog-table-container">
                <table class="blog-table">
                    <thead>
                        <tr>
                            <th>Blog ID</th>
                            <th>Title</th>
                            <th>Content</th>
                            <th>Author</th>
                            <th>Publish Date</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                        <%
                                    List <BlogDTO> list = (List <BlogDTO>) request.getAttribute("BLOG_LIST");
                                    for (BlogDTO blog : list){
                                                pageContext.setAttribute("blog", blog);
                            %>
                        <tr>
                            <td>
                                    <form class="blog-id-container" action="MainController" method="GET">
                                                <input type="hidden" name="action" value="detail">
                                                <input type ="hidden" name="id" value="${blog.getId()}">
                                                <div class="blog-id">${blog.getId()}</div>
                                                <button type="submit" class="blog-edit" style="border: none; background: none; cursor: pointer; width: 100%; height: 100%;">✏️</button>
                                    </form>
                            </td>
                            <td class="blog-title"><a href="#">${blog.getTitle()}</a></td>
                            <td class="blog-content">${blog.getContent()}</td>
                            <td class="blog-author">
                                <div class="author-avatar">
                                                <%
                                                  String author = blog.getAuthor();
                                                  String[] parts = author.split(" ");
                                                  String result = "";
                                                  if(parts.length ==  1) {
                                                            result = String.valueOf(parts[0].charAt(0));
                                                  }
                                                  else {
                                                            for(int i = 0; i < 2; i++) {
                                                                        result += parts[i].substring(0, 1);
                                                              }
                                                  }                                                   
                                                    result = result.toUpperCase();
                                                    %>
                                                    <%= result %>
                                </div>
                                    ${blog.getAuthor()}
                            </td>
                            <td class="blog-date">${blog.publishDate}</td>
                            <td class="action-buttons">
                                  <form method="POST" action="MainController" style="display: inline;">
                                    <input type="hidden" name="action" value="addToCart">
                                    <input type="hidden" name="blogId" value="${blog.getId()}">
                                    <input type="hidden" name="title" value="${blog.getTitle()}">
                                    <input type="hidden" name="content" value="${blog.getContent()}">
                                    <input type="hidden" name="author" value="${blog.getAuthor()}">
                                    <input type="hidden" name="publishDate" value="${blog.getPublishDate()}">
                                    <button type="submit" class="cart-btn">
                                      <svg class="cart-icon" xmlns="http://www.w3.org/2000/svg" width="14" height="14" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                        <circle cx="9" cy="21" r="1"></circle>
                                        <circle cx="20" cy="21" r="1"></circle>
                                        <path d="M1 1h4l2.68 13.39a2 2 0 0 0 2 1.61h9.72a2 2 0 0 0 2-1.61L23 6H6"></path>
                                      </svg>
                                        Cart
                                    </button>
                                  </form>
                                <form action="MainController" method="GET">
                                    <input type="hidden" name="action" value="deletePost">
                                    <input type="hidden" name="postId" value="${blog.getId()}">
                                    <button type="submit" class="delete-btn" title="Delete post"></button>
                                </form>
                            </td>
                        </tr>
                        <% }  %>
                </table>
            </div>
            <form class="create-button-container" action="MainController" method="GET">
                        <input type="hidden" name="action" value="forwardToCreate">
                    <button type="submit" class="create-button">
                     <span class="create-button-icon"></span>
                            Create New Post
                    </button>
            </form>
        </div>
    </main>

</body>
</html>
