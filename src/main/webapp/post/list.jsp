<%@page import="org.jgs1905.entity.Post"%>
<%@page import="org.jgs1905.enums.PostTypeEnum"%>
<%@page import="java.util.List"%>
<%@page import="org.jgs1905.service.PostService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="bp" value="${ pageContext.request.contextPath }" scope="application" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>帖子列表页</title>
<link href="${ bp }/static/css/main.css" rel="stylesheet">
<link href="${ bp }/static/css/pager.css" rel="stylesheet">
</head>
<body>
	<%@ include file="../common/header.jsp" %>

	<div id="pageContent">
		
		<c:if test="${ empty pager.data }">
			<p align="center">暂无帖子</p>
		</c:if>
		
		<c:if test="${ !empty pager.data }">
			<table width="100%" align="center" border="1" cellspacing="0">
				<tr>
					<th width="6%">序号</th>
					<th width="30%">标题</th>
					<th width="6%">类别</th>
					<th width="8%">作者</th>
					<th>摘要</th>
					<th width="8%">评论数</th>
					<th width="20%">发帖时间</th>
				</tr>
	
				<c:forEach items="${ pager.data }" var="post" varStatus="vs">
				
					<tr align="center">
						<td>${ vs.count }</td>
						<td><a href="${ bp }/post?method=detail&id=${ post.id }">${ post.title }</a></td>
						<td>${ PostTypeEnum.values()[post.type].name }</td>
						<td>${ post.nickname }</td>
						<td>${ post.summary }</td>
						<td>${ post.comment_count }</td>
						<td><fmt:formatDate value="${ post.create_time }" pattern="yyyy年MM月dd日 HH点mm分ss秒"/></td>
					</tr>
				
				</c:forEach>
				
			</table>
		</c:if>
		
		<%@ include file="../common/pager.jsp" %>
		
	</div>
	
	<script type="text/javascript" src="${ bp }/static/js/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="${ bp }/static/js/pager.js"></script>
	<script type="text/javascript">
		// 初始化分页
		initPager("${ bp }/post?method=list");
	</script>
	
</body>
</html>