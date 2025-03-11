<%@page import="pe.blogs.BlogDTO"%>
<%@page import="pe.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href ="blogEditPage/blogEdit.css">
        <title>Blog Edit</title>
    </head>
    <body>
        <% 
                UserDTO user = (UserDTO)session.getAttribute("usersession"); 
                String name =user.getName();
           %>
                  <header>
        <div class="logo">BlogEditor</div>
        <div class="user-actions">
            <span class="user-greeting">Hello <%= name%></span>
            <form action="MainController" method="post" style="display: inline;">
                <input type="hidden" name="action" value="logout">
                <button type="submit" class="logout-btn">Logout</button>
            </form>
        </div>
    </header>
            <%
                        BlogDTO blog = (BlogDTO) request.getAttribute("BLOG_DETAIL");
                        pageContext.setAttribute("blog", blog);
             %>
    <main>
        <section class="editor-card">
            <h1 class="page-title">Edit Blog Post</h1>
            <form action="MainController" method="POST">
                <input type="hidden" name="action" value="edit">
                <input type="hidden" name="id" value="${blog.getId()}"
                <div class="form-group">
                    <label for="blogId">ID</label>
                    <input type="text" id="blogId" name="blogId" value="${blog.getId()}"  />
                </div>

                <div class="form-group">
                    <label for="title">Title</label>
                    <input type="text" id="title" name="title" value="${blog.getTitle()}" >
                </div>
                
                <div class="form-group">
                    <label for="author">Author</label>
                    <input type="text" id="author" name="author" value="${blog.getAuthor()}" >
                </div>
                
                <div class="form-group">
                    <label for="publicationDate">Publication Date</label>
                    <input type="date" id="publicationDate" name="publicationDate"  value="${blog.getPublishDate()}">
                </div>
                
                <div class="form-group">
                    <label for="content">Content</label>
                    <input type="text" id="content" name="content"  value="${blog.getContent()}">
                </div>
                
                <div class="form-footer">
                    <button type="submit" class="save-btn">Save Post</button>
                </div>
            </form>
        </section>
    </main>
</html>
