<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<script>
	$(document).ready(function() {
		var email = false;
		var pass = false;
		$("#email").keyup(function() {
			var value = $(this).val();
			if(/^\w+([\.-]?\w+)*@\w+([\.-]?\w+)*(\.\w{2,3})+$/.test(value)){
				$("#email").removeClass("border border-danger");
				$("#emailHelp").html("");
				email = false;
			}else{
				$("#email").addClass("border border-danger");
				$("#emailHelp").html("Email không hợp lệ");
				email = true;
			}
				
		});
		
		$("#passWord").keyup(function() {
			var notNull = /^(?!\s*$).+/;
			if(notNull.test($(this).val())){
				$(this).removeClass("border border-danger");
				$("#passHelp").html("");
				pass = false;
			}else{
				$(this).addClass("border border-danger");
				$("#passHelp").html("Mật khẩu không được để trống");
				pass = true;
			}
		});
		var isBussy = false;
		$("#login").click(function() {
			$("#email").keyup();
			$("#passWord").keyup();
			if(isBussy == true || pass == true || email == true)
				return;
			$.ajax({
				url: "DangNhap.html",
				type: "get",
				data: {
					email: $("#email").val(),
					pass: $("#passWord").val()
				},
				beforeSend: function() {
					isBussy = true;
					$("#loader").css("display","block");
				}
			}).done(function(result) {
				$("#loader").css("display","none");
				if(result.kq == 1){							
					$("#succsess").css("display","block");
					setTimeout(function() {
						$("#succsess").css("display","none");
						location.href = "${pageContext.request.contextPath}/";
					}, 1500);
				}else{
					$("#fail").css("display","block");	
				}
				if(result.url){
					location.href = result.url;
				}
			}).always(function() {
				isBussy = false;
			});
		});
	});
	
	$("#fail").click(function() {
		$(this).css("display","none");
	})
</script>