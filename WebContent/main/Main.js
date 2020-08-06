function btn_comment(seq, num){
		var com = document.getElementById("comment_display_" + num);
		
		var myObject;
		
		if(com.style.display == 'none') {
			com.style.display = 'block';
			
			var result = "";
			$.ajax({
				type:"POST",
				url: "/project_J/ListCommentController",
				data: {seq:seq},
				contenttype: "application/json; charset=utf-8",
				datatype: "JSON",
				success: function(obj){
					var count = Object.keys(JSON.parse(obj)).length;
					//var key = alert(Object.keys(JSON.parse(obj))[0]); 
					//var value = alert(Object.values(JSON.parse(obj))[0]);
					
					for(var idx = 0; idx < count; idx++){
						var value = Object.values(JSON.parse(obj))[idx];
						result += value;
						result += "<br>";

					}
					$("#comments_"+num).append(result);
/* 					alert(result);
					$("#comment_display_"+num).after(result); */

/* 					$("#comment_"+seq).val(result.toString()); */
				},
				error: function(e){
					alert("error");
				}
			});	
		}
		else {
			com.style.display = 'none';
		}
	}
	
	function btn_good(state, seq){
		var com = document.getElementById("good_" + seq);
		var type = 0;
		
		if(state == "off") { // 버튼 active
			com.value = "on";
			type = 1;
		}
		else {				// 버튼 non-active
			com.value = "off";
			type = 2;
		}
	
		$.ajax({
			type:"POST",
			url: "/project_J/LikeController",
			data: {seq:seq, type:type},
			datatype: "JSON",		
			contenttype: "application/json; charset=utf-8",
			success: function(obj){
				var result = "good: " + JSON.parse(obj).good.toString() + " bad: " + JSON.parse(obj).bad.toString();
				$("#postLike_"+seq).empty();
				$("#postLike_"+seq).append(result);
/* 				$("#postDislike_"+seq).val(JSON.parse(obj).bad.toString()); */
			},
			error: function(e){
				alert("error");
			}
		});	
	}	
	
	
	function btn_bad(state, seq){
		var com = document.getElementById("bad_" + seq);
		var type = 0;
		
		if(state == "off") { // 버튼 active
			com.value = "on";
			type = 3;
		}
		else {				// 버튼 non-active
			com.value = "off";
			type = 4;
		}
		
		$.ajax({
			type:"POST",
			url: "/project_J/LikeController",
			data: {seq:seq, type:type},
			datatype: "JSON",		
			contenttype: "application/json; charset=utf-8",
			success: function(obj){
				var result = "good: " + JSON.parse(obj).good.toString() + " bad: " + JSON.parse(obj).bad.toString();
				$("#postLike_"+seq).empty();
				$("#postLike_"+seq).append(result);
			},
			error: function(e){
				alert("에러발생");
			}
		});
	}