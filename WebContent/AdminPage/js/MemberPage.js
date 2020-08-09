function all(id){
	var idStr = id;
	alert(idStr);
}


function putToForm(num){
    var numStr = num;
    $.ajax({
        url : "SearchController",
        type : "POST",
        data: {num:numStr},
        dataType : "json",
        success : function(data){
        	$("#id").val(data.id); 
        	
        	$("#name").val(data.name);
         	$("#nickname").val(data.nickname);
         	$("#phone").val(data.phone);
         	$("#birthdate").val(data.birthdate);
         	
         	//var gen = data.gender;
         	$("#gender").val(data.gender).attr("selected","selected");
         	$("#email").val(data.email);
         	$("#address").val(data.address);
         	
         	var typeStr = data.type.split("");
         	
         	if (typeStr[0] == "1") $("#eng").prop("checked", true);
         	else $("#eng").prop("checked", false);
         	if (typeStr[1] == "1") $("#noneng").prop("checked", true);
         	else $("#noneng").prop("checked", false);
         	if (typeStr[2] == "1") $("#capital").prop("checked", true);
         	else $("#capital").prop("checked", false);
         	if (typeStr[3] == "1") $("#noncapital").prop("checked", true);
         	else $("#noncapital").prop("checked", false);
         	
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


function editmember(){
	alert("hh");
	var id = $("#id").val();
	var form = $('#memberadminform')[0];
	var formdata = new FormData(form)
	
  $.ajax( {
    url: 'EditAdminMemberController',
    type: 'POST',
    data: formdata,
    success : function(datav){
    	if (datav=="success"){
    		location.reload();
        	alert(id + " 님의 정보가 수정되었습니다");
    	}
    	else{
    		alert(id + " 님의 정보를 수정하지 못했습니다. 다시 확인해주세요");
    	}
    	
    }
  });
}



