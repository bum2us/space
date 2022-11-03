<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
    
<script>
$("#btnSearch").on("click", function(){
	form.attr("action", goUrlList).submit();
});

$("#btnReset").on("click", function(){
	$(location).attr("href", goUrlList);
});

$("#btnForm").on("click", function(){
	goForm(0);
});

goList = function(thisPage){
	$("input:hidden[name=thisPage]").val(thisPage);
	form.attr("action", goUrlList).submit();
}

goForm = function(keyValue){
	seq.val(keyValue);
	form.attr("action", goUrlForm).submit();
}

$("#btnSave").on("click", function(){
	if(seq.val() == "0" || seq.val() == ""){
		form.attr("action", goUrlInst).submit();
	} else {
		form.attr("action", goUrlUpdt).submit();
	}
});


$("#btnList").on("click", function(){
	formVo.attr("action", goUrlList).submit();
});


$("#btnExcel").click(function() {
	form.attr("action", excelUri).submit();
});


$("#btnUelete").on("click", function(){
$("input:hidden[name=exDeleteType]").val(1);
$(".modal-title").text("확 인");
$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
$("#btnModalUelete").show();
$("#btnModalDelete").hide();
$("#modalConfirm").modal("show");
});


$("#btnDelete").on("click", function(){
$("input:hidden[name=exDeleteType]").val(2);
$(".modal-title").text("확 인");
$(".modal-body").text("해당 데이터를 삭제하시겠습니까 ?");
$("#btnModalUelete").hide();
$("#btnModalDelete").show();
$("#modalConfirm").modal("show");
});


$("#btnModalUelete").on("click", function(){
$("#modalConfirm").modal("hide");
formVo.attr("action", goUrlUele).submit();
});


$("#btnModalDelete").on("click", function(){
$("#modalConfirm").modal("hide");
formVo.attr("action", goUrlDele).submit();
}); 


$("#btnLogout").on("click", function(){
	$.ajax({
		async: true
		,cach: false
		,type: "post"
		,url: "/member/logoutProc"
		,data: {}
		,success: function(response) {
			if(response.rt == "success"){
				location.href = "/";
			} else {
				// by pass
			}
		}
		,error : function(jqXHR, textStatus, errorThrown){
			alert("ajaxUpdate" + jqXHR.textStatus + ": " + jqXHR.errorThrown);
		}
		
	});
});



</script>