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
    <button id="sendBtn">SEND</button>
    <div id="commentList"></div>
    
    <script type="text/javascript">
    	let bno = 330    	
    
    	$(document).ready(function() {
			$("#sendBtn").click(function() {
				showList(bno)
			})
			
			//$(".delBtn").click(function() {	// [send] 버튼 클릭하고 나서 [삭제] 버튼이 보임(이벤트 비활성화됨)
			$("#commentList").on("click",".delBtn", function() {
				//alert("삭제 버튼 클릭됨")
				let cno = $(this).parent().attr("data-cno")		//<li>태그는 <button>의 부모임.
				let bno = $(this).parent().attr("data-bno")	
				
				$.ajax({
					type: 'DELETE'
					,url: '/heart/'+cno+'?bno='+ bno
					,success: function(result) {	//result = 서버가 전송한 데이터
						alert(result)
						showList(bno)
						}
					,error: function() { alert("error")	}	
					}
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
			let tmp = "<ul>"
			
			comments.forEach(function(comment) {
				tmp += '<li data-cno=' +comment.cno 
				tmp += ' data-pcon=' +comment.pcon
				tmp += ' data-bno=' +comment.bno + '>'
				tmp += ' data-comment=<span class="comment">' +comment.comment + '</span>'
				tmp += ' data-commenter=<span class="commenter">' +comment.commenter + '</span>'
				tmp += ' <button class="delBtn">삭제</button>'
				tmp += '</li>'
			})				
			
			return tmp + "</ul>"
		}
		
    </script>
</body>
</html>