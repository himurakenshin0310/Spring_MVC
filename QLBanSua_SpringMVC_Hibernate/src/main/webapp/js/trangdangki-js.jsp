<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
	
<script>
	var isBussy = false;
	var email = false;
	var phone = false;
	var ten = false;
	var address = false;
	var password = false;

	$("#email").keyup(function() {
		var value = $(this).val();
		var emailRegex = /(?=^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$)/;
		if (emailRegex.test(value)) {
			$("#email").removeClass("border border-danger");
			$("#emailHelp").html("");
			if(isBussy)
				return;
			$.ajax({
				url: "KiemTraDangKi.html",
				type: "GET",
				data: {
					email: value,				
				},
				beforeSend: function() {
					isBussy = true;
				}
			}).done(function(result) {
				if(result.check == 1){
					$("#email").addClass("border border-danger");
					$("#emailHelp").html("Email đã đăng kí");
					email = true;
				}else{
					$("#email").removeClass("border border-danger");
					$("#emailHelp").html("");
					email = false;
				}
				isBussy = false;
			});
			
		} else {
			$("#email").addClass("border border-danger");
			$("#emailHelp").html("Email không hợp lệ");
			email = true;
		}
	});

	$("#dienThoai").keyup(function() {
		var value = $(this).val();
		var vnf_regex = /((09|03|07|08|05)+([0-9]{8})\b)/g;
		if (vnf_regex.test(value)) {
			$(this).removeClass("border border-danger");
			$("#dienThoaiHelp").html("");
			if(isBussy)
				return;
			if(isBussy)
				return;
			$.ajax({
				url : "KiemTraDangKi.html",
				type : "GET",
				data : {					
					phone : value,
				},
				beforeSend: function() {
					isBussy = true;
				}
			}).done(function(result) {
				if(result.check == 1){
					$(this).addClass("border border-danger");
					$("#dienThoaiHelp").html("Số điện thoại đã đăng kí");
					phone = true;
				}else{
					$(this).removeClass("border border-danger");
					$("#dienThoaiHelp").html("");
					phone = false;
				}
				isBussy = false;				
			});							
		} else {
			$(this).addClass("border border-danger");
			$("#dienThoaiHelp").html("Số điện thoại không hợp lệ");
			phone = true;
		}
	});

	$("#hoTen").keyup(function() {
		var value = $(this).val();		
		var viet = /^([aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ]\s*){3,50}$/;		
		if (viet.test(value)) {
			$("#hoTenHelp").html("");
			$(this).removeClass("border border-danger");
			ten = false
		} else {
			$("#hoTenHelp").html("Họ Tên không hợp lệ và tối đa 50 kí tự");
			$(this).addClass("border border-danger");
			ten = true;
		}
	});

	$("#diaChi").keyup(function() {
		var value = $(this).val();	
		var viet = /(?=^([aAàÀảẢãÃáÁạẠăĂằẰẳẲẵẴắẮặẶâÂầẦẩẨẫẪấẤậẬbBcCdDđĐeEèÈẻẺẽẼéÉẹẸêÊềỀểỂễỄếẾệỆfFgGhHiIìÌỉỈĩĨíÍịỊjJkKlLmMnNoOòÒỏỎõÕóÓọỌôÔồỒổỔỗỖốỐộỘơƠờỜởỞỡỠớỚợỢpPqQrRsStTuUùÙủỦũŨúÚụỤưƯừỪửỬữỮứỨựỰvVwWxXyYỳỲỷỶỹỸýÝỵỴzZ\d/.]\s*){5,200}$)/;
		if (viet.test(value)) {
			$("#diaChiHelp").html("");
			$(this).removeClass("border border-danger");
			address = false;
		} else {
			$("#diaChiHelp").html("Địa chỉ không hợp lệ");
			$(this).addClass("border border-danger");
			address = true;
		}
	});

	$("#matKhau").keyup(function() {
		var value = $(this).val();
		var notNull = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$/;
		if (notNull.test(value)) {
			$("#matKhauHelp").html("");
			$(this).removeClass("border border-danger");
			password = false;
		} else {
			$("#matKhauHelp").html("Mật khẩu ít nhất 8 ký tự và có ít nhất 1 chữ cái");
			$(this).addClass("border border-danger");
			password = true;
		}
	});
	
	
	
	$("#submit").click(function() {	
		testKeyUp();
		if (email == true || isBussy == true || phone == true || address == true || ten == true || password == true){
			return;
		}
		$(document).ready(function() {
			$.ajax({
				url : "TrangDangKi.html",
				type : "POST",
				data : {
					hoTen : $("#hoTen").val(),
					gioTinh : $("input[name ='gioTinh']:checked").val(),
					diaChi : $("#diaChi").val(),
					dienThoai : $("#dienThoai").val(),
					email : $("#email").val(),
					matKhau : $("#matKhau").val()
				},
				beforeSend : function() {
					isBussy = true;
					$("#submit").html("Đang đăng kí...");
					$(".loader-overlay").css("display", "block");
				}
			}).done(function(result) {
				if ($(location).attr("href", result.url)) {
					$("#submit").html("Đăng kí");
					isBussy = false;
					localStorage.setItem("time", 60);
				}
				if (result.fall == 1) {
					$("#submit").html("Đăng kí");
					isBussy = false;
					alert("có lỗi vui lòng thử lại");
					location.reload();
				}
			}).fail(function(textError) {
				console.log(textError);
			});
		});
	});

	function testKeyUp() {
		$("#email").keyup();
		$("#dienThoai").keyup();
		$("#hoTen").keyup();
		$("#matKhau").keyup();
		$("#diaChi").keyup();
		isBussy = false;
	};
</script>