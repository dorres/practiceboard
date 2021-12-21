<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@include file="/WEB-INF/views/common/common.jsp"%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>boardView</title>
</head>
<script type="text/javascript">
	$j(document).ready(function(){
		
		$j("#del").on("click",function(){
			var param = $j('#boardNum').val();
			$j.ajax({
			    url : "/board/boardDeleteAction.do",
			    dataType: "json",
			    type: "POST",
			    data : {"boardNum" : param},
			    success: function(data, textStatus, jqXHR)
			    {
			    	if(data.success == 'Y'){
			    		alert("삭제완료");
						alert("메세지:"+data.success);
			    	}else{
			    		alert("이미 삭제된 게시글입니다.");
			    	}

					/*여기 pageNo 수정 - 현재 페이지 번호였던곳으로??*/
					location.href = "/board/boardList.do?pageNo=1";
			    },
			    error: function (jqXHR, textStatus, errorThrown)
			    {
			    	alert("실패");
			    }
			});
		});
	});
	
</script>
<body>
<input type="hidden" id="boardNum" value="${boardNum}">
<input type="hidden" id="boardType" value="${boardType}">
<table align="center">
	<tr>
		<td>
			<table border ="1">
				<tr>
					<td width="120" align="center">
					Title
					</td>
					<td width="400">
					${board.boardTitle}
					</td>
				</tr>
				<tr>
					<td height="300" align="center">
					Comment
					</td>
					<td>
					${board.boardComment}
					</td>
				</tr>
				<tr>
					<td align="center">
					Writer
					</td>
					<td>
					</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td align="right">
			<input type="button" id="del" value="delete">
			<input type="button" id="upd" value="update" onClick="location.href='/board/boardWrite.do?boardNum=${boardNum}&boardType=${boardType }'">
			<a href="/board/boardList.do">List</a>
		</td>
	</tr>
</table>	
</body>
</html>