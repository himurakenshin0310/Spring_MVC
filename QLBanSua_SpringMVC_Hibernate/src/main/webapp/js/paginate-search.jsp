<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
var currentPage = 1;
	$(document).ready(function() {		
		$("#hangSua").change(function() {
			khoiTao(1);
		});
	
		$("#loaiSua").change(function() {
			khoiTao(1);
		});
		
	
		$("#timKiem").keyup(function(e) {
			e.preventDefault();
			var hangSua = $("#hangSua").val();
			var loaiSua = $("#loaiSua").val();
			var keyword = $("#timKiem").val();
			if (e.keyCode != 18 && e.keyCode != 9
					&& e.keyCode != 8 && e.keyCode != 17) {
				$("#kq").html("Đang tìm.....");
				timKiem(keyword, hangSua, loaiSua, 1);
			}
		});
		
		$("#xemThem").click(function() {
			$("#xemThem").text("Đang tải...");			
			khoiTao(++currentPage);			
		});
	});

	var isBussy = false;
	function timKiem(keyword, hangSua, loaiSua, page) {
		if (isBussy)
			return;
		if (page == 1)
			$(".item").remove();
		$.ajax({
			url : "TrangTimKiem.html",
			type : "GET",
			data : {
				key : keyword,
				maHang : hangSua,
				maLoai : loaiSua,
				page : page,
			},
			beforeSend : function() {
				isBussy = true;
			},
			success : function(results) {
				var listItem = "";
				var tongSP = 0;
				$.each(results.dss, function(i, item) {

					listItem += item;

				});
				if (page < results.tongSoTrang)
					$("#xemThem").css("display", "");
				else
					$("#xemThem").css("display", "none");
				if (results.tongSP != null)
					tongSP = results.tongSP;

				$("#kq").html("Tìm thấy: " + tongSP + " kết quả.");

				if (page == 1)
					$("#row").html(listItem);
				else
					$("#row").append(listItem);
				
				$("#xemThem").text("Xem Thêm");
				currentPage = 1;
				isBussy = false;
			}
		});
	}

	function khoiTao(page) {
		var keyword = $("#timKiem").val();
		var hangSua = $("#hangSua").val();
		var loaiSua = $("#loaiSua").val();
		$("#kq").html("Đang tìm.....");
		timKiem(keyword, hangSua, loaiSua, page);
	}
</script>