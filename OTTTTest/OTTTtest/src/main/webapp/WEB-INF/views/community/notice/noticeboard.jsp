<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="path" value="${pageContext.request.contextPath}"/>  
<c:set var="loginout" value="${sessionScope.id == null ? 'logout' : 'login'}" />
<c:set var="loginoutlink" value="${sessionScope.id==null ? '/login' : '/mypage'}" />
<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>공지사항</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/js/bootstrap.bundle.min.js" integrity="sha384-qKXV1j0HvMUeCBQ+QVp7JcfGl760yU08IQ+GpUo5hlbpg51QRiuqHAJz8+BrxE/N" crossorigin="anonymous"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-aFq/bzH65dt+w6FI2ooMVUpc+21e0SRygnTpmBvdBgSdnuTN7QbdgL+OapgHtvPp" crossorigin="anonymous">
    <link rel="stylesheet" href="${path}/resources/css/community/notice/noticeboard.css" >
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script type="text/javascript" src="${path}/resources/js/community/main.js"></script>
    <style type="text/css">
    	input{
    		border: none;
    		outline: none;
    		background-color: #202020;
    		color: #fff;
    		width: 100%;
    		height: 100%;
    	}
    	
    	input[name='article_title']{
    		font-size: 26px;
    	}

/* 모달 */
.modal-content{
    background-color: #202020;
}

.modal-body{
    font-size: 26px;
    text-align: center;
    border: 1px solid #fff;
}

.modal-header{
    border: 1px solid #fff;
}

.modal-footer{
    border: 1px solid #fff;
    display: flex;
    justify-content: flex-end;
}
 
.modi-del{
	display: flex;
    justify-content: flex-end;
}


.qa-main p{
    display: flex;
    justify-content: flex-end;
    font-weight: bold;
}

.btn{
    color: #fff;
    background-color: transparent;
    border-style: none;
    border-color: #fff; 
    font-size: 23px; 
    text-decoration: none;
}


.btn:hover{
    border-color: #33FF33;
    background-color: transparent;
    border-style: solid;
    color: #33FF33; 
}

/* 글목록 배너 */
.title-region{
    position: relative;
    margin: 20px 0;
}

.title-mainline{
    width: 1100px;
    height: 50px;
    border-bottom: 2.5px solid #fff;
    margin: 0 auto;
}

.title-mainline span{
    font-size: 23px;
    padding: 10px;
}

.title-line{
    width: 1100px;
    height: 500px;
    font-size: 20px;
    padding: 10px 0;
    border-bottom: 1.5px solid #fff;
    margin: 0 auto;
}

.qa-main{
    width: 1200px;
    height: 100%;
    margin: 0 auto;
    /* border: 1px solid red; */
}
    </style>
  </head>
 
<!--  body  --------------------->
  <body style="background-color: #202020;">
     
    <div class="wrap">
      <header >
        <div class="logo">
          <a href="<c:url value="/" />">
            <img src="${path}/resources/images/logo/OTTT.png" alt="로고">
          </a>
        </div>
        <nav class="gnb">
          <ul>
            <li>
              <a href="<c:url value="/genre/movie" />">영화</a>
            </li>
            <li>
              <a href="<c:url value="/genre/drama" />">드라마</a>
            </li>
            <li>
              <a href="<c:url value="/genre/interest" />">예능</a>
            </li>
            <li>
              <a href="<c:url value="/genre/animation" />">애니</a>
            </li>
            <li>
              <a href="<c:url value="/community" />" style="color: #33ff33;">게시판</a>
            </li>
          </ul>
        </nav>
        <div class="h-icon">
          <ul>
            <li>
              <a href="<c:url value='/search' />">
                <!-- <img src="./images/icon/search02.png" alt="검색"> -->
              </a>
            </li>
            <li>
              <a href="<c:url value='${loginoutlink}' /> " class="${loginout}">
                <!-- <img src="./images/icon/user01.png" alt="내 정보"> -->
              </a>
            </li>
          </ul>
        </div>
      </header>

        <div id="line-1" >
          <nav class="nav">
          <a class="nav-link1" href="<c:url value='/community' />">자유게시판</a>
          <a class="nav-link1" href="<c:url value='/community/endmovie/tving' />">종료예정작</a>
          <a class="nav-link1" href="<c:url value='/community/priceInfoTving' />">가격정보</a>
          <a class="nav-link1" href="<c:url value='/community/QnA' />">Q&A</a>
          <a class="nav-link1" href="<c:url value='/community/notice' />" style="color: #33ff33;">공지사항</a>

        </nav>
        </div>


	<script type="text/javascript">
		$(document).ready(function() {
			let article_no = $("input[name=article_no]").val()
			
			$("#modifyBtn").on("click", function() {
				let form = $("#form")
				let isReadonly = $("input[name=article_title]").attr('readonly')
				
				if(isReadonly=='readonly'){
					$("input[name=article_title]").attr('readonly', false)
					$("input[name=article_content]").attr('readonly', false)
					$("#modi").html("등록")
					$("#del").html("취소")
					return
				}
				
				form.attr("action", "<c:url value='/community/notice/modify${searchItem.queryString}' />")
				form.attr("method", "post")
				
				if(formCheck()){
					form.submit()
				}
			})
			
			$("#del").on("click", function() {
				if(!$("input[name=article_title]").attr('readonly')){
					let form = $("#form")
					form.attr("action", "<c:url value='/community/notice/read${searchItem.queryString}' />")
					form.attr("method", "get")
					form.submit()
					return
				}
			})
			
			$("#removeBtn").on("click", function() {
				let form = $("#form")
				form.attr("action", "<c:url value='/community/notice/remove${searchItem.queryString}' />")
				form.attr("method", "post")
				form.submit()
			})
			
			let formCheck = function() {
				let form = document.getElementById("form")
				
				if(form.article_title.value==""){
					alert("제목을 입력해 주세요.")
					form.title.focus()
					return false
				}
				
				if(form.article_content.value==""){
					alert("내용을 입력해 주세요.")
					form.content.focus()
					return false
				}
				return true
			}
		})
	</script>
	
   	<script type="text/javascript">
	   	$(document).ready(function() {
	   	    let msg = "${msg}";
	   	    if(msg == 'MOD_OK') {
	   	        $(".body").html("수정이 완료되었습니다.");
	   	    	$('#Modal').modal('show');
	   	    } 
	   	    if(msg == 'MOD_ERR') {
	   	        $(".body").html("수정 실패했습니다. 다시 시도해주세요.");
	   	     	$('#Modal').modal('show');
	   	    }
	   	});
   	</script>
       	
      <!--글작성 관련 시작-->
      <div class="qa-main">
      
      <form action="" id="form" class="frm" method="post">
			<c:if test="${userDTO.admin.toString() == 'Y' }">
				<div class="modi-del">
	
	          <!-- Button trigger modal -->
	        <button type="button" class="btn btn-secondary" id="modi" data-bs-toggle="modal" data-bs-target="#exampleModal">
	          수정
	        </button>
	 
	        <!-- Modal -->
	        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body">
	                수정하시겠습니까?
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn" data-bs-dismiss="modal" id="modifyBtn">Yes</button>
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
	              </div>
	            </div>
	          </div>
	        </div>
	
	        <!-- Button trigger modal -->
	        <button type="button" class="btn btn-secondary" id="del" data-bs-toggle="modal" data-bs-target="#exampleModa2">
	          삭제
	        </button>
	
	        <!-- Modal -->
	        <div class="modal fade" id="exampleModa2" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabe2">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body">
	                삭제하시겠습니까?
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-primary"  data-toggle="modal" id="removeBtn">Yes</button>
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
	              </div>
	            </div>
	          </div>
	        </div>
	
	
	      </div>
       	</c:if>
      
        <!-- 글목록 배너-->
        <div class="title-region">
          <div class="title-mainline">
            <input type="hidden" name="article_no" value="${articleDTO.article_no}"/>
            <input type="text" name="article_title" value="${articleDTO.article_title}" ${mode=="new" ? "" : "readonly='readonly'" } />
          </div>

          <div class="title-line">
            <input type="text" name="article_content" value="${articleDTO.article_content}" ${mode=="new" ? "" : "readonly='readonly'" } />
          </div>
          
        </div>
        </form>
      </div>




      
    </div>
    
    
    	<!-- Modal -->
	        <div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	          <div class="modal-dialog modal-dialog-centered">
	            <div class="modal-content">
	              <div class="modal-header">
	                <h1 class="modal-title fs-5" id="exampleModalLabel">알림</h1>
	                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	              </div>
	              <div class="modal-body body">
	              </div>
	              <div class="modal-footer">
	                <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">확인</button>
	              </div>
	            </div>
	          </div>
	        </div>
  </body>
</html> 

