<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!doctype html>
<html lang="en">
<head>
<!-- Required meta tags -->
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<!-- Bootstrap CSS -->
<script src="https://kit.fontawesome.com/ceb485cf31.js"
	crossorigin="anonymous"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link
	href="https://fonts.googleapis.com/css2?family=Birthstone&display=swap"
	rel="stylesheet">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css"
	integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
	crossorigin="anonymous">	
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<title>QLBanSua</title>

<link rel="stylesheet"
	href="${pageContext.request.contextPath }/css/stylesheet.css">

</head>
<body>
	<!-- navbar -->
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" href="${pageContext.request.contextPath }"><i
			class="fab fa-dev fa-lg"></i></a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<ul class="navbar-nav mr-auto">
				<li class="nav-item active"><a class="nav-link"
					href="${pageContext.request.contextPath }">Trang chủ <span
						class="sr-only">(current)</span>
				</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/TrangSanPhamSua.html">Sữa</a></li>
				<li class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/TrangTimKiem.html">Tìm
						kiếm</a></li>
				<li id="dangNhap" class="nav-item"><a class="nav-link"
					href="${pageContext.request.contextPath }/TrangDangNhap.html">Đăng
						nhập</a></li>
			</ul>
			<c:if test="${sessionScope.user != null }" var="user">
				<!-- Example single danger button -->
				<div class="btn-group " id="user">
					<button type="button"
						class="btn btn-success btn-sm ml-3 dropdown-toggle"
						data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
						${sessionScope.user.tenKhachHang }</button>
					<div class="dropdown-menu">
						<a id="logout" class="dropdown-item" href="#">Đăng xuất</a>
					</div>
				</div>
			</c:if>
			<a class="btn btn-success btn-sm ml-3"
				href="${pageContext.request.contextPath }/TrangGioHang.html"> <i
				class="fa fa-shopping-cart"></i> Giỏ hàng <span id="soLuongMua"
				style="font-size: 18px;" class="badge badge-light">${sessionScope.gioHang.tongSpMua() }</span>
			</a>
		</div>
	</nav>
	<!-- end navbar -->
	<hr class="mt-2">
	<!-- baner -->
	<div class="container">
		<img src="..${pageContext.request.contextPath }/images/Baner.jpg"
			style="width: 100%" class="img-fluid" alt="Responsive image">
	</div>
	<!-- end baner -->

	<!-- 	end header	 -->