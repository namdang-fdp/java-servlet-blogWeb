<%@page import="pe.blogs.BlogDTO"%>
<%@page import="pe.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href ="blogDetailPage/blogDetail.css">
        <title>Blog Detail</title>
    </head>
    <body>
        <% 
        UserDTO user = (UserDTO)session.getAttribute("usersession"); 
        String name =user.getName();
           %>
        <header class="header">
        <div class="container">
            <div class="header-content">
                <div class="greeting">Hello <%= name %></div>
                <a href="#" class="logout-btn">Log out</a>
            </div>
        </div>
    </header>
             <%
                                   BlogDTO blog = (BlogDTO) request.getAttribute("BLOG_DETAIL");
                                     pageContext.setAttribute("blog", blog);
             %>
    <main class="container">
        <div class="blog-detail">
            <div class="blog-content-wrapper">
                <div class="blog-id">${blog.getId()}</div>
                <h1 class="blog-title">${blog.getTitle()}</h1>
                
                <div class="blog-meta">
                    <div class="author-container">
                        <div class="author-avatar">
                            <%
                                      String author = blog.getAuthor();
                                      String[] parts = author.split(" ");
                                      String result = "";
                                      for(int i = 0; i < 2; i++) {
                                                result += parts[i].substring(0, 1);
                                      }
                                        result = result.toUpperCase();
                                        %>
                                        <%= result %>
                        </div>
                        <div class="author-name">${blog.getAuthor()}</div>
                    </div>
                    
                    <div class="publish-date">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M8 7V3m8 4V3m-9 8h10M5 21h14a2 2 0 002-2V7a2 2 0 00-2-2H5a2 2 0 00-2 2v12a2 2 0 002 2z" />
                        </svg>
                        ${blog.getPublishDate()}
                    </div>
                </div>
                
                <div class="blog-content">
                    <p>${blog.getContent()} </p>
                </div>
            </div>
            
            <div class="actions">
                <a href="#" class="back-btn">
                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                        <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M10 19l-7-7m0 0l7-7m-7 7h18" />
                    </svg>
                    Back to List
                </a>
                <form action="MainController" method="GET">
                    <input type="hidden" name="action" value="forwardToEdit">
                    <input type ="hidden" name="id" value="${blog.getId()}">
                    <input type="hidden" name="usersession" value="<%= user %>">
                    <button type="submit" class="edit-btn">
                        <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="none" viewBox="0 0 24 24" stroke="currentColor">
                            <path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M11 5H6a2 2 0 00-2 2v11a2 2 0 002 2h11a2 2 0 002-2v-5m-1.414-9.414a2 2 0 112.828 2.828L11.828 15H9v-2.828l8.586-8.586z" />
                        </svg>
                        Edit Post
                    </button>
                </form>
            </div>
        </div>
    </main>
    </body>
</html>
