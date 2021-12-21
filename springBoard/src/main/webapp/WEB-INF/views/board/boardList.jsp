<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>list</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		$j("#checkall").click(function(){
	        //클릭되었으면
	        if($j("#checkall").prop("checked")){
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 true로 정의
	            $j("input[name=boardType]").prop("checked",true);
	            //클릭이 안되있으면
	        }else{
	            //input태그의 name이 chk인 태그들을 찾아서 checked옵션을 false로 정의
	            $j("input[name=boardType]").prop("checked",false);
	        }
	    });
		
		
		$j('#btnType').on("click",function(){
			var array = [];
			$j('input:checkbox[name=boardType]:checked').each(function() { // 체크된 체크박스의 value 값을 가지고 온다.
			    array.push(this.value);
			});
			
			
		});
	});
</script>
<body>
<table  align="center">
	<tr>
		<td align="right">
			total : ${totalCnt}
		</td>
	</tr>
	<tr>
		<td>
			<table id="boardTable" border = "1">
				<tr>
					<td width="80" align="center">
						Type
					</td>
					<td width="40" align="center">
						No
					</td>
					<td width="300" align="center">
						Title
					</td>
				</tr>
				<c:forEach items="${boardList}" var="list">
					<tr>
						<td align="center">
							${list.codeName}
						</td>
						<td>
							${list.boardNum}
						</td>
						<td>
							<a href = "/board/${list.boardType}/${list.boardNum}/boardView.do?pageNo=${pageNo}">${list.boardTitle}</a>
						</td>
					</tr>	
				</c:forEach>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<a href ="/board/boardWrite.do">글쓰기</a>
		</td>
	</tr>
	<tr>
		<td>
		<input type="checkbox" id="checkall" value="">전체
		<c:forEach  items="${codeList}" var="code">
			<input type="checkbox" name="boardType" id="chkType" value="${code.codeId }">${code.codeName }
		</c:forEach>
		<input type="button" id="btnType" value="조회">
		</td>
	</tr>
</table>	
</body>
</html>