<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="domain.Board"%>
<%@page import="java.util.List"%>
<%@page import="dao.BoardDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>답글쓰기</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<%
	// 세션값 가져오기
	String id = (String) session.getAttribute("id");
	// 세션값 없으면 login.jsp이동
	if (id == null) {
		response.sendRedirect("../member/login.jsp");
		return;
	}
	
	// re_ref  re_lev  re_seq   pageNum  파라미터 가져오기
	String pageNum = request.getParameter("pageNum");
%>
<jsp:useBean id="board" class="domain.Board"/>
<jsp:setProperty property="*" name="board"/>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp" />
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="../index.jsp">HOME</a></li>
<li><a href="../center/juventus.jsp">구단 소개</a></li>
<li><a href="../center/manager.jsp">감독 소개</a></li>
<li><a href="../center/players.jsp">선수단 소개</a></li>
<li><a href="../center/fnotice.jsp">자유게시판</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->

<!-- 게시판 -->
<article>
<h1>답글쓰기</h1>


<form action="freWritePro.jsp?pageNum=<%=pageNum %>" method="post" name="frm" enctype="multipart/form-data">
	<input type="hidden" name="re_ref" value="<%=board.getRe_ref()%>">
	<input type="hidden" name="re_lev" value="<%=board.getRe_lev()%>">
	<input type="hidden" name="re_seq" value="<%=board.getRe_seq()%>">
<table id="notice">
<tr><th>이름</th>
	<td><input type="text" name="name"></td></tr>
<tr><th>패스워드</th>
	<td><input type="password" name="passwd"></td></tr>
<tr><th>제목</th>
	<td><input type="text" name="subject" value="[답글] "></td></tr>
<tr><th>파일</th>
	<td><input type="file" name="filename"></td></tr>
<tr><th>내용</th>
	<td><textarea rows="13" cols="40" name="content"></textarea></td></tr>
</table>
<div id="table_search">
<input type="submit" value="답글쓰기" class="btn">
<input type="reset" value="다시작성" class="btn">
<input type="button" value="목록보기" class="btn" onclick="location.href='fnotice.jsp?pageNum=<%=pageNum%>'">
</div>
</form>


<div class="clear"></div>
<div id="page_control">
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<%@include file="../inc/bottom.html" %>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>