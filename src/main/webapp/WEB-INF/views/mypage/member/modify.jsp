<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="../../include/header.jspf" %>
<%@ include file="../../include/myPageHeader.jsp" %>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <title>회원정보 수정</title>
</head>
<body>

<div class="register-area" style="background-color: rgb(249, 249, 249);">
    <div class="container">
        <div class="col-md-6">
            <div class="box-for overflow">
                <div class="col-md-12 col-xs-12 register-blocks">
                    <form role="form" method="post">
                        <h2>회원정보 수정 :</h2>
                        <div class="form-group">
                            <label for="rank">회원분류</label>
                            <input type="text" class="form-control" id="rank" name="rank" value="${login.rank}"
                                   readonly="readonly">
                        </div>
                        <c:if test="${login.rank == 2}">
                            <div class="form-group">
                                <label for="companyNo">사업자번호</label>
                                <input type="text" class="form-control" id="companyNo" name="companyNo"
                                       value="${login.companyNo}">
                            </div>
                        </c:if>
                        <div class="form-group">
                            <label for="id">아이디</label>
                            <input type="text" class="form-control" id="id" name="id"
                                   value="${login.id}" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="nickname">닉네임</label>
                            <input type="text" class="form-control" id="nickName" name="nickName"
                                   value="${login.nickName}">
                        </div>
                        <div class="form-group">
                            <label for="pw">비밀번호</label>
                            <input type="password" class="form-control" id="pw" name="pw"
                                   value="${login.pw}">
                        </div>
                        <div class="form-group">
                            <label for="name">이름</label>
                            <input type="text" class="form-control" id="name" name="name"
                                   value="${login.name}" readonly="readonly">
                        </div>
                        <div class="form-group">
                            <label for="birth">생년월일</label>
                            <input type="text" class="form-control" id="birth" name="birth"
                                   value="${login.birth}" readonly="readonly"
                                   onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                        </div>
                        <div class="form-group">
                            <label for="address">주소</label>
                            <input type="text" class="form-control" id="address" name="address"
                                   value="${login.address}">
                        </div>
                        <div class="form-group">
                            <label for="phoneNum">전화번호</label>
                            <input type="text" class="form-control" id="phoneNum" name="phoneNum"
                                   value="${login.phoneNum}"
                                   onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"/>
                        </div>
                        <div class="form-group">
                            <label for="email">이메일</label>
                            <input type="text" class="form-control" id="email" name="email"
                                   value="${login.email}">
                        </div>
                    </form>
                    <div class="text-center">
                        <button type="submit" class="btn btn-warning" style="float: left;">저장</button>
                        <button type="submit" class="btn btn-danger" style="float: right;">취소</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.js"></script>
<script>
    $(document).ready(function () {
        var formObj = $("form[role='form']");
        console.log(formObj);
        $(".btn-danger").on("click", function () {
            self.location = "/mypage/member/get?memNo="+${login.memNo};
        });
        $(".btn-warning").on("click", function () {
            formObj.submit();
        });
    });
</script>

</body>
</html>

<%@ include file="../../include/footer.jspf" %>