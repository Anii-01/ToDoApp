<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page isELIgnored="false"%>
<!doctype html>
<html lang="en" dir="ltr">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><c:out value="${page}"></c:out> | TODO Manager</title>

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/css/bootstrap.min.css"
	rel="stylesheet" crossorigin="anonymous">

<style>
body {
	background-color: #f8f9fa;
}

.card-custom {
	border: none;
	box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

.menu-card {
	background: #0d6efd;
	color: #fff;
}

.menu-card a {
	color: #fff;
}

.menu-card a:hover {
	background: rgba(255, 255, 255, 0.1);
}
</style>
</head>
<body>
	<div class="container py-4">
		<div class="text-center mb-4">
			<h1 class="fw-bold">📝 TODO Manager</h1>
			<p class="text-muted">Manage your tasks effectively</p>
		</div>

		<c:if test="${not empty msg}">
			<div class="alert alert-success alert-dismissible fade show"
				role="alert">
				<b><c:out value="${msg}"></c:out></b>
				<button type="button" class="btn-close" data-bs-dismiss="alert"
					aria-label="Close"></button>
			</div>
		</c:if>

		<div class="row">
			<!-- Menu -->
			<div class="col-md-4 mb-3">
				<div class="card menu-card">
					<div class="card-header text-center fw-bold">Menu</div>
					<div class="list-group list-group-flush">
						<a href='<c:url value="/add"/>'
							class="list-group-item list-group-item-action bg-transparent border-0">➕
							Add ToDo</a> <a href='<c:url value="/home"/>'
							class="list-group-item list-group-item-action bg-transparent border-0">📋
							View ToDos</a>
					</div>
				</div>
			</div>

			<!-- Content -->
			<div class="col-md-8">
				<c:if test="${page=='home'}">
					<h3 class="mb-3">All ToDos</h3>
					<c:if test="${empty todos}">
						<div class="alert alert-info">No ToDos yet! Click "Add ToDo"
							to create one.</div>
					</c:if>

					<div class="row row-cols-1 g-3">
						<c:forEach items="${todos}" var="t">
							<div class="col">
								<div class="card card-custom">
									<div class="card-body">
										<h5 class="fw-bold">
											<c:out value="${t.todoTitle}"></c:out>
										</h5>
										<p class="text-muted">
											<c:out value="${t.todoContent}"></c:out>
										</p>

										<!-- Action buttons -->
										<div class="d-flex justify-content-end mt-2">
											<!-- Delete button -->
											<a href='<c:url value="/delete/${t.todoId}"/>'
												class="btn btn-sm btn-danger me-2">🗑 Delete</a>

											<!-- Update button (for later, optional) -->
											<a href='<c:url value="/edit/${t.todoId}"/>'
												class="btn btn-sm btn-warning">✏ Edit</a>
										</div>
									</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</c:if>

				<c:if test="${page=='add'}">
					<h3 class="mb-3">Add New ToDo</h3>
					<form:form action="saveTodo" method="post" modelAttribute="todo">
						<div class="mb-3">
							<form:input path="todoTitle" cssClass="form-control"
								placeholder="Enter your todo title" />
						</div>
						<div class="mb-3">
							<form:textarea path="todoContent" cssClass="form-control"
								cssStyle="height: 200px;" placeholder="Enter your todo content" />
						</div>
						<div class="text-end">
							<button class="btn btn-success">✅ Add Todo</button>
						</div>
					</form:form>
				</c:if>
			</div>
		</div>
	</div>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.6/dist/js/bootstrap.bundle.min.js"
		crossorigin="anonymous"></script>
</body>
</html>
