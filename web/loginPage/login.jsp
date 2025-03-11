
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    <html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="loginPage/loginPage.css">
        <title>Login Page</title>
    </head>
    <body>
         <div class="login-container">
        <div class="login-header">
            <h1>Welcome Back</h1>
            <p>Sign in to continue to BlogPost</p>
        </div>
             
        <form  class="login-form" action="./MainController" method="POST">
             <input type="hidden" name="action" value="login">
            <div class="form-group">
                <label for="username">Username</label>
                <input type="text"  name="username" id="username" placeholder="Enter your username" required>
            </div>
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" name="password" id="password" placeholder="Enter your password" required>
            </div>
            
            <button type="submit" class="login-button">Sign In</button>
        </form>
    </div>
    </body>
    
</html>

