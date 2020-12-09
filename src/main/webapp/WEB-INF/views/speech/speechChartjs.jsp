<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>부트스트랩 차트그리기</title>

<!-- 차트 링크 -->
<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script>
</head>
<body>
	<div class="container">
		<canvas id="myChart"></canvas>
	</div>
	<script>
	
	var count = [];
	var english = [];
	var korean = [];
	var speech = [] ;
	
	for (var i = 0; i < ${count }; i++) {
			count.push(i)
	} 

	
	<c:forEach items = "${EnglishList}" var = "english">
		english.push("${english.scriptTestScore}")
	</c:forEach>
		
	<c:forEach items = "${KoreanList}" var = "korean">
		korean.push("${korean.scriptTestScore}")
	</c:forEach>
		
	<c:forEach items = "${speechList}" var = "speech">
		speech.push("${speech.speechTestScore}")
	</c:forEach> 
	
	
	
	var ctx = document.getElementById('myChart').getContext('2d'); 
	var chart = new Chart(ctx, { 
		//챠트 종류를 선택  
		type: 'line', 
		// 챠트를 그릴 데이타 
		
		data: { 
			labels: count, 
			datasets: [{ 
				label: 'English Test', 
				backgroundColor: 'transparent', 
				borderColor: 'blue',
				data: english, 
			},{
				label: 'Korean Test', 
				backgroundColor: 'transparent', 
				borderColor: 'red',
				data: korean, 
			},{
				label: 'Speech Test', 
				backgroundColor: 'transparent', 
				borderColor: 'green',
				data: speech, 
			}] 
		}, 
		// 옵션
		options: {} 
		});
	</script>
</body>

</html>