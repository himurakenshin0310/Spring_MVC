<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN" scope="session" />
<style>
#thongbao {
	position: relative;
	animation-name: move;
	animation-duration: 3.5s;
	color: red;
}

@keyframes move {
	from {left: 20px;
}

to {
	left: 300px;
}

}
.hinh {
	height: 35px;
	width: auto;
}

.hinh:hover {
	height: 80px;
	width: auto;
}

th, td {
	text-align: center;
}

.ten {
	text-align: left;
}

.tongTien {
	font-style: italic;
	font-size: large;
	font-weight: bold;
	text-align: right;
}
</style>
<div class="container table-responsive">
	<table class="table table-hover table-bordered  mt-3">
		<c:if test="${sessionScope.kq ne null }">
			<span id="thongbao">${kq }</span>
		</c:if>
		<thead>
			<tr style="background-color: #03a9f480;">
				<th scope="col" width="45%">Tên sản phẩm</th>
				<th scope="col" width="200px;">Số lượng</th>
				<th scope="col">Giá tiền</th>
				<th scope="col" colspan="1">Thành tiền</th>
				<th scope="col"><button type="button"
						class="btn btn-outline-danger" data-toggle="modal"
						data-target="#exampleModal">
						<i class="far fa-trash-alt fa-lg"></i>
					</button></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach items="${sessionScope.gioHang.danhSachMua()}"
				var="sua" varStatus="count">
				<tr id="${sua.sua.maSua }">
					<td class="ten"><img class="hinh"
						src="${pageContext.request.contextPath }/images/${sua.sua.hinh}"><span>${sua.sua.tenSua }</span></td>
					<td>
						<div class="input-group">
							<span>
								<button id="decrease-${sua.sua.maSua }"
									onclick="decrease('${sua.sua.maSua}')" type="button"
									class="btn btn-danger btn-number">
									<span><i class="fas fa-minus"></i></span>
								</button>
							</span> <input id="quantity-${sua.sua.maSua}"
								onchange="change('${sua.sua.maSua }')" type="number"
								class="form-control input-number" value="${sua.slm }"
								min="1" max="10"> <span>
								<button onclick="increase('${sua.sua.maSua}')"
									id="increase-${sua.sua.maSua }" type="button"
									class="btn btn-success btn-number">
									<span><i class="fas fa-plus"></i></span>
								</button>
							</span>
						</div>
					</td>
					<td><fmt:formatNumber type="currency" value="${sua.sua.donGia }" />
					</td>
					<td class="thanhTien-${count.index }"><fmt:formatNumber
							type="currency" value="${sua.sua.donGia * sua.slm }" /></td>
					<td><input type="checkbox" value="${sua.sua.maSua }" style="height: 30px; width: 20px;"
						name="chon"></td>
				</tr>
			</c:forEach>
			<tr>
				<td class="tongTien" colspan="4">Phí ship (tạm tính):</td>
				<td colspan="2" class="tongTien"><fmt:formatNumber
						type="currency" value="${sessionScope.gioHang.tax() }" /></td>
			</tr>
			<tr>
				<td class="tongTien" colspan="4">Tổng tiền:</td>
				<fmt:formatNumber type="currency"
					value="${sessionScope.gioHang.tongTien()}" var="tongTien" />
				<td id="tongTien" colspan="2" class="tongTien">${tongTien }</td>
			</tr>
		</tbody>
	</table>
</div>
<!-- Button trigger modal -->
<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
	aria-labelledby="exampleModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-dialog-centered modal-sm"
		role="document">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title" id="exampleModalLabel">Cảnh báo!!!</h5>
				</button>
			</div>
			<div class="modal-body">Bạn có muốn xóa các sản phẩm đã chọn?</div>
			<div class="modal-footer">
				<a href=""><span style="color: red;" data-dismiss="modal"><i
						class="fas fa-times fa-3x"></i></span></a> <a href="" onclick="loadDoc()"><span
					style="color: green;" data-dismiss="modal"><i
						class="fas fa-check fa-3x"></i></span></a>
			</div>
		</div>
	</div>
</div>