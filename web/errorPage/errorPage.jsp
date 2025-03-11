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
                    <h3>The following information is missing:</h3>
                    <ul>
                        <li>Title</li>
                        <li>Author</li>
                        <li>Publication Date</li>
                        <li>Content</li>
                    </ul>
                </div>

                <div class="button-container">
                    <a href="index.html" class="back-button">Return to Form</a>
                </div>
            </div>
    </body>
</html>
