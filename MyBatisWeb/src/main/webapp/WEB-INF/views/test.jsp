<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <script src="https://code.jquery.com/jquery-1.11.3.js"></script>
    <title>Document</title>
</head>
<body>
    <h2>CommentTest</h2>
    comment : <input type="text" name="comment">
    <button id="sendBtn">SEND</button>
    <button id="modBtn">수정하기</button>
    <div id="commentList"></div>
    
    <script type="text/javascript">
    	let bno = 582    	
    
    	$(document).ready(function() {
    		showList(bno)
    		
			$("#sendBtn").click(function() {
				let cno = $(this).attr("data-cno")
				let comment = $("input[name=comment]").val()
				
				if(comment.trim() == '') {
					alert("댓글을 입력해 주세요.")
					$("input[name=comment]").focus()
					return
				}
				
				$.ajax({
					type: 'post'
					,url: '/heart/comments?bno='+bno
					,headers: {"content-type" : "application/json"} //요청헤더
					,data: JSON.stringify({bno:bno, comment:comment}) //서버로 전송할 데이터, stringify()로 직렬화 필요
					,success: function(result) {
						alert(result)
						showList(bno)
					},error: function() {alert("error")}
				})
				
			})
			
			// [send] 버튼 클릭하고 나서 [삭제] 버튼이 보임(이벤트 비활성화됨)
			$("#commentList").on("click",".delBtn", function() {
				//alert("삭제 버튼 클릭됨")
				let cno = $(this).parent().attr("data-cno")		//<li>태그는 <button>의 부모임.
				let bno = $(this).parent().attr("data-bno")	
				
				$.ajax({
					type: 'DELETE'
					,url: '/heart/comments/'+cno+'?bno='+ bno
					,success: function(result) {	//result = 서버가 전송한 데이터
						alert(result)
						showList(bno)
						}
					,error: function() { alert("error")	}	
					})
				})
			
			$("#commentList").on("click",".modBtn", function() {
				//alert("수정 버튼 클릭됨")
				let cno = $(this).parent().attr("data-cno")
				let comment = $("span.comment",$(this).parent()).text()	//클릭된 수정버튼의 부모는(li)의 span태그의 텍스트만 가져옴
				
				//comment의 내용을 input에 출력하기
				$("input[name=comment]").val(comment)
				//cno 전달하기
				$("#modBtn").attr("data-cno",cno)
			})	
			$("#modBtn").click(function() {
				let cno = $(this).attr("data-cno")
				let comment = $("input[name=comment]").val()
				
				if(comment.trim() == '') {
					alert("댓글을 입력해 주세요.")
					$("input[name=comment]").focus()
					return
				}
				
				$.ajax({
					type: 'PATCH'
					,url: '/heart/comments/'+cno
					,headers: {"content-type" : "application/json"}
					,data: JSON.stringify({cno:cno, comment:comment}) //서버로 전송할 데이터, stringify()로 직렬화 필요
					,success: function(result) {
						alert(result)
						showList(bno)
					},error: function() {alert("error")}
				})
			})
		})
    
		    	let showList = function(bno) {
			
    		$.ajax({
    			type: 'GET'								//요청 메서드
    			,url: '/heart/comments?bno='+bno		//요청uri
    			,success: function(result) {
					$("#commentList").html(toHtml(result))		//result는 서버가 전송한 데이터
				}
				,error: function() {alert("error")}
    		})    		
		}
    	
		let toHtml = function(comments) {
			let tmp = "<ul style= 'display: block;'>"
			
			comments.forEach(function(comment) {
				tmp += '<li data-cno=' +comment.cno 
				tmp += ' data-pcon=' +comment.pcon
				tmp += ' data-bno=' +comment.bno + '>'
				tmp += ' data-comment=<span class="comment">' +comment.comment + '</span>'
				tmp += ' data-commenter=<span class="commenter">' +comment.commenter + '</span>'
				tmp += ' <button class="delBtn">삭제</button>'
				tmp += ' <button class="modBtn">수정</button>'
				tmp += '</li>'
			})				
			
			return tmp + "</ul>"
		}
		
		
    </script>
</body>
</html>