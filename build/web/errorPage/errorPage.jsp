<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
    <meta charset="UTF-8">
    <title>Error Page</title>
    <link rel="stylesheet" href ="errorPage/errorPage.css">
    </head>
    <body>
            <div class="header">
                <h1>BlogEditor</h1>
            </div>

            <div class="container">
                <div class="error-banner">
                    Form Submission Error
                </div>

                <div class="error-message">
                    <p>Please complete all required fields before submitting the form.</p>
                </div>

                <div class="missing-fields">
                    <h3>Check out all of the following information:</h3>
                    <ul>
                        <li>ID</li>
                        <li>Title</li>
                        <li>Author</li>
                        <li>Publication Date</li>
                        <li>Content</li>
                    </ul>
                </div>
                        <%
                            String blogId = (String) request.getAttribute("id");
                        %>
                <div class="button-container">
                    <form action="MainController" method="GET" class="back-button">
                        <input type="hidden" name="action" value="forwardToEdit">
                        <input type ="hidden" name="id" value="<%= blogId %>">
                        <button type="submit"  class="gray-modern-btn">
                                Return to Form
                        </button>
                    </form>
                </div>
            </div>
    </body>
</html>
