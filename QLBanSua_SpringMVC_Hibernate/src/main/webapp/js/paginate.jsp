<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<script>
var isBussy = false;
	function paginate(trang) {
		trang = parseInt(trang);
		if(isBussy)
			return;
		$(document).ready(function() {
			$.ajax({
				URL : "TrangSanPhamSua",
				type : "GET",
				data : {
					page : trang
				},
				beforeSend: function() {
					isBussy = true;
				},
				success : function(result) {
// 					console.log(result.page);
					$(".page-item").each(function (index, item) {						
						$(this).removeClass("active");
					});//xoa css		
					var trang;										
				// set trang hien tai luon nam giua
					if(result.page > 1 && result.page < result.tongSoTrang)
						trang = result.page-1;
					else
						trang = result.page;
					//khoi tao bien  cho for
					var to = trang + 3;
					var i  = 1;
					// kiem tra so lan lap
					var count = 0;
// 					console.log(trang);
					// kiem tra trang hien tai phai <= max -2
					if((result.tongSoTrang - 3) >= trang ){
						for(trang ; trang < to ; trang++  ){
							if((result.tongSoTrang - 2 ) < trang){								
								$("#pagi").hide();
								i = 1;
								trang += - (count + 1);
// 								console.log("trang hien tai"+trang);
								for(trang ; trang < to - 1 ; trang ++){	
									setHtml(i, trang);										
// 									console.log("trang "+trang);	
									i++;
								}
// 								console.log("ko");
								break;
							}
							else{
								if((result.tongSoTrang - 3 ) < trang){
									$("#pagi").hide();
								}else
									$("#pagi").show();
								setHtml(i, trang);						
								i++;
								count++;
// 								console.log("ok");
								
							}
						}// end for
						//load data
						loadData(result.dss, result.donGia, result.spMotTrang);
						
						//set nex and previous
						setNextPrevious(result.page,result.tongSoTrang);
					}else{
						
						if(result.tongSoTrang - 1 == result.page){
							$(".li-tag-"+result.page).attr("value", ""+result.page+"" );
						}else
							$(".li-tag-"+result.page).attr("value", ""+result.page+"" );
							$("#pagi").hide();
							
						if(result.tongSoTrang  == result.page){	
							var trang = result.page - 5;						
						}else{
							var trang = result.page - 4;
						}
				
						var i = 0;
// 						console.log(trang);	
						if(result.tongSoTrang >= result.page){
								if(result.check != 0){
								for(trang ; trang < result.tongSoTrang - 1  ; trang ++){						
									setHtml(i,trang);							
									if(i == 3)
										break;
									i++;							
								}
							}
							//load data
							loadData(result.dss, result.donGia, result.spMotTrang);
							
							//set nex and previous
							setNextPrevious(result.page,result.tongSoTrang);
						}
												
					} // end if
					
					//set css
					$(".page-item").each(function (index, item) {
						if($(this).val() == result.page){
							$(this).addClass("active");
							return false;
						}
					});
				}
			}).always(function() {
				isBussy = false;
			});
		});
	}
	
	function setHtml(viTri, trang) {
		$("#trang-"+viTri).html(trang);
		$(".li-tag-"+viTri).attr("value", ""+trang+"" );
		$("#trang-"+viTri).attr("onclick","paginate("+trang+")");
	}
	
	function setNextPrevious(page, tongSoTrang) {
//			set gia tri cho nut next va previous
		if(page <= tongSoTrang && page >= 1){
			$("#previous").css("display","");
			$("#next").css("display","");
			$("#first").css("display","");
			var next;				
			if((page + 1) > tongSoTrang){
				next = page;
				$("#next").css("display","none");
			}
			else
				next = page +1;
			var previous = page -1;		
			if(previous < 1){
				$("#previous").css("display","none");
				$("#first").css("display","none");
				$("#next").attr("onclick","paginate("+next+")");
			}
			if(previous > 0){
				$("#next").attr("onclick","paginate("+next+")");
				$("#previous").attr("onclick","paginate("+ previous+")");
// 				console.log("ok");
			}
		}		
	}
	
	function loadData(data, donGia, spMotTrang) {
		let check = spMotTrang;
		let count = 0;
		$.each(data, function(i, item) {
			$("#img-"+i).attr("src",'${pageContext.request.contextPath}/images/'+item.hinh);
			$("#tenSua-"+i).html(item.tenSua);			
			if(item.tpDinhDuong.length > 25 )
				$("#tpDinhDuong-"+i).html(item.tpDinhDuong.substring(0,25)+"...");
			else
				$("#tpDinhDuong-"+i).html(item.tpDinhDuong.substring(0, item.tpDinhDuong.length -1)+"...");
			$("#linkCT-"+i).attr("href","${pageContext.request.contextPath}/ChiTietSanPham.html?id="+item.maSua);
			$("#linkCT-"+i).attr("onclick","spGanDay('"+item.maSua+"')");
			$("#linkThem-"+i).attr("href","javascript:them('"+item.maSua+"')");
			count++;
		});
		//bat tat css cho san pham khong co
		if(count < check){
			for(count; count <= check; count++){
				$("#div-"+count).css("display","none");
			}
		}else{
			count += - check;
			for(count; count <= check; count++){
				$("#div-"+count).css("display","");
			}
		}
		//set don gia co dinh dang			
		$.each(donGia, function(i, item) {
			$("#donGia-"+i).html(item);
		})
	}
	
	function nhapTrang() {
		$(document).ready(function() {
			var page = parseInt($("#trangNhap").val());			
			if(page >= 1 && page <= ${tongSoTrang})
				paginate(page);
			else
				alert("trang không hợp lệ!");
			$("#trangNhap").val("");
		});
		
	}
		
</script>