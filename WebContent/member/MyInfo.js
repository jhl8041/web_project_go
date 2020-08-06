$(function(){
	$("#id").blur(function(){$("#alertid").hide();});
	$("#pwd").blur(function(){$("#alertpwd").hide();});
	$("#pwd2").blur(function(){$("#alertpwd2").hide();});
	$("#nickname").blur(function(){$("#alertnickname").hide();});
})

// 회원가입 유효검사
var pwdgood = true;
var pwd2good = true;
var nicknamegood = true;
function formCheck(){
	var pwdStr = $("#pwd").val();
	var pwd2Str = $("#pwd2").val();
	var nameStr = $("#name").val();
	var nicknameStr = $("#nickname").val();
	var roadAddrPart1 = $("#roadAddrPart1").val();
	var addrDetail = $("#addrDetail").val();	
	
	if (pwdgood==false){
		alert("비밀번호 보안을 확인해주세요");
		$("#pwd").focus();
		return false;
	}
	else if (pwd2good==false){
		alert("비밀번호 재입력을 확인해주세요");
		$("#pwd2").focus();
		return false;
	}
	else if (nameStr==""){
		alert("이름을 확인해주세요");
		$("#name").focus();
		return false;
	}
	else if (nicknamegood==false){
		alert("닉네임을 확인해주세요");
		$("#nickname").focus();
		return false;
	}
	else if (roadAddrPart1=="" || addrDetail==""){
		alert("주소를 확인해주세요");
		return false;
	}
}

// 비밀번호 형식 맞는지 체크
function pwdCheck(){
    var idStr = $("#id").val();
    var pwdStr = $("#pwd").val();
    $.ajax({
        url : "/project_J/PwdCheckController",
        type : "POST",
        async: false,
        data : {id:idStr, pwd:pwdStr},
        success : function(data){
        	function good(){
        		document.getElementById("alertpwd").className="alert alert-success";
                document.getElementById("pwd").className="form-control is-valid";
        	}
        	function bad(){
        		document.getElementById("alertpwd").className="alert alert-danger";
                document.getElementById("pwd").className="form-control is-invalid";
        	}
        	
            if(data == "empty"){
            	pwdgood=false;
                $("#pwdcheck").text("");
                $("#alertpwd").hide();
         		document.getElementById("pwd").className="form-control";
            }
            else{
            	pwdgood=false;
            	$("#alertpwd").show();
            	if (data == "digit"){
                	$("#pwdcheck").text("비밀번호는 최소 8자리여야 합니다");
                	bad();
                }
            	else if (data == "strength1"){
                	$("#pwdcheck").text("보안 1단계 (문자와 숫자를 섞어서 입력해주세요)");
                	bad();
            	}
            	else if (data == "strength2"){
	            	$("#pwdcheck").text("보안 2단계 (특수문자와 대문자를 포함해주세요)");
	            	bad();
	            }
	            else if (data == "strength3"){
	            	$("#pwdcheck").text("보안 3단계 (특수문자 또는 대문자를 포함해주세요)");
	            	bad();
	            }
	            else if (data == "strength4"){
	            	pwdgood=true;
	            	$("#pwdcheck").text("보안 4단계 (안전)");
	            	good();
	            }
	            else if (data == "notInclude"){
	            	$("#pwdcheck").text("특수문자,대소문자,숫자를 모두 포함시켜주세요");
	            	bad();
	            }
	            else if (data == "fourChar"){
	            	$("#pwdcheck").text("같은문자 4개를 포함할 수 없습니다");
	            	bad();
	            }
	            else if (data == "includeId"){
	            	$("#pwdcheck").text("비밀번호에 아이디를 포함할 수 없습니다");
	            	bad();
	            }
	            else if (data == "includeSpace"){
	            	$("#pwdcheck").text("비밀번호에 공백을 포함할 수 없습니다");
	            	bad();
	            }             
             }    
        }
    });
}

// 비밀번호 확인란 일치하는지 체크
function pwdMatchCheck(){
	$("#eng").prop('checked', true);
    var pwdStr = $("#pwd").val();
    var pwdStr2 = $("#pwd2").val();
    
    function good(){
		document.getElementById("alertpwd2").className="alert alert-success";
        document.getElementById("pwd2").className="form-control is-valid";
	}
	function bad(){
		document.getElementById("alertpwd2").className="alert alert-danger";
        document.getElementById("pwd2").className="form-control is-invalid";
	}
    
    if (pwdStr2 == ""){
    	pwd2good=false;
    	$("#pwdmatchcheck").text("");
    	$("#alertpwd2").hide();
		document.getElementById("pwd2").className="form-control";
    }
    else if (pwdStr2 == pwdStr){
    	pwd2good=true;
    	$("#pwdmatchcheck").text("비밀번호 확인이 일치합니다");
    	good();
    } 	
    else{
    	pwd2good=false;
    	$("#pwdmatchcheck").text("비밀번호 확인이 일치하지 않습니다");
    	bad();
    }
}

//닉네임 중복검사
function nicknameCheck(){
    var nicknameStr = $("#nickname").val();
    $.ajax({
        url : "/project_J/NicknameCheckController",
        type : "POST",
        async: false,
        data : {nickname:nicknameStr},
        contentType: "application/x-www-form-urlencoded; charset=EUC-KR",
        success : function(data){
        	function good(){
        		document.getElementById("alertnickname").className="alert alert-success";
                document.getElementById("nickname").className="form-control is-valid";
        	}
        	function bad(){
        		document.getElementById("alertnickname").className="alert alert-danger";
                document.getElementById("nickname").className="form-control is-invalid";
        	}
        	
        	if(data == "empty"){
        		nicknamegood = false;
        		$("#nicknamecheck").text("");
        		$("#alertnickname").hide();
        		document.getElementById("nickname").className="form-control";
        	}
        	else{
        		nicknamegood = false;
        		$("#alertnickname").show();
            	if(data == "unique"){
            		nicknamegood = true;
                    $("#nicknamecheck").text("사용가능한 닉네임입니다");
                    good();             
                }
                else if(data == "notunique"){
                    $("#nicknamecheck").text("이미 사용중인 닉네임입니다");
                    bad();
                }
        	}
        	
        }
    });
}

// 주소 API
function goPopup(){
    var pop = window.open("/project_J/member/JusoPop.jsp","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
    
}
function jusoCallBack(roadFullAddr,roadAddrPart1,addrDetail,roadAddrPart2,engAddr, jibunAddr, zipNo, admCd, rnMgtSn, bdMgtSn
						, detBdNmList, bdNm, bdKdcd, siNm, sggNm, emdNm, liNm, rn, udrtYn, buldMnnm, buldSlno, mtYn, lnbrMnnm, lnbrSlno, emdNo){
	document.form.addr.value = roadAddrPart1 + " " +addrDetail;
}

// 전화번호 형식 체크
function phoneCheck(){
	var phoneStr = $("#phone").val();
	if (isNaN(phoneStr)){
		alert("숫자만 입력해주세요");
		$("#phone").val("");
	}
}