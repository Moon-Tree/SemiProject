<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>

<!-- summernote cdn -->
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>

<script type="text/javascript">
    $(function(){
        $('[name=reviewContent]').summernote({
            placeholder: '내용 작성',
            tabsize: 4,
            height: 600,
            toolbar: [//메뉴 설정
                ['style', ['style']],
                ['font', ['bold', 'underline', 'clear']],
                ['color', ['color']],
                ['para', ['ul', 'ol', 'paragraph']],
                ['table', ['table']],
                ['insert', ['link', 'picture']]
           	],
	        callbacks: {
				onImageUpload: function(files) {
					if(files.length != 1) return;
					
					//[1] FormData [2] processData [3] contentType
					var fd = new FormData();
					fd.append("attach", files[0]);
					
					$.ajax({
						url:"/rest/attachment/upload",
						method:"post",
						data:fd,
						processData:false,
						contentType:false,
						success:function(response){
	            			
	            			//서버로 전송할 이미지 번호 정보 생성
	            			var input = $("<input>").attr("type", "hidden")
	            									.attr("name", "attachmentNo")
	            									.val(response.attachmentNo);
	            			$("form").prepend(input);
	            			
	            			//에디터에 추가할 이미지 생성
	            			var imgNode = $("<img>").attr("src", "/rest/attachment/download/"+response.attachmentNo);
	            			//이미지 추가 명령
	            			$("[name=reviewContent]").summernote('insertNode', imgNode.get(0));
						},
	            		error:function(){}
	            	});
	            	
	            }
	       	}
        });
    });
</script>

<form action="edit" method="post" autocomplete="off">
<input type="hidden" name="reviewNo" value="${reviewDto.reviewNo}">

<div class="container-800">
    <div class="row mb-40">
<!--         <label class="form-label w-100">제목</label> -->
        
        <input name="reviewTitle" class="form-input w-50 me-10" type="text" placeholder="제목을 입력해주세요" value="${reviewDto.reviewTitle}">
        <select name="reviewLocation" class="form-input w-15">
            <option value="">지역</option>
            <option value="수도권">수도권</option>
            <option value="강원도">강원도</option>
            <option value="충청도">충청도</option>
            <option value="전라도">전라도</option>
            <option value="경상도">경상도</option>
            <option value="제주">제주</option>
        </select>
        <select name="reviewSeason" class="form-input w-15">
            <option value="">계절</option>
            <option value="봄">봄</option>
            <option value="여름">여름</option>
            <option value="가을">가을</option>
            <option value="겨울">겨울</option>
        </select>
        <select name="reviewTheme" class="form-input w-15">
            <option value="">테마</option>
            <option value="레저">레저</option>
            <option value="관광">관광</option>
            <option value="식도락">식도락</option>
        </select>
    </div>
	
	<div class="row">
<!-- 		<label class="form-label w-100">내용</label> -->
		<textarea name="reviewContent">${reviewDto.reviewContent}</textarea>
	</div>
	
	<div class="row right">
		<button type="submit" class="form-btn positive">수정하기</button>
	</div>
</div>
</form>


<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>