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
	#sidebar-left {
		width: 100%;
		height: 100%;
		float: left;
		z-index: 100;
	}
	#sidebar-right{
		position: absolute;
		top: 30px;
		right: 10px;
		width: 50px;
		height:200px;
		padding:10px;
		z-index: 99;
	}
	#content {
    position: fixed;
    width: 100%;
    top: 210px;
    margin: 0;
    margin-top: 1%;
    height : 100%;
    text-align: center;
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