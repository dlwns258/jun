<%@page import="com.bigdata2019.mysite.vo.GuestBookVo"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
	List<GuestBookVo> list = (List<GuestBookVo>) request.getAttribute("list");
%>
<!DOCTYPE html>
<html>
<head>
<title>mysite</title>
<meta http-equiv="content-type" content="text/html; charset=utf-8">
<link href="<%=request.getContextPath() %>/assets/css/guestbook.css" rel="stylesheet" type="text/css">
</head>
<body>
	<div id="container">
		<jsp:include page="/WEB-INF/views/includes/header.jsp"/>
		<div id="content">
			<div id="guestbook">
				<form action="<%=request.getContextPath() %>/guestbook" method="post">
					<input type="hidden" name="a" value="insert">
					<table>
						<tr>
							<td>이름</td><td><input type="text" name="name"></td>
							<td>비밀번호</td><td><input type="password" name="password"></td>
						</tr>
						<tr>
							<td colspan=4><textarea name="contents" id="content"></textarea></td>
						</tr>
						<tr>
							<td colspan=4 align=right><input type="submit" VALUE=" 확인 "></td>
						</tr>
					</table>
				</form>
				<br>
			<%
			int totalcount = list.size();
			int index = 0;
			for(GuestBookVo vo : list) {
		%>
		<table width=510 border=1>
			<tr>
				<td>[<%=totalcount - index++%>]
				</td>
				<td><%=vo.getName()%></td>
				<td><%=vo.getRegDate()%></td>
				<form action="/WEB-INF/views/deleteform.jsp" method="post">
				<input type="hidden" name="no" value="<%=vo.getNo()%>">
				<td><a href="/guestbook02/gb?a=form">삭제</a></td>
				</form>
			</tr>
			<tr>
				<td colspan=4><%=vo.getContents()%></td>
			</tr>
		</table>
		<br />
		<%
		}
	%>
			</div>
		</div>
		<jsp:include page="/WEB-INF/views/includes/navigation.jsp"/>
		<jsp:include page="/WEB-INF/views/includes/footer.jsp"/>
	</div>
</body>
</html>