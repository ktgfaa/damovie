<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<style>
	body{
		margin: 0;
		padding: 0;
		background-image: url('/damovie/resources/images/background20.png');
		background-size : 1920px;
		background-color: black;
	}
	#container{
		width: 100%;
		height: 100%;
	}
	
	#content {
    position: relative;
    margin: 0;
    height : 100%;
    z-index:50;
		
	}
</style>
<title><tiles:insertAttribute name="title" /></title>
</head>
<body>
	<div id="container">
		<div id="header">
			<tiles:insertAttribute name="header" />
		</div>
		<div id="sidebar-left">
			<tiles:insertAttribute name="l_side" />
		</div>
		<div id="sidebar-right">
			<tiles:insertAttribute name="r_side" />
		</div>
		<div id="content">
			<tiles:insertAttribute name="body" />
		</div>
	</div>
</body>
</html>