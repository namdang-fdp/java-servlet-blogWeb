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
         %>
            <header>
        <div class="header-container">
            <a href="#" class="logo">BlogCart</a>
            <nav class="nav-links">
                <a href="#" class="blogs-btn">Blogs</a>
                <a href="#" class="cart-icon">
                    Cart
                    <span class="cart-count">3</span>
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
                                    List <BlogDTO> cart = (List <BlogDTO>) session.getAttribute("usercart");
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
                                <div class="author-avatar">ND</div>
                                <span>${blog.getAuthor()}</span>
                            </div>
                        </td>
                        <td class="blog-date">${blog.getPublishDate()}</td>
                        <td>
                            <button type="button" class="remove-btn" name="remove" value="1">
                                <svg class="remove-icon" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round">
                                    <line x1="18" y1="6" x2="6" y2="18"></line>
                                    <line x1="6" y1="6" x2="18" y2="18"></line>
                                </svg>
                            </button>
                        </td>
                    </tr>
                    <%  } %>
                </tbody>
            </table>

            <!-- Cart Summary -->
            <div class="cart-summary">
                <h2 class="summary-title">Order Summary</h2>
                <div class="summary-item">
                    <span>Blogs in cart</span>
                    <span>3</span>
                </div>
            </div>
        </form>

        <!-- Empty Cart State (hidden by default) -->
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
