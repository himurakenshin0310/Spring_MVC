<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<fmt:setLocale value="vi_VN" scope="session" />
<style>
.gia {
	font-family: serif;
	font-size: 28px;
	color: red;
}

span {
	font-family: serif;
	font-size: 28px;
}
</style>
<div class="container mt-4">
	<div class="row">
		<div class="col-md-3"></div>
		<div class="col-md-9">
			<div class="row">
				<div class="col-md-3" style="margin: 15px;]">
					<img style="height: 200px; width: 200px;;"
						src="${pageContext.request.contextPath }/images/${ctSP.hinh}">
				</div>
				<div class="col-md-6">
					<h3>${ctSP.tenSua }</h3>
					<h5>Hãng sản xuất: ${tenHang } </h5>
					<h5>Loại: ${tenLoai } </h5>
					<fmt:formatNumber value="${ctSP.donGia}" type="currency"
						var="donGia" />
					<br> <span class="gia">Giá:${donGia }</span>
					<p>
						<span>Thành phần dinh dưỡng:</span> ${ctSP.tpDinhDuong }
					</p>
					<p>
						<span>Lợi ích:</span> ${ctSP.loiIch }
					</p>
					<form action="ThemVaoGioHang.html" method="post">
						Số lượng: <input style="width: 60px; margin: 10px;" min="1"
							max="10" value="1" name="quantity" type="number"> <br>
						<input type="hidden" value="${ctSP.maSua }" name="id"><br>
						<button class="btn btn-outline-primary">Thêm vào giỏ hàng</button>
					</form>
					<span style="color: red">${kq }</span>
				</div>
			</div>
		</div>
	</div>
</div>