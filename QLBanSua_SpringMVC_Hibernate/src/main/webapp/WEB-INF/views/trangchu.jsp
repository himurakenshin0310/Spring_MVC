<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<fmt:setLocale value="vi_VN" scope="session" />
<!-- products -->
<style>
a {
	color: black;
}

a:hover {
	color: black;
}

div.spRecent:hover a img {
	outline-style: double;
	outline-color: blue;
	width: 40px;
}

.products-recently {
	white-space: nowrap;
	text-overflow: ellipsis;
	overflow: hidden;
}
.ctitle{
	display: block;
	margin-left: 30%;
}
</style>
<div class="container mt-4">
	<section>
		<div class="row">
			<div class="col-md-3">
				<h5>Sản phẩm bán chạy</h5>
				<c:forEach items="${banChay }" var="ds">
					<ul>
						<div class="input-group">							
							<span class="products-recently ctitles">
							<img style="height: 70px; width: 70px;"
								src="${pageContext.request.contextPath }/images/${ds.value.hinh}" />
							<a onclick="spGanDay('${ds.value.maSua}')"
								href="${pageContext.request.contextPath }/ChiTietSanPham.html?id=${ds.value.maSua}">${ds.value.tenSua }</a></span><br>
								 <cite class="ctitle">${ds.key } Lần mua</cite>
						</div>
					</ul>
					<hr>
				</c:forEach>
			</div>
			<div class="col-md-9">
			<h5>Sản phẩm </h5>
				<div class="row">				
					<c:forEach items="${dss }" var="ds">
						<div class="col-md-3 mb-3">
							<div class="card" style="">
								<img style="height: 200px; width: auto; padding: 10px;"
									class="card-img-top"
									src="${pageContext.request.contextPath }/images/${ds.hinh}"
									alt="Card image cap">
								<div class="card-body" style="height: 15px;">
									<h5 class="cartTitle">${ds.tenSua }</h5>
									<p>
										<span style="color: red; font-size: 16px;">Giá Tiền: <fmt:formatNumber type="currency" value="${ds.donGia }"></fmt:formatNumber> </span>										
									</p>
								</div>
								<br>
								<div class="card-body mt-3">
									<p class="card-text" style="word-wrap: break-word;">
										<c:if test="${ ds.tpDinhDuong.length() > 25}">${ds.tpDinhDuong.substring(0,25) }</c:if>
										<c:if test="${ ds.tpDinhDuong.length() < 25}">${ds.tpDinhDuong.substring(0,ds.tpDinhDuong.length()-1) }</c:if>
										...
									</p>
									<a onclick="spGanDay('${ds.maSua}')"
										href="${pageContext.request.contextPath }/ChiTietSanPham.html?id=${ds.maSua}"
										class="btn btn-primary"><i class="far fa-eye"></i></a> <a
										href="javascript:them('${ds.maSua }')" class="btn btn-success"><i
										class="fa fa-shopping-cart"></i></a>
								</div>
							</div>
						</div>
					</c:forEach>
				</div>
			</div>
		</div>
	</section>
	<hr>

	<!-- san pham xem gan day  -->
	<c:if test="${sessionScope.suaGanDay != null }">
		<section class="mt-5">
			<div class="row">
				<div class="col-md-3 mt-5"></div>
				<div class="col-md-9">
					<h2>Sản phẩm đã xem</h2>
					<div id="carouselExampleIndicators" class="carousel slide"
						data-ride="carousel">
						<ol class="carousel-indicators">
							<li data-target="#carouselExampleIndicators" data-slide-to="1"
								class="active"></li>
						</ol>
						<div class="carousel-inner">
							<c:forEach var="1"
								end="${sessionScope.suaGanDay.size() > 4? '2':'1' }" begin="1"
								varStatus="count1">
								<div
									class="carousel-item <c:if test="${count1.count == 1 }">active</c:if> ">
									<c:set scope="session" var="end" value="3" />
									<div class="row">
										<c:forEach items="${sessionScope.suaGanDay }"
											begin="${(count1.count -1) *4 }" end="${(count1.count*4)-1}"
											var="ds" varStatus="count2">
											<div class="col-md-3 spRecent">
												<a
													href="${pageContext.request.contextPath }/ChiTietSanPham.html?id=${ds.maSua}"
													onclick="spGanDay('${ds.maSua}')"> <img
													style="margin: 2px; width: 40px; height: 150px;"
													src="${pageContext.request.contextPath }/images/${ds.hinh}"
													class="d-block w-100 hinh" alt="${ds.tenSua }">
													<p style="text-align: center;">${ds.tenSua }</p>
													<hr style="border: none;">
												</a>
											</div>
										</c:forEach>
									</div>
								</div>
							</c:forEach>
						</div>
						<a class="carousel-control-prev" href="#carouselExampleIndicators"
							role="button" data-slide="prev"> <span
							class="carousel-control-prev-icon" aria-hidden="true"></span> <span
							class="sr-only">Previous</span>
						</a> <a class="carousel-control-next"
							href="#carouselExampleIndicators" role="button" data-slide="next">
							<span class="carousel-control-next-icon" aria-hidden="true"></span>
							<span class="sr-only">Next</span>
						</a>
					</div>
				</div>
			</div>
		</section>
	</c:if>
</div>
<!-- end products -->