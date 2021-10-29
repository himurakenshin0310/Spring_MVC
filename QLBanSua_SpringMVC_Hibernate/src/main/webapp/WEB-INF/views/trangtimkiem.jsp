<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<style>
.tieuDe {
	color: #0066bd;
	font-size: 20px;
	text-align: center;
	font-family: cursive;
	width: 100%;
}

.timKiem {
	width: 50%:
}
</style>
<div class="container mt-5">
	<div class="tieuDe">
		<span>Tìm kiếm sữa</span>
	</div>
	<div class="timKiem row">
		<div class="col-md-1"></div>
		<div class="col-md-10 input-group">
		<span class="input-group-text" id="basic-addon1"><i class="fab fa-searchengin"></i></span>
			<input id="timKiem" type="text" class="form-control">
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-3">
			<label>Hãng Sữa</label> <select id="hangSua" name="hangSua"
				class="form-control">
				<c:forEach items="${dshs }" var="ds">
					<option value="${ds.maHangSua }">${ds.tenHangSua }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-md-3">
			<label>Loại sữa</label> <select id="loaiSua" name="loaiSua"
				class="form-control">
				<c:forEach items="${dsls }" var="ds">
					<option value="${ds.maLoaiSua }">${ds.tenLoai }</option>
				</c:forEach>
			</select>
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-12 mt-3" id="kq"
			style="text-align: center; font-size: 20px;"></div>
	</div>

	<section class="products">
		<div class="row mt-5">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<div class="row" id="row"></div>
			</div>
			<div class="col-md-1"></div>
		</div>
	</section>
	<center class="mt-5 hienThi">
		<button style="display: none;" id='xemThem' class='btn btn-primary'>Xem
			thêm</button>
	</center>
</div>
