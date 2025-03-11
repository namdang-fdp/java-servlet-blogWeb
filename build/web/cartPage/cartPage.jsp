<%@page import="pe.blogs.BlogDTO"%>
<%@page import="java.util.List"%>
<%@page import="pe.users.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Shelf</title>
        <link rel="stylesheet" href ="cartPage/cartPage.css">
    </head>
    <body>
        <% 
                UserDTO user = (UserDTO)session.getAttribute("usersession"); 
                String name =user.getName();
                List <BlogDTO> cart = (List <BlogDTO>) session.getAttribute("usercart");
                int numberOfBlog = cart.size();
         %>
            <header>
        <div class="header-container">
            <a href="" class="logo">BlogCart</a>
            <nav class="nav-links">
                <form action="MainController" method="GET" class="blogs-form">
                    <input type="hidden" name="action" value="list">
                    <button type="submit">Blogs</button>
                </form>
                <a href="#" class="cart-icon">
                    Cart
                    <span class="cart-count"><%= numberOfBlog%></span>
                </a>
            </nav>
        </div>
    </header>

    <!-- Main Content -->
    <main>
        <h1 class="page-title"><%= name%> Cart</h1>

        <!-- Cart Items in Form -->
        <form class="cart-form" action="#" method="post">
            <table class="cart-container">
                <thead>
                    <tr class="cart-header">
                        <th>ID</th>
                        <th>Title</th>
                        <th>Content</th>
                        <th>Author</th>
                        <th>Date</th>
                        <th></th>
                    </tr>
                </thead>
                <tbody>
                        <% 
                                    for (BlogDTO blog : cart){
                                                pageContext.setAttribute("blog", blog);
                         %>
                    <tr class="cart-item">
                        <td>
                            <div class="blog-id">${blog.getId()}</div>
                        </td>
                        <td class="blog-title">${blog.getTitle()}</td>
                        <td class="blog-content">${blog.getContent()}</td>
                        <td>
                            <div class="blog-author">
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
                                <span>${blog.getAuthor()}</span>
                            </div>
                        </td>
                        <td class="blog-date">${blog.getPublishDate()}</td>
                    </tr>
                    <%  } %>
                </tbody>
            </table>

            <!-- Cart Summary -->
            <div class="cart-summary">
                <h2 class="summary-title">Order Summary</h2>
                <div class="summary-item">
                    <span>Blogs in cart</span>
                    <span><%= numberOfBlog%> </span>
                </div>
            </div>
        </form>

        <div class="cart-container" style="display: none;">
            <div class="empty-cart">
                <div class="empty-cart-icon">📚</div>
                <p class="empty-cart-text">Your cart is empty</p>
                <a href="#" class="continue-shopping">Continue Shopping</a>
            </div>
        </div>
    </main>
    </body>
</html>
