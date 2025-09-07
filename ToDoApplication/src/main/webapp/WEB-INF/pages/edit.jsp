<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8" isELIgnored="false"%>
    
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit ToDo</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"/>
</head>
<body>
    <div class="container mt-3">
        <div class="row">
            <div class="col-md-6 offset-md-3">

                <h1 class="text-center mb-3">Edit ToDo</h1>

                <!-- Correct Action -->
                <form action="${pageContext.request.contextPath}/update" method="post">
                    <input type="hidden" name="todoId" value="${todo.todoId}" />

                    <div class="form-group mb-3">
                        <label for="todoTitle">Title</label>
                        <input type="text" class="form-control" id="todoTitle" name="todoTitle"
                               value="${todo.todoTitle}" placeholder="Enter title" required />
                    </div>

                    <div class="form-group mb-3">
                        <label for="todoContent">Content</label>
                        <textarea class="form-control" id="todoContent" name="todoContent"
                                  rows="5" placeholder="Enter content" required>${todo.todoContent}</textarea>
                    </div>

                    <div class="container text-center">
                        <a href="${pageContext.request.contextPath}/home" class="btn btn-outline-danger">Cancel</a>
                        <button type="submit" class="btn btn-warning">Update</button>
                    </div>
                </form>

            </div>
        </div>
    </div>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
