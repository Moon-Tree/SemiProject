<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<jsp:include page="/WEB-INF/views/template/header.jsp"></jsp:include>
<style>
	h2 {
            font-size: 15px;
        }
	
	h3 {
            font-size: 10px;
        }

        .form-label {
            display: inline-block;
            margin-left: 13%;
        }
		
		.form-btn1{
            font-size: 15px;
            padding: 0.5em;
            border-width: 1px;
            border-style: solid;
            border-radius: 0.4em;
            cursor: pointer;
            background-color: #b1d5db;
            border-color: #b1d5db;
            display: inline-block;
            text-align: center;
            text-decoration: none;
            color: white;
        }
		
		
        .form-btn2{
            font-size: 15px;
            padding: 0.5em;
            border-width: 1px;
            border-style: solid;
            border-radius: 0.4em;
            cursor: pointer;
            background-color: rgb(64, 165, 187);
            border-color: rgb(64, 165, 187);
            display: inline-block;
            text-align: center;
            text-decoration: none;
            color: white;
        }
        .form-input{
            border-bottom-color: white;
            border-radius: 0.4em;
            border-color: #c8c8c8;
        }
        .form-label {
            display: block;
        }
</style>

<body>

<div class="container-500">
   <div class="row left">
           <h1>비밀번호 찾기</h1>
           <h3>알맞은 정보를 입력해주세요.</h3>
         </div>
         <hr>
    
   <div class="row center">
      <form action="findPw" method="post">
      	<div class="row">
      		<label class="form-label left">아이디</label>
	        <input type ="text" name="memberId" required class="form-input w-75"><br>
      	</div>
      	
      	<div class="row">
      		<label class="form-label left">이메일</label>
	        <input type ="email" name="memberEmail" required class="form-input w-75"><br><br>
      	</div>
         
         
		<div class="row">
	         <button type="submit" class="form-btn2 w-75">확인</button><br>
		</div>
         <div class="row">
	         <a href="login" class="form-btn1 w-75">로그인 페이지로 이동</a>
         </div>
      </form>
   </div>
   
   <!-- 오류가 발생한 경우 보여줄 메세지 -->
   <div class="row center">
      <c:if test="${param.mode == 'error'}">
         <h2 style=color:red>일치하는 정보가 존재하지 않습니다</h2>
      </c:if>
   </div>
   
</div>
</body>

<jsp:include page="/WEB-INF/views/template/footer.jsp"></jsp:include>