<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>




<script>
	setTimeout(function() {
		if ($("#thongbao") != null) {
			$("#thongbao").css("display","none");
			<c:remove var="kq" scope="session" />
		}
	}, 3000);
</script>

<!-- xoa gio hang  -->
<script>
	var isBussy = false;
	function loadDoc() {
		if (isBussy)
			return;
		$(document).ready(function name() {
			var checked = [];
			$.each($("input[name = 'chon']:checked"), function() {
				checked.push($(this).val());
			});
			if (checked != null) {
				$.ajax({
					url : "XoaGioHang.html",
					type : "POST",
					data : {
						id : checked,
						test:"value"
					},
					beforeSend : function() {
						isBussy = true;
					}
				}).done(function(result) {
					$.each(checked, function(index, item) {
						$("#" + item).css("display", "none");
					});
					$("#tongTien").html(result.tongTien+" ₫");
					isBussy = false;
				});
			}

		});
	}

	// 	function loadDoc(maSua) {
	// 		var r = confirm("Bạn có muốn xóa?");
	// 		if (r == true) {
	// 			const xhttp = new XMLHttpRequest();
	// 			xhttp.onreadystatechange = function() {
	// 				if (this.readyState == 4 && this.status == 200) {
	// 					var obj = JSON.parse(this.responseText);
	// 					document.getElementById(maSua).style.display = "none";
	// 					document.getElementById("tongTien").innerHTML = obj.tongTien
	// 							+ " ₫";
	// 					document.getElementById("soLuongMua").innerHTML = obj.soLuongSP;
	// 				}
	// 			};
	// 			xhttp.open("GET", "XoaGioHang?id=" + maSua);
	// 			xhttp.send();
	// 		}
	// 	}

	var isbussy = false;
	function decrease(id) {
		var value = $("#quantity-" + id).val();
		if (value > 1 && value < 11) {
			if (update(id, --value) == false)
				$("#quantity-" + id).val(value);
		}else
			alert("Số lượng ít nhất là 1!");
	}

	function increase(id) {
		var value = $("#quantity-" + id).val();
		if (value > 0 && value < 10) {
			if (update(id, ++value) == false)
				$("#quantity-" + id).val(value);
		}else
			alert("Số lượng tối đa là 10!");
	}

	function change(id) {
		var value = $("#quantity-" + id).val();
		if(parseInt(value) <= 10 && parseInt(value) >= 1){
			if (update(id, parseInt(value)) == false)
				$("#quantity-" + id).val(parseInt(value));
			}else{
				if(value > 10){
					alert("Số lượng tối đa là 10!");
					$("#quantity-" + id).val(10);
				}
				else{
					alert("Số lượng không hợp lệ!");
					$("#quantity-" + id).val(1);
				}
			}
	}

	function update(id, quantity) {
		if (isbussy)
			return;
		$(document).ready(function() {
			$.ajax({
				url : "CapNhatGiohang.html",
				type : "GET",
				data : {
					id : id,
					quantity : quantity
				},
				beforeSend : function() {
					isbussy = true;
				},
				success : function(result) {
					$.each(result.thanhTien, function(index, item) {
						$(".thanhTien-" + index).text(item);
					})

					$("#tongTien").text(result.tongTien);
				}
			}).fail(function(jqXHR, textStatus, errorThrown) {
				// If fail
				console.log(textStatus + ': ' + errorThrown);
			}).always(function() {
				isbussy = false;
			});
		});
		return isbussy;
	}
</script>