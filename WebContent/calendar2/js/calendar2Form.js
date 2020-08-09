function putToForm(num){
    var numStr = num;
    $.ajax({
        url : "SearchJobPostController",
        type : "POST",
        data : {num:numStr},
        dataType : "json",
        success : function(data){
        	$("#postnum").val(numStr); 
        	$("#postcorpname").val(data.postcorpname);
         	$("#postname").val(data.postname);
         	$("#poststart").val(data.poststart);
         	$("#postend").val(data.postend);
         	$("#posturl").val(data.posturl);
         	$("#postimgshow").attr("src", data.postimg);
         	$("#postcontent").val(data.postcontent);
         	
         	var typeStr = data.type.split("");
         	
         	if (typeStr[0] == "1") $("#eng").prop("checked", true);
         	else $("#eng").prop("checked", false);
         	if (typeStr[1] == "1") $("#noneng").prop("checked", true);
         	else $("#noneng").prop("checked", false);
         	if (typeStr[2] == "1") $("#capital").prop("checked", true);
         	else $("#capital").prop("checked", false);
         	if (typeStr[3] == "1") $("#noncapital").prop("checked", true);
         	else $("#noncapital").prop("checked", false);
         		       	
         	$("#like").val(data.like);
         	$("#dislike").val(data.dislike);
         	$("#view").val(data.view);
         	
        }
    });   
}

function clearImg(){
	$("#postimgshow").attr("src", "");
}

function checkDel(){
	var postnumStr = $("#postnum").val();
	$.ajax({
        url : "DelJobPostController",
        type : "POST",
        data : {num:postnumStr},
        success : function(data){
        	if (data=="success"){
        		location.reload();
            	alert(postnumStr+"번 공고가 삭제되었습니다");
        	}
        	else{
        		alert("먼저 공고를 선택해주세요"); // 실패 시 처리
        	}
        }    
    });   
}

function addpost(){
	var form = $('#jobpostform')[0];
	var formdata = new FormData(form)
	
  $.ajax( {
    url: 'AddJobPostController',
    type: 'POST',
    data: formdata,
    success : function(datav){
    	if (datav=="success"){
        	alert("일정이 새로 추가되었습니다");
    	}
    	else{
    		alert("일정을 추가하지 못했습니다. 다시 확인해주세요");
    	}
    	
    }
  });
}

function editpost(){
	var postnumStr = $("#postnum").val();
	var form = $('#jobpostform')[0];
	var formdata = new FormData(form)
	
  $.ajax( {
    url: 'EditJobPostController',
    type: 'POST',
    enctype: 'multipart/form-data',
    data: formdata,
    processData: false,
    contentType: false,
    success : function(datav){
    	if (datav=="success"){
    		location.reload();
        	alert(postnumStr + "번 공고가 수정되었습니다");
    	}
    	else{
    		alert("공고를 수정하지 못했습니다. 다시 확인해주세요");
    	}
    	
    }
  });
}

