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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <!--부트 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
        crossorigin="anonymous"></script>
    <style>
        div {
            font-family: 'Noto Sans KR', sans-serif;
        }
    
        ul,
        ol,
        li {
            list-style: none;
        }
    
        a {
            text-decoration: none;
            color: #111;
        }
        div >.order{
        background-color: #f2f2f2;
        
      }
      div >.nav-link{
        color: #000000;

      }
      .groove{ border:5px groove; margin: 10px; }
      
    </style>
  </head>

  <body>
    <header>

    <!--배너-->
    <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59"
        style="background: #000000 ;">
        <a href="#none"><span style="color: #ffffff; " class="d-flex justify-content-center">신규회원 무료배송 + 1만원
                쿠폰팩</span></a>
    </div>


    <!--네비바-->
    <div class="main">
    <jsp:include page="../nav/nav.jsp"/>   
</header>
 
<main>
     <div class="container"> 
            <form action="#" method="#">
                <!--주문조회 헤드부분-->
               <div class="row">
                        <div class= "col-10 mt-5">
                            <h5>주문조회</h5>
                        </div>
                    
                    <div class="col-2 p-2 mt-5">
                        <div class="d-flex align-content-end"> 
                            <i class="bi bi-house-door-fill"></i>
                                <i class="bi bi-chevron-compact-right"></i>
                                    <a href="#"><span style="font-size: 15px; color:darkgray">마이쇼핑</span></a>
                                    <i class="bi bi-chevron-compact-right"></i>
                                    <a href="#"> <span style="font-size: 15px;">주문조회</span></a>
                              </div>
                    </div>
               </div>

                            <!--주문조회 네비바-->
                        
                    <div class="col">
                        <div class="container">
                          <nav>
                             <div class="nav nav-tabs" id="nav-tab" role="tablist">
                                <button class="nav-link active" id="nav-home-tab" data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
                                    role="tab" aria-controls="nav-home" aria-selected="true"><a href="#">주문내역조회(0)</a></button>
                                    <button class="nav-link " id="nav-home-tab2" data-bs-toggle="tab" data-bs-target="#nav-home" type="button"
                                            role="tab" aria-controls="nav-home" aria-selected="false"><a href="#">취소/반품/교환내역(0)</a></button>
                                    <div class="tab-content" id="nav-tabContent">
                                        <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab" tabindex="0">
                                        </div>
                                    </div>
                              </div>
                         </nav>
                        </div>
                    </div>
                                
                                <!--주문조회 기간 설정-->
                   <div class="box">
                     <div class="groove">
                         <div class="row">
                                <div class="col-2 m-3 p-1 d-flex justify-content-center">
                                    <form action="#">
                                        <select id="order_menu" name="order_menu" class="Select text-center" style="width: 200px; height:30px;font-size: 14px;color:#111 ;">
                                                <option value="입금전">전체주문처리상태</option>
                                                <option value="입금전">입금전</option>
                                                <option value="php">배송시작(취소/교환불가)</option>
                                                <option value="java">배송중</option>
                                                <option value="golang">배송완료</option>
                                                <option value="python">취소</option>
                                                <option value="c#">교환</option>
                                                <option value="C++">반품</option>
                                        </select>
                                    </form>
                                </div>
                                
                                    
                                                                            
                                    <div class="col-2 m-3 p-1">
                                            <a href="#"><img src="img2/btn_date1.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date2.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date3.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date4.gif" alt=""> </a></li>
                                            <a href="#"><img src="img2/btn_date5.gif" alt=""> </a></li>
                                    </div>
                                        <div class="col-3 m-3 d-flex justify-content-start">
                                                <p>
                                                <input type="date" value="2023-03-31" min="2023-01-01"  max="2023-12-31">
                                                <input type="date" value="2023-06-29" min="2023-01-01" max="2023-12-31">
                                                </p>
                                        </div> 
                                                <div class="col-1 m-3 float-lg-start">
                                                    <button type="button" class="btn btn-secondary btn-sm" href="#">조회</button>
                                                </div>
                         </div>
                     </div>
                </div>
                   <div class="text m-2">
                    <span style="font-size: 12px; color: #b7b7b8;">*기본적으로 최근3개월간의 자료가 조회되며,기간검색시 지난주문내역을 조회히실수 있습니다.</span><br>
                    <span style="font-size: 12px; color: #b7b7b8;">*주문번호를 클릭하시면 해당 주문에 대한 상세내역을 획인하실 수 있습니다.</span>
                   </div>
        </form>
    </div>
   


   <!--주문 상품 정보-->
        <div class="container">
            <div class="title m-2 p-1 mt-5">
                 <span style="font-size: 15px;">주문상품정보</span>
            </div>
             <c:choose>
                  <c:when test="${not empty orderList.orderList }">
                 <table class= "table table-bordered">
                     <thead>
                         <tr>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">주문일자<br>[주문정보]</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">이미지</p></th>
                              <th scope="col" width="40%"><p style="font-size: 13px;" class="text-center">요청사항</p></th>
                              <th scope="col"width="5%"><p style="font-size: 13px;" class="text-center">수량</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">상품구매금액</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">주문처리상태</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">취소/교환/반품</p></th>

                          </tr>
                     </thead>
                        
                        <tbody> 
                        <c:forEach var="dto" items="${orderList.orderList}" varStatus="loop">
                            <tr>
                               <td >${dto.order_join}</td>
                               <td >
                               <a href="${ctxPath}/order/view?user_id=${loginInfo}&order_code=${dto.order_code}">
                              <img alt="" style="width: 100px; height: 100px;" src="${ctxPath}/product_img.do?pro_img=${dto.pro_img}&product_code=${dto.product_code}"> 
                              <!--   <img alt="" style="width: 100px; height: 100px;" src="https://img.megabox.co.kr/SharedImg/store/2022/03/07/qB1IVqlOLCV7hOOEAJp4J9iG3J5oVWjv_280.png"> -->
                                </a>
                                
                                </td>
                               <td >${dto.order_comment}</td>
                               <td >${dto.pro_qty}</td>
                               <c:set var="total" value="${dto.pro_price * dto.pro_qty}"/>
                               <td >${total}</td>
                               <c:if test="${dto.order_status == 2}">
                               <td >배송완료</td>
                               </c:if>
                               <c:if test="${dto.order_status == 1}">
                               <td >주문완료</td>
                               </c:if>
                                <c:if test="${dto.order_status == 0}">
                               <td >주문취소</td>
                               </c:if>
                               <td>
                               	<a href="${ctxPath}/order/update?user_id=${loginInfo}&order_code=${dto.order_code}">취소및반품</a>
                               </td>
                               
                            </tr>  
                            </c:forEach>  
                        </tbody>
            	 </table>
                  
                  
                  
                  </c:when>
                  <c:otherwise>
                   <table class= "table table-bordered">
                     <thead>
                         <tr>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">주문일자<br>[주문정보]</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">이미지</p></th>
                              <th scope="col" width="40%"><p style="font-size: 13px;" class="text-center">상품정보</p></th>
                              <th scope="col"width="5%"><p style="font-size: 13px;" class="text-center">수량</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">상품구매금액</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">주문처리상태</p></th>
                              <th scope="col" width="10%"><p style="font-size: 13px;" class="text-center">취소/교환/반품</p></th>

                          </tr>
                     </thead>
                        
                        <tbody> 
                            <tr>
                               <td colspan="7"style="height:100px;"> <span style="font-size: 13px;"class="d-flex justify-content-center p-5">주문내역이없습니다.</span></td>
                            </tr>    
                        </tbody>
             </table>
                  
                  </c:otherwise>
                  
               </c:choose>
            
                    <div>
                    <div class="w-75 m-auto d-flex justify-content-center" ><%-- ${lastPage } --%>
            
            	<c:if test="${totArticles != null }">
                <nav aria-label="...">
                
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
	                       	 <c:if test="${section > 1 && page==1 }">
		                      	<li class="page-item ">
		                        	<a class="page-link" href="${ctxPath}/order/list?pageBlock=${section-1}&pageNum=1 &user_id=${loginIfo}">이전</a>
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" href="${ctxPath}/order/list?pageBlock=${section}&pageNum=${page}&user_id=${loginIfo}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:when>
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	<a class="page-link" href="${ctxPath}/order/list?pageBlock=${section}&pageNum=${page}&user_id=${loginIfo}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:otherwise>
   	                    	 </c:choose>
   	                    	

                      	</c:forEach>
	                      	
                        <!--  다음 버튼 : 현재 section번호가 전체 section 번호 보다 작은 경우만 표시-->
                      	<c:if test="${section < totSection}">
	                      <li class="page-item">
	                        <a class="page-link" href="${ctxPath}/boardlist/list.do?pageBlock=${section+1}&pageNum=1">다음</a>
	                      </li>
                      	</c:if>
                    </ul>
                </nav>
                </c:if>
                
                
             
            </div>
                    
                    
                    </div>



                    <div classs="container d-flex justify-content-center">
                         <hr style= "border: solid 3px #000;" class="mt-5">
                             <div class="row">
                                <div class="col">
                                    <img src="img2/forment_info_web@3x.jpg"style="width:100%; height="auto;">
                                </div>
                            </div>
         
                            
                         
                    </div>
      </div>
            
 </main>
                        
            
            
            
 <footer>
     <!--주소-->
        <div class="and bg-light">
            <div class="container ">
                        <div class="content ">
                            <div class=" p-5 ">
                                <img src="https://theforment.com/web/upload/images/logo_header_main.svg" alt="푸터로고">
                
                
                                <a href="#"><span class="m-3">회사소개</a></span>
                                <a href="#"><span class="m-3">서비스이용약관</a></span>
                                <a href="#"><span class="m-3">개인정보처리방침</a></span>
                                <a href="#"><span class="m-3">전자금융거래약관 </a></span>
                
                            </div>
                        </div>
                        <div class="d-flex justify-content-between ">
                            <div class="container">
                                <p>
                                    <strong>(주)FORMENT</strong>
                                    <br>
                                    부산시 강남구 테헤란로 152 (역삼동 강남파이낸스센터)
                                    <br>
                                    대표이사 : 홍길동
                                    <br>
                                    사업자등록번호 : 220-81-83676 사업자정보확인
                                    <br>
                                    통신판매업신고 : 강남 10630호 Fax : 02-589-8842
                                </p>
                            </div>
                
                            <div class="container">
                                <p>
                                    <strong>고객센터</strong>
                                    <br>
                                    Tel : 1234-5678 (평일 09:00~18:00)
                                    <br>
                                    스마일클럽/SVIP 전용 : 1522-5700 (365일 09:00~18:00)
                                    <br>
                                    경기도 부천시 원미구 부일로 223(상동) 투나빌딩 6층
                                    <br>
                                    Fax : 051-123-4567 | Mail : kmarket@kmarket.co.kr
                                    <br>
                                </p>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
            
        </body>
<script src="https://code.jquery.com/jquery-3.6.4.min.js" 
    integrity="sha256-oP6HI9z1XaZNBrJURtCoUT5SUnxFr8s3BzRl+cbzUq8=" 
    crossorigin="anonymous"></script>
 <script type="text/javascript">
 $(function () {
	 console.log("${loginInfo}")
	 
	 
	$('#OBtn').click(function () {
		var user_id = $('#user_id').val()
		var order_code = $('#order_code').val()
		var order_status = $('#order_status').val()
		
		
		$.ajax({  //페이지가 아닌 데이터만 보내기
			type: "post",
			async: true, //true=비동기
			url: "${ctxPath}/order/update",
			dataType : 'text', //서버로부터 받은 데이터 타입
			data:{ user_id,order_code,order_status}, //매개변수
			success : function(data,textStatus){
				
			var jsonMessage = JSON.parse(data);
				
			
			
			},
			error: function(){
				
			},
			complete : function(){
				
			}
			
			
		}) //end 
		
		
		
	})
})
 
 
 
 </script>       
        
        
        
        
        
        </html>