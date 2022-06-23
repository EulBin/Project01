<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="utf-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge" />
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no" />
        <meta name="description" content="" />
        <meta name="author" content="" />
        <title>회원가입</title>
        <link href="css/styles.css" rel="stylesheet" />
        <script src="<%=request.getContextPath() %>/resources/jQuery/jquery-3.6.0.min.js"></script>
        <script src="https://use.fontawesome.com/releases/v6.1.0/js/all.js" crossorigin="anonymous"></script>
    <script type="text/javascript">
		function validateForm(form) {
			if (form.userid.value ==""){
				alert("아이디를 입력하세요.");
				form.userid.focus();
				return false;
			}
			/* if(form.idDuplication.value =='idUnckeck') {
	    		//idcheck 여부
	    		alert("아이디중복확인을 하세요");
	    		form.user_id.focus();
	    		return false;
	    	} */
			if (form.pwd.value == ""){
				alert("비밀번호를 입력하세요.");
				form.pwd.focus();
				return false;
			}
			if(form.pwd.value!= form.pwd2.value) {
    			alert("비밀번호가 다릅니다. 다시입력해주세요");
    			form.pwd.value="";
    			form.pwd2.value="";
        		form.pwd.focus();
        		return false;
        	}
			if (form.name.value ==""){
				alert("이름을 입력하세요.");
				form.name.focus();
				return false;
			}
			if(form.user_phone1.value == '' || form.user_phone2.value == '' || form.user_phone3.value == '') {
	    		//휴대폰번호
	    		alert("휴대폰번호를 입력해주세요");
	       		form.user_phone1.focus();
	       		return false;
	    	}
			if( form.user_email1.value == '' || form.user_email2.value == '') {
	    		//휴대폰번호
	    		alert("이메일을 입력해주세요");
	       		form.user_email1.focus();
	       		return false;
	    	}
		}
		function idCheck(form) {

		if(!checkExistData(form.userid.value, "invalid-id", "아이디를 입력해주세요")) {
    		
    		form.user_id.focus();
    		return false;
    	}
		else {
    		window.open('idcheck.do?userid='+form.userid.value,'','width=600,height=300');
    	}
    } 
	    //이메일 select 선택시
	    function inputEmail(form) {
	    	var e_domain_str = form.email_domain.value;
	    	if(e_domain_str =="") {
	    		form.user_email2.readOnly = false; 
	    		form.user_email2.value ='';
	    	}
	    	else {
	    		form.user_email2.readOnly = true;
	    		form.user_email2.value =e_domain_str;
	    	}
	    }
	</script>
    
    
    </head>
    <form action="../admin/register.do" name="writeFrm" method="post"
	onsubmit="return validateForm(this)">
    <body class="bg-primary">
        <div id="layoutAuthentication">
            <div id="layoutAuthentication_content">
                <main>
                    <div class="container">
                        <div class="row justify-content-center">
                            <div class="col-lg-7">
                                <div class="card shadow-lg border-0 rounded-lg mt-5">
                                    <div class="card-header"><h3 class="text-center font-weight-light my-4">회원 가입 하기</h3></div>
                                    <div class="card-body">
                                        <form>
                                            <div class="row g-3">
												
												<!-- 아이디 -->
												<div class="col-12">
													<label for="user_id" class="form-label">ID</label> 
													<div class="input-group mb-3">
														<input type="text" class="form-control" id="userid" name="userid" placeholder="">
														<button type="button" class="btn btn-outline-secondary" onclick="idCheck(this.form);">중복확인</button>    
													</div>
													<div class="invalid-id"></div>
													<input type="hidden" name="idDuplication" value="idUnckeck">
												</div>
												
												<!-- pw -->
												<div class="col-sm-6">
													<label for="user_pw1" class="form-label">패스워드</label> 
													<input type="text" class="form-control" id="pwd" name="pwd" placeholder="">
												</div>
												
												<div class="col-sm-6">
													<label for="user_pw2" class="form-label">패스워드 확인</label> 
													<input type="text" class="form-control" id="pwd2" name="pwd2" placeholder="">
												</div>
												
												<div class="col-12">
													<div class="invalid-pw"></div>
												</div>
												
												<!-- name -->
												<div class="col-12">
													<label for="user_name" class="form-label">이름</label> 
													<input type="text" class="form-control" id="user_name" name="name" placeholder="">
													<div class="invalid-name"></div>
												</div>
						
												<!-- email -->
												<div class="col-12">
													<label for="user_email" class="form-label">이메일</label>
													<div class="input-group has-validation">
														<input type="text" class="form-control" id="user_email1" name="user_email1" placeholder="">
														<span class="input-group-text">@</span> 
														
														<input type="text" class="form-control" id="user_email2" name="user_email2" placeholder="직접입력">
														
														
														<select class="form-select" id="email_domain" name="email_domain" onchange="inputEmail(this.form);">
															<option value="" selected="selected">선택</option>
														    <option value="naver.com">naver.com</option>
														    <option value="hanmail.net">hanmail.net</option>
														    <option value="gmail.com">gmail.com</option>
														</select> 
													</div>
													
												</div>
												
												<div class="col-12">
													<div class="invalid-email"></div>
												</div>
						
												<!-- phone -->
												<div class="col-12">
													<label for="user_phone" class="form-label">휴대폰번호</label>
													<div class="input-group has-validation">
														<select class="form-select" id="country" name="user_phone1" required="">
															<option value="" selected="selected">선택</option>
														  	<option value="010" >010</option>
														    <option value="011">011</option>
														    <option value="016">016</option>
														    <option value="017">017</option>
														    <option value="018">018</option>
														    <option value="019">019</option>
														</select> 
														<input type="text" class="form-control" id="user_phone2" name="user_phone2" placeholder=""> 
														<span class="input-group-text">-</span> 
														<input type="text" class="form-control" id="user_phone3" name="user_phone3" placeholder="">
														
													</div>
												</div>
						
												<div class="col-12">
													<div class="invalid-phone"></div>
												</div>
                                            <div class="mt-4 mb-0">
                                                <div class="d-grid">
                                               <button class="btn btn-primary btn-block" type="submit">가입하기</button>
                                                </div>
                                            </div>
                                            </div>
                                        </form>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </main>
            </div>
            <div id="layoutAuthentication_footer">
                <footer class="py-4 bg-light mt-auto">
                    <div class="container-fluid px-4">
                        <div class="d-flex align-items-center justify-content-between small">
                            <div class="text-muted">Copyright &copy; Your Website 2022</div>
                            <div>
                                <a href="#">Privacy Policy</a>
                                &middot;
                                <a href="#">Terms &amp; Conditions</a>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
        </div>
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" crossorigin="anonymous"></script>
        <script src="js/scripts.js"></script>
    </body>
    </form>
</html>
