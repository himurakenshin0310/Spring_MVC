<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<fmt:setLocale value="vi_VN" scope="session" />
<!-- <style>
.modal-dialog{
	position:fixed;
	left:0;
	right:0;
	margin: 0 atuo;
	bottom: 0;
}
</style> -->

<style>
.trangNhap {
	margin-right: auto;
	margin-left: 25%;
}

#pagi{
	width: 5%; 
	text-align: center;
}
@media only screen and (max-width: 768px){
	#pagi{
		width: 20%; 
		text-align: center;
	}
}
</style>
<div class="container mt-4 myModal">
	<section class="products">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10" >
				<div class="row" id="main">
					<c:forEach items="${dss }" var="ds" varStatus="count">
						<div id="div-${count.index }" class="col-md-3 mb-3">
							<div class="card" style="">
								<img id="img-${count.index }"
									style="height: 200px; width: auto; padding: 10px;"
									class="card-img-top"
									src="${pageContext.request.contextPath }/images/${ds.hinh}"
									alt="Card image cap">
								<div class="card-body" style="height: 15px;">
									<h5 id="tenSua-${count.index }" class="cartTitle">${ds.tenSua }</h5>
									<p>
										<span id="donGia-${count.index }" class="spanDonGia">Giá
											Tiền: <fmt:formatNumber type="currency" value="${ds.donGia }" />
										</span>
									</p>

								</div>
								<br>
								<div class="card-body mt-3">
									<p id="tpDinhDuong-${count.index }" class="card-text"
										style="word-wrap: break-word;">
										<c:if test="${ ds.tpDinhDuong.length() > 25}">${ds.tpDinhDuong.substring(0,25) }</c:if>
										<c:if test="${ ds.tpDinhDuong.length() < 25}">${ds.tpDinhDuong.substring(0,ds.tpDinhDuong.length()-1) }</c:if>
										...
									</p>
									<a id="linkCT-${count.index }"
										onclick="spGanDay('${ds.maSua}')"
										href="${pageContext.request.contextPath }/ChiTietSanPham.html?id=${ds.maSua}"
										class="btn btn-primary"><i class="far fa-eye"></i></a> <a
										id="linkThem-${count.index }"
										href="javascript:them('${ds.maSua }')" class="btn btn-success"><i
										class="fa fa-shopping-cart"></i></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
			<div class="col-md-1"></div>
			<div class="col-md-12">
				<center><button id="xemThem" type="button" class="btn btn-primary">Xem thêm</button></center>
			</div>
		</div>
	</section>
</div>

<script>
	
	$(window).scroll(function() {
		if($(this).width() > 750){
			if(($(document).height()- $(this).height() - 250) <= $(this).scrollTop())
				$("#xemThem").click();
		}else{
			if(($(document).height() - ($(this).scrollTop()/3)) <= $(this).scrollTop())
				$("#xemThem").click();
		}
	});
	


	var page = 1;
	var isBussy = false;
	$(document).ready(function () {
		$("#xemThem").click(function() {
			$("#xemThem").text("Loading...");
			$.ajax({
				URL: "TrangSanPhamSua.html",
				type: "post",
				data: {
					page : ++page
				},
				beforeSend: function() {
					isBussy = true;
				}
			}).done(function(result) {
				var data = "";
				$.each(result.data, function(index,item) {
					data += item;
				});
				$("#main").append(data);
				isBussy = false;
				$("#xemThem").text("Xem thêm");
				if(result.full == 1)
					$("#xemThem").css("display","none");	
			});
		});
	});
	
</script>