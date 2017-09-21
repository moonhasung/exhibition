<%@ page contentType="text/html; charset=UTF-8" %> 
<%@ include file="/team/ssi.jsp" %>
<%
	int teamno = Integer.parseInt(request.getParameter("teamno"));
	TeamDTO dto = dao.read(teamno);
 %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
*{
	font-size: 20px;
	font-family: gulim;
}
div{
	text-align: center;
	margin-top: 20px;
	margin-bottom: 20px;
}
table{
	width:60%;
	margin:0 auto;
}
table,th,td{
	border: 1px solid black;
	border-collapse: collapse;
}
</style>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sample6_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var fullAddr = ''; // 최종 주소 변수
                var extraAddr = ''; // 조합형 주소 변수

                // 사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    fullAddr = data.roadAddress;

                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    fullAddr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 조합한다.
                if(data.userSelectedType === 'R'){
                    //법정동명이 있을 경우 추가한다.
                    if(data.bname !== ''){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있을 경우 추가한다.
                    if(data.buildingName !== ''){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 조합형주소의 유무에 따라 양쪽에 괄호를 추가하여 최종 주소를 만든다.
                    fullAddr += (extraAddr !== '' ? ' ('+ extraAddr +')' : '');
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample6_postcode').value = data.zonecode; //5자리 새우편번호 사용
                document.getElementById('sample6_address').value = fullAddr;

                // 커서를 상세주소 필드로 이동한다.
                document.getElementById('sample6_address2').focus();
            }
        }).open();
    }
</script>
</head>
<body>
<jsp:include page="/menu/top.jsp"/>
<div class="title">팀정보 수정</div>
<form name="frm" action="./updatePorc.jsp" method="post">
<input type="hidden" name="teamno" value="<%=teamno %>">
	<input type="hidden" name = "col" value="<%=request.getParameter("col")%>">
	<input type="hidden" name = "word" value="<%=request.getParameter("word")%>">
<table>
<tr>
	<th>이름</th>
	<td><input type="text" name="name" value="<%=dto.getName() %>" ></td>
</tr>
<tr>
	<th>성별</th>
	<td>
	<label>
		<input type="radio" name="gender" value="남자"
		<%if(dto.getGender().equals("남자")){ %>
		checked="checked"
		<%} %>
		>남자
	</label>
	<label>
		<input type="radio" name="gender" value="여자"
		<%if(dto.getGender().equals("여자")){ %>
		checked="checked"
		<%} %>
		>여자
	</label>
	</td>
</tr>
<tr>
	<th>전화번호</th>
	<td><input type="text" name="phone" value="<%=dto.getPhone()%>"></td>
</tr>
<tr>
	<th>우편번호</th>
	<td>
	<input type="text" name="zipcode" size="8" 
	maxlength="5" id="sample6_postcode" 
	placeholder="우편번호" value="<%=dto.getZipcode()%>">
	<input type="button" value="주소검색" onclick="sample6_execDaumPostcode()">
	</td>	
</tr>
<tr>
	<th>주소</th>
	<td>
		<input type="text" name="address1" 
		size="45" id="sample6_address" 
		placeholder="주소" value="<%=dto.getAddress1()%>"><br>
		<input type="text" name="address2" size="45" 
		id="sample6_address2" 
		placeholder="상세주소" value="<%=dto.getAddress2()%>">
	</td>
</tr>
<tr>
	<th>보유기술</th>
	<td>
		<label><input type="checkbox" name="skills" value="java"
		<%if(dto.getSkill().indexOf("java")!=-1){	%>
		checked="checked"
		<%}%>
		>java</label>
		<label><input type="checkbox" name="skills" value="jsp"
		<%if(dto.getSkill().indexOf("jsp")!=-1){	%>
		checked="checked"
		<%}%>
		>jsp</label>
		<label><input type="checkbox" name="skills" value="MVC"
		<%if(dto.getSkill().indexOf("MVC")!=-1){	%>
		checked="checked"
		<%}%>
		>MVC</label>
		<label><input type="checkbox" name="skills" value="spring"
		<%if(dto.getSkill().indexOf("spring")!=-1){	%>
		checked="checked"
		<%}%>
		>spring</label>
		<label><input type="checkbox" name="skills" value="jQuery"
		<%if(dto.getSkill().indexOf("jQuery")!=-1){	%>
		checked="checked"
		<%}%>
		>jQuery</label>	
	</td>
</tr>
<tr>
	<th>취미</th>
	<td>
		<select name="hobby">
			<option>취미를 선택하세요</option>
			<option value="기술서적 읽기">기술서적 읽기</option>
			<option value="웹툰보기">웹툰보기</option>
			<option value="운동">운동</option>
			<option value="영화감상">영화감상</option>
			<option value="색칠공부">색칠공부</option>
			<option value="보드타기">보드타기</option>
		</select>
		<script type="text/javascript">
		document.frm.hobby.value='<%=dto.getHobby()%>';
		</script>
	</td>
</tr>
<tr>
	<th>사진</th>
	<td><input type="file" name="filename" ><%=dto.getFilename() %></td>
</tr>
</table>
<div class="bottom">
	<button type="submit">전송</button>
	<button type="reset">다시입력</button>
</div>
</form>
<jsp:include page="/menu/bottom.jsp"/>
</body>
</html>







