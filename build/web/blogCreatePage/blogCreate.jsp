<%-- 
    Document   : blogCreate
    Created on : Mar 10, 2025, 11:27:55 PM
    Author     : as
--%>

<%@page import="pe.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create New Blog</title>
        <link rel="stylesheet" href="blogCreatePage/blogCreate.css">
    </head>
    <body>
            <% 
                        UserDTO user = (UserDTO)session.getAttribute("usersession"); 
                        String name =user.getName();
           %>
            <header class="header">
            <div class="logo">BlogEditor</div>
            <div class="user-info">
                <span>Hello <%= name %> </span>
                <form action="/logout" method="post" style="display: inline;">
                    <button type="submit" class="logout-button">Logout</button>
                </form>
            </div>
        </header>

        <main class="main-container">
            <h1 class="page-title">Create New Blog Post</h1>

            <div class="form-container">
                <form action="MainController" method="GET">
                    <input type="hidden" name="action" value="create">
                    <input type="hidden" name="usersession" value="<%= user %>">
                    <div class="form-group">
                        <label for="title">Title</label>
                        <input type="text" id="title" name="title"  placeholder="Enter blog title">
                    </div>

                    <div class="form-group">
                        <label for="author">Author</label>
                        <input type="text" id="author" name="author"  placeholder="Enter author name">
                    </div>

                    <div class="form-group">
                        <label for="publishDate">Publication Date</label>
                        <input type="date" id="publishDate" name="publicationDate">
                    </div>

                    <div class="form-group">
                        <label for="content">Content</label>
                        <input  type="text" id="content" name="content"  placeholder="Write your blog content here...">
                    </div>

                    <div class="button-container">
                        <button type="submit" class="create-button">Create Blog Post</button>
                    </div>
                </form>
            </div>
        </main>
    </body>
</html>
