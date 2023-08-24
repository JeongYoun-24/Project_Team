<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
</head>
<body>
    <!DOCTYPE html>
    <html lang="en">
        <head>
            <meta charset="UTF-8">
            <title>shoppingmall</title>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
            <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
            <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    
              <!--부트 아이콘 -->
           <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
            <style>
                div{
                    font-family: 'Noto Sans KR', sans-serif;
                }
                ul, ol, li { list-style: none; }
        
                a {
                    text-decoration: none;
                    color: #111;
                }
               
            </style>                     
        </head>
    <body>
        <!--배너-->
        <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
            <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>
          
          
          
          
          
          
            <!--네비바-->
           <jsp:include page="../nav/nav.jsp"/>   
        
       <!-- 장바구니-->
   <div class="cart p-3 m-3">
            <div class="container justify-content-center w-100">
                
                
               
           
                <c:choose>
                    <c:when test="${not empty cartDTO }">
                 <div class="border-0">
                    <!-- <div class=" row justify-content-start"> -->
                     <h3  class="row mt-1 w-75 m-1 p-5">장바구니</h3>
                    <div class="row  border mt-3">
                    <hr class="" style="display: inline-block";>
                    <c:forEach var="dto" items="${cartDTO}" varStatus="loop">
	                  <form action="${ctxPath}/order/insert" method="get">
	                    <div class="col-md-3 mt-2">
	                    	<div>
	                    		 <input type="hidden" id="cart" value="${dto.cart}">
	                    		<input type="hidden" id="product_code" value="${dto.product_code}">
	                    		<input type="hidden" id="user_id" value="${loginInfo}">
	                    		<input type="hidden" id="product_code" name="product_code" value="${dto.product_code}">
	                    		<img alt="" style="width: 200px" src="${ctxPath}/product_img.do?pro_img=${dto.pro_img}&product_code=${dto.product_code}">
	                    	</div>
	                    	<div>
	                    		
	                    	</div>
	                    	
	                    </div>
	                    <div class="col-md-3 mt-3">

	                    	<input type="hidden" id="pro_price" name=""value="${dto.pro_price}">
	                    	<input type="hidden" id="pro_qty" name="pro_qty" value="${dto.pro_qty}"> 
	                    		${dto.pro_name} <br>
	                    		${dto.pro_price}원<br>
	                    		${dto.pro_qty}개
	                   	</div>
	                   	 <div class="col-md-3 border">
	                   	 	<div class="text-center">
	                 		<c:set var="total" value="${dto.pro_price * dto.pro_qty}"/>
	                 			<input type="hidden" name="total" value="${total}">
	                   	 	총 <span id="total" class="total">${total}</span>원
	                   	 	
	                   	 
	                   	 	
	                   	 	</div>
	                   	 	<div>
	                   	 	
	                   	 	</div>
	                    		
	                   	</div>
	                   	
	                    
                    <div class="col-md-3 mt-3">
                        <button type="submit"class="btn btn-dark btn-lg m-1 p-1" id="orderBtn"> 결제하기</button>
						<button type="button" class="btn btn-dark" id=cartDeleteBtn>장바구니 삭제</button>
                    </div>
                    <hr>
                    </form>
                    </c:forEach>
                	</div>
            
				
                 </div>
                 
                 
                    </c:when>
	                <c:otherwise>
	                  <div class ="container">
                    <div class="row">
                        <div class="col-6 align-content-center">
                            <div style="padding: 50px;">
                                <p style="font-size: 8px;" class="text-center">장바구니가 비어있습니다.</p>
                            </div>
                        </div>
                        <div class="row">
                            <hr class="col-6" style="display: inline-block";>
                            <div class="col-6"></div>
                        </div>
                        <div class="row">
                            <div class="col-6"><button type="button" class="btn btn-light btn-lg" style= "width: 100%; height: 100%";" id="list">+더담으러가기</button></div>
                            <div class="col-6"></div>
                        </div>

                        </div>

                           
                        
                    </div>
	                
	                
	                
	                </c:otherwise>
	                
	   </c:choose>
                  
                    
                    
                	</div>


                </div>
            </div>
    	</div>
 <script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>


</body>
<script type="text/javascript">
$(function () {
/* 	var pro_price = $('#pro_price').val();
	var pro_qty = $('#pro_qty').val();
	
	var totalPrice = pro_price * pro_qty;
	console.log(pro_price)
	console.log(pro_qty)
	console.log(totalPrice)
	$('#total').text(totalPrice) */
	
	var data = 10;
	
	for(var i = 0; i <4; i++){
	/* 	var pro_price = $('#pro_price')
		var pro_qty = $('#pro_qty'). */
		
	
	}
	
	
	
	$('#list').click(function () {
		location.href="${ctxPath}/productList"
		
	})
	
	/* $('#orderBtn').click(function() {
		
		location.href="${ctxPath}/order/insert?product_code="
		
		
	}) */
	
	
	
	
	$('#cartDeleteBtn').click(function (e) {
		
		var user_id = $('#user_id').val();
		var product_code = $('#product_code').val();
		var cart =  $('#cart').val();
		
		location.href="${ctxPath}/cart/delete?cart="+cart+"&"+"user_id="+user_id
		
		var _jsonData = '{'+
		'"user_id": "'+user_id +'", '+
		'"product_code": "'+product_code+'",'+
		'"cart":"'+cart+
		'"}';
		

		console.log(_jsonData)
		
		/* $.ajax({  //페이지가 아닌 데이터만 보내기
			type: "post",
			async: true, //true=비동기
			url: "${ctxPath}/cart/delete",
			dataType : 'text', //서버로부터 받은 데이터 타입
			data:{user_id,product_code ,cart}, //매개변수
			success : function(data,textStatus){
			//	JSON.parse(data);
			var jsonMessage = JSON.parse(data);
			//alert(jsonMessage);
			console.log(jsonMessage);
		
			if(jsonMessage.code === "ok"){
				alert('삭제 성공');
				location.href="${ctxPath}/cartList?user_id=${loginInfo}"
			
			}else{
				alert('장바구니 삭제 실패');
				console.log(jsonMessage);
				
			}
			
			},
			error: function(){
				
			},
			complete : function(){
				
			}
			
			
			}) //end   */
			
	
	})
})

</script>



</html>