<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!-- 	footder -->
<div onclick="off()" id="overlay">
	<div id="content">
		<span style="color: #07e83b; margin-left: 28%;"><i
			class="fas fa-cart-arrow-down fa-5x"></i></span><br>
			<span style="font-size: 25px; text-align: left;">Đã thêm vào giỏ hàng!</span>
	</div>
</div>
<!-- thong bao -->


<!-- <script>
	function them(id) {
		const xhttp = new XMLHttpRequest();
		xhttp.onreadystatechange = function() {
			if (this.readyState == 4 && this.status == 200) {
				var obj = JSON.parse(this.responseText);
				document.getElementById("soLuongMua").innerHTML = obj.soLuongSP;
				window.scrollTo({top: 0, behavior: 'smooth'});
			}

		}
		xhttp.open("GET","ThemVaoGioHang?id=" + id);
		xhttp.send();
	}
</script> -->

<script>
// 	onload check dang nhap
	<c:if test="${sessionScope.user != null}">
		$(document).ready(function() {	
			var check = "${sessionScope.user.tenKhachHang}";
			if(check == "${sessionScope.user.tenKhachHang}")
				$("#dangNhap").css("display","none");
		});
	</c:if>


	var isBussy = false;
	$("#logout").click(function() {
		$("#user").css("display","none");
		if(isBussy)
			return;
		$.ajax({
			url: "DangXuat.html",
			type: "post",
			beforeSend: function() {
				isBussy = true;
			}
		}).done(function(result) {							
			$("#dangNhap").css("display","");
		});
	});


	// 	thong bao
	function on() {
		$("#overlay").css("display", "block");
		setTimeout(function() {
			off();
		}, 1000);
	}

	function off() {
		$("#overlay").css("display", "none");
	}

	/* ham them san pham vao trong gio hang */
	var isBussy = false;
	function them(ma) {
		$(document).ready(function() {
			if (isBussy)
				return;
			$.ajax({
				url : "ThemVaoGioHang.html",
				type : "GET",
				data : {
					id : ma
				},
				beforeSend : function() {
					isBussy = true;
				},
				success : function(ketQua) {
					if (ketQua.soLuongSP != null) {
						$('#soLuongMua').html(ketQua.soLuongSP);
						on();
					} else {
						alert(ketQua.thongBao);
					}
				}
			}).always(function() {
				isBussy = false;
			});
		});
	}

	/* ham luu vao sesion san pham gan day */
	// 	 	function spGanDay(ma) {
	// 	 const xhttp = new XMLHttpRequest();
	// 	 xhttp.onreadystatechange = function() {
	// 	 if (this.status == 200 && this.readyState == 4)
	// 	 console.log("succsess");
	// 	 };
	// 	 xhttp.open("GET", "LuuVaoSession?id=" + ma);
	// 	 xhttp.send();
	// 	 } 
	function spGanDay(ma) {
		$(document).ready(function() {
			$.ajax({
				url : "LuuVaoSession.html",
				type : "GET",
				data : {
					id : ma
				},
				success : function(result) {
					console.log(result.kq);
				}
			});
		});
	}
</script>






<!-- Footer -->
<footer class="text-center text-lg-start bg-light text-muted mt-5">
	<!-- Section: Social media -->
	<section
		class="d-flex justify-content-center justify-content-lg-between p-4 border-bottom">
		<!-- Left -->
		<div class="me-5 d-none d-lg-block">
			<span>Get connected with us on social networks:</span>
		</div>
		<!-- Left -->

		<!-- Right -->
		<div>
			<a href="" class="me-4 text-reset"> <i class="fab fa-facebook-f"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-twitter"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-google"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-instagram"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-linkedin"></i>
			</a> <a href="" class="me-4 text-reset"> <i class="fab fa-github"></i>
			</a>
		</div>
		<!-- Right -->
	</section>
	<!-- Section: Social media -->

	<!-- Section: Links  -->
	<section class="">
		<div class="container text-center text-md-start mt-5">
			<!-- Grid row -->
			<div class="row mt-3">
				<!-- Grid column -->
				<div class="col-md-3 col-lg-4 col-xl-3 mx-auto mb-4">
					<!-- Content -->
					<h6 class="text-uppercase fw-bold mb-4">
						<i class="fas fa-gem me-3"></i>Company name
					</h6>
					<p>Here you can use rows and columns to organize your footer
						content. Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
					<!-- Links -->
					<h6 class="text-uppercase fw-bold mb-4">Products</h6>
					<p>
						<a href="#!" class="text-reset">Angular</a>
					</p>
					<p>
						<a href="#!" class="text-reset">React</a>
					</p>
					<p>
						<a href="#!" class="text-reset">Vue</a>
					</p>
					<p>
						<a href="#!" class="text-reset">Laravel</a>
					</p>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-3 col-lg-2 col-xl-2 mx-auto mb-4">
					<!-- Links -->
					<h6 class="text-uppercase fw-bold mb-4">Useful links</h6>
					<p>
						<a href="#!" class="text-reset">Pricing</a>
					</p>
					<p>
						<a href="#!" class="text-reset">Settings</a>
					</p>
					<p>
						<a href="#!" class="text-reset">Orders</a>
					</p>
					<p>
						<a href="#!" class="text-reset">Help</a>
					</p>
				</div>
				<!-- Grid column -->

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 col-xl-3 mx-auto mb-md-0 mb-4">
					<!-- Links -->
					<h6 class="text-uppercase fw-bold mb-4">Contact</h6>
					<p>
						<i class="fas fa-home me-3"></i> New York, NY 10012, US
					</p>
					<p>
						<i class="fas fa-envelope me-3"></i> info@example.com
					</p>
					<p>
						<i class="fas fa-phone me-3"></i> + 01 234 567 88
					</p>
					<p>
						<i class="fas fa-print me-3"></i> + 01 234 567 89
					</p>
				</div>
				<!-- Grid column -->
			</div>
			<!-- Grid row -->
		</div>
	</section>
	<!-- Section: Links  -->

	<!-- Copyright -->
	<div class="text-center p-4"
		style="background-color: rgba(0, 0, 0, 0.05);">
		© 2021 Copyright: <a class="text-reset fw-bold"
			href="https://mdbootstrap.com/">MDBootstrap.com</a>
	</div>
	<!-- Copyright -->
</footer>
<!-- Footer -->


<!-- Optional JavaScript -->
<!-- jQuery first, then Popper.js, then Bootstrap JS -->
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js"
	integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
	crossorigin="anonymous"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js"
	integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
	crossorigin="anonymous"></script>
</body>
</html>
	
