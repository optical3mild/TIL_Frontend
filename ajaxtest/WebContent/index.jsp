<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
	<!-- viewport: 반응형 웹 해상도 설정 -->
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<link rel="stylesheet" href="css/bootstrap.css">
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="js/bootstrap.js"></script>
	
	<!-- script type : 없어도 작동되지만 작성시 브라우저가 좀더 안정적으로 작동. -->
	<script type="text/javascript">
		// XMLHttpRequest() : 어떤 웹사이트에 요청을 하는 인스턴스.
		var searchRequest = new XMLHttpRequest();
		var registerRequest = new XMLHttpRequest();
		function searchFunction() {
			//요청을 열고(?) post방식으로 UserSearchServlet이란 페이지에
			//userName으로 입력된 값(value)을 utf8로 인코딩하여 보냄 
			searchRequest.open("Post", "./UserSearchServlet?userName=" + encodeURIComponent(document.getElementById("userName").value),true)
			//searchRequest.open("Post", "./UserSearchServlet?userName=" + encodeURIComponent("%"+ document.getElementById("userName").value +"%"),true)
			//--> 서블릿으로 전송된 parameter를 처리하여 json형식으로 받음 
			
			//성공적으로 실행되었다면 searchPorcess를 실행.
			searchRequest.onreadystatechange = searchProcess;
			searchRequest.send(null);
		}
		function searchProcess() {
			var table = document.getElementById("ajaxTable");
			
			//table안의 내용을 전부지움
			table.innerHTML = "";
			
			//통신 성공시 searchRequest의 readyState 값이 4, status값이 200 
			if(searchRequest.readyState == 4 && searchRequest.status == 200) {
				//object에 searchRequest의 responseText(servlet에서 만든 json 데이터)를 받음
				var object = eval('(' + searchRequest.responseText + ')');
				//result변수에 object변수의 result가 담김
				//servlet안에서 result란 이름으로 데이터를 배열로 담기 때문에 result를 가져옴
				var result = object.result;
				for(var i=0; i<result.length;i++) {
					//insertRow: 현재의 table에 하나의 행을 만들어줌
					var row = table.insertRow(0);
					// row에 cell을 생성, 데이터 삽입.
					//하나의 배열에서 값이 끝날 때 까지 인덱스 차례대로 회원정보를 검색
					for(var j=0;j<result[i].length;j++) {
						//cell을 해당행에 추가.
						var cell = row.insertCell(j);
						//cell에 result배열상 해당 인덱스의 값을 넣어줌.
						cell.innerHTML = result[i][j].value;
					}
				}
			}
		}
		function registerFunction() {
			//요청을 열고(?) post방식으로 UserRegisterServlet이란 페이지에
			//userName으로 입력된 값(value)을 utf8로 인코딩하여 보냄 
			//registerGender는 id값 사용없이 name으로 묶어져 있음. jQuery 사용.
			registerRequest.open("Post", "./UserRegisterServlet?userName=" + encodeURIComponent(document.getElementById("registerName").value)
															+ "&userAge=" + encodeURIComponent(document.getElementById("registerAge").value)
															+ "&userGender=" + encodeURIComponent($('input[name=registerGender]:checked').val())
															+ "&userEmail=" + encodeURIComponent(document.getElementById("registerEmail").value),true);
			//성공적으로 실행되었다면 registerProcess를 실행.
			registerRequest.onreadystatechange = registerProcess;
			registerRequest.send(null);
		}
		
		function registerProcess() {
			if(registerRequest.readyState == 4 && registerRequest.status == 200) {
				var result = registerRequest.responseText;
				if(result != 1) {
					alert("등록에 실패했습니다.");
				} else {
					//등록에 성공했다면 화면의 입력란을 전부 공백으로 만들어줌.
					var userName = document.getElementById("userName");
					var registerName = document.getElementById("registerName");
					var registerAge = document.getElementById("registerAge");
					var registerEmail = document.getElementById("registerEmail");
					userName.value = "";
					registerName.value = "";
					registerAge.value = "";
					registerEmail.value = "";
					searchFunction();
				}
			}
		}
		
		//페이지 첫 로딩시 자동으로 함수 작동.
		window.onload = function() {
			searchFunction();
		}
	</script>
	<title>Jsp Ajax</title>
</head>
<body>
	<br>
	<div class="container">
		<div class="form-group row pull-right">
			<div class="col-xs-8">
				<!-- onkeyup: 입력창에 입력 할때마다 function 실행. -->
				<input class="form-control" id="userName" onkeyup="searchFunction();" type="text" size="20">
			</div>
			<div class="col-xs-2">
				<button class="btn btn-primary" onclick="searchFunction();" type="button">검색</button>
			</div>	
		</div>
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th style="background-color: #fafafa; text-align: center">이름</th>
					<th style="background-color: #fafafa; text-align: center">나이</th>
					<th style="background-color: #fafafa; text-align: center">성별</th>
					<th style="background-color: #fafafa; text-align: center">이메일</th>
				</tr>
			</thead>
			<tbody id="ajaxTable">
			</tbody>
		</table>
	</div>
	
	<div class="container">
		<table class="table" style="text-align: center; border: 1px solid #dddddd">
			<thead>
				<tr>
					<th colspan="2" style="background-color: #fafafa; text-align:center;">회원등록 양식</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="background-color: #fafafa; text-align:center;"><h5>이름</h5></td>
					<td><input class="form-control" type="text" id="registerName" size="20"></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align:center;"><h5>나이</h5></td>
					<td><input class="form-control" type="text" id="registerAge" size="20"></td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align:center;"><h5>성별</h5></td>
					<td>
						<div class="form-group" style="text-align: center; margin: 0 auto;">
							<div class="btn-group" data-toggle="buttons">
								<label class="btn btn-primary active">
									<input type="radio" name="registerGender" autocomplete="off" value="남자" checked>남자
								</label>
								<label class="btn btn-primary">
									<input type="radio" name="registerGender" autocomplete="off" value="여자">여자
								</label>
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<td style="background-color: #fafafa; text-align:center;"><h5>이메일</h5></td>
					<td><input class="form-control" type="text" id="registerEmail" size="20"></td>
				</tr>
				<tr>
					<td colspan="2"><button class="btn btn-primary pull-right" onclick="registerFunction();" type="button">등록</button>
				</tr>
			</tbody>
		</table>
	</div>
	
</body>
</html>