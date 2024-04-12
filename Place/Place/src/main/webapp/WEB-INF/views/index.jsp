<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="http://pinnpublic.dothome.co.kr/cdn/example-min.css">
<style>
	#main {
		display: grid;
		grid-template-columns: 900px 300px;
		align-items: start;
	}
	
	#map {
		height: 500px;
		border: 1px solid #AAA;
	}
	
	#list {
		margin-right: 30px;
	}
	
	h1 > span {
		float: right;
		margin-top: -3px;
		color: yellowgreen;
		cursor: pointer;
	}
	
	#map2 {
		width: 465px;
		height: 400px;
		border: 1px solid #AAA;
	}
	
	#tblAdd {
		width: 467px;
		margin-top: 10px;
		margin-bottom: 10px;
		background: rgba(0,0,0,.03);
	}
	
	#tblAdd input, #tblAdd textarea, #tblAdd select {
		width: 432px;
	}
	
</style>
</head>
<body class="wide">
	<!-- index.jsp -->
	<h1>
		Place <small>Map</small>
		<span class="material-symbols-outlined" data-sidebar-button="add" id="btnSidebar">file_map</span>
	</h1>
	
	<div id="main">
		<div id="map"></div>
		<div id="list" class="list full">
			<div>아이템</div>
			<div>아이템</div>
			<div>아이템</div>
		</div>
	</div>
	
	
	<!-- 장소 등록 페이지 -->
	<div data-sidebar-window="add" data-sidebar-title="Add Place" data-sidebar-direction="left" data-sidebar-size="wide">
		
		<div id="map2"></div>
		
		<table id="tblAdd">
			<tr>
				<td>
					<select name="category">
						<c:forEach items="${clist}" var="dto">
						<option value="${dto.seq}">${dto.name}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td><input type="text" name="lat" placeholder="위도" readonly></td>
			</tr>
			<tr>
				<td><input type="text" name="lng" placeholder="경도" readonly></td>
			</tr>
			<tr>
				<td><input type="text" name="address" placeholder="주소" readonly></td>
			</tr>
			<tr>
				<td><input type="text" name="name" placeholder="장소명을 입력하세요."></td>
			</tr>
			<tr>
				<td><textarea name="description" placeholder="장소에 대한 설명을 입력하세요."></textarea></td>
			</tr>
		</table>
		<div>
			<button type="button" class="add" id="btnAdd">등록하기</button>
			<button type="button" class="back" id="btnClose">닫기</button>
		</div>
		
	</div>
	
	
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=aee9a65a1b49a897184f218db1f2b195&libraries=services"></script>
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="http://pinnpublic.dothome.co.kr/cdn/example-min.js"></script>
	
	<script>
	
	
		//메인 지도
		const container = document.getElementById('map'); 
		const options = {
				center: new kakao.maps.LatLng(37.49932744336939, 127.03332155759142),
			level: 3
		};	
		const map = new kakao.maps.Map(container, options);
		
		
		
		
		
		
		//등록 지도
		const container2 = document.getElementById('map2'); 
		const options2 = {
				center: new kakao.maps.LatLng(37.49932744336939, 127.03332155759142),
			level: 3
		};	
		const map2 = new kakao.maps.Map(container2, options2);
		
		
		let addMarker = null;
		let markerPath = 'bakery.png';
		
		kakao.maps.event.addListener(map2, 'click', function(evt) {
			
			if (addMarker != null) {
				addMarker.setMap(null);
			}
			
			addMarker = new kakao.maps.Marker({
				position: new kakao.maps.LatLng(evt.latLng.getLat(), evt.latLng.getLng())
			});
			
			setMarkerImage();			
			addMarker.setMap(map2);
			
			
			
			const geocoder = new kakao.maps.services.Geocoder();
			
			let address = '';
			
			geocoder.coord2Address(evt.latLng.getLng(), evt.latLng.getLat()
									, function(result, status) {
				if (status == kakao.maps.services.Status.OK) {
					address = result[0].address.address_name;
				} else {
					address = '주소를 찾지 못했습니다.';
				}
				
				$('#tblAdd input[name=address]').val(address);
				
			});
			
			
			$('#tblAdd input[name=lat]').val(evt.latLng.getLat());
			$('#tblAdd input[name=lng]').val(evt.latLng.getLng());
			
			
		}); //마커 등록 + 클릭
		
		
		//DB Data > (변환) > JavaScript Data
		const markerList = [
			<c:forEach items="${clist}" var="dto">
			{
				seq: ${dto.seq},
				name: '${dto.name}',
				marker: '${dto.marker}'
			},
			</c:forEach>
		];
		
		
		//등록 + 카테고리 기본값
		$('#tblAdd select').val(6);
		
		$('#tblAdd select').change(function() {
			
			//alert(event.target.value);
			
			markerList.forEach(item => {
				if (item.seq == event.target.value) {
					//alert(item.marker);
					markerPath = item.marker;			
				}
			});
			
			setMarkerImage();
			
		});
		
		
		function setMarkerImage() {
			
			if (addMarker != null) {
				const path = '/place/marker/' + markerPath;
				const size = new kakao.maps.Size(64, 64);
				const op = {};
				const mImg = new kakao.maps.MarkerImage(path,size,op);
				addMarker.setImage(mImg);
			}
			
		}
		
		
		$('#btnAdd').click(() => {
						
			$.ajax({
				type: 'POST',
				url: '/place/addplace.do',
				data: {
					category: $('#tblAdd select').val(),
					lat: $('#tblAdd input[name=lat]').val(),
					lng: $('#tblAdd input[name=lng]').val(),
					address: $('#tblAdd input[name=address]').val(),
					name: $('#tblAdd input[name=name]').val(),
					description: $('#tblAdd textarea').val()
				},
				dataType: 'json',
				success: function(result) {
					
					if (result.result == 1) {
						
						addMarker.setMap(null);
						map2.setCenter(new kakao.maps.LatLng(37.49932744336939, 127.03332155759142));
						
						$('#tblAdd select').val(6);
						$('#tblAdd input[name=lat]').val('');
						$('#tblAdd input[name=lng]').val('');
						$('#tblAdd input[name=address]').val('');
						$('#tblAdd input[name=name]').val('');
						$('#tblAdd textarea').val('');
						
						$('.sidebar-title .material-symbols-outlined').click();
						
					} else {
						alert('failed');
					}
					
				},
				error: function(a,b,c) {
					console.log(a,b,c);
				}
			});
			
		});
		
		$('#btnClose').click(() => {
			$('.sidebar-title .material-symbols-outlined').click();
		});
		
		
		
		
		
		setTimeout(() => {
			$('#btnSidebar').click();			
		}, 300);
		
	</script>
</body>
</html>










