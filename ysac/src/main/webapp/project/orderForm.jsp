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
            <form action="${ctxPath}/order/insert" method="post">
                <!--주문조회 헤드부분-->
               <div class="row">
                        <div class= "col-10 mt-5">
                            <h5>주문등록</h5>
                        </div>
                    
                    <div class="col-2 p-2 mt-5">
                        <div class="d-flex align-content-end"> 
                            <i class="bi bi-house-door-fill"></i>
                                <i class="bi bi-chevron-compact-right"></i>
                                    <a href="#"><span style="font-size: 15px; color:darkgray">마이쇼핑</span></a>
                                    <i class="bi bi-chevron-compact-right"></i>
                                    <a href="#"> <span style="font-size: 15px;">주문등록</span></a>
                              </div>
                    </div>
               </div>
			<div class="d-flex justify-content-center">
				<div>
					<div>
						<input type="text" class="form-control" id="user_id" name="user_id" value="${loginInfo}" placeholder="아이디">
					</div>
					<div>
						<input type="text" class="form-control" id="product_code" name="product_code" value="${proDTO.product_code}" placeholder="상품 번호">
					</div>
					<div>
						<input type="text"  id="pro_name"  name="pro_name" class="form-control" value="${proDTO.pro_name}">
					</div>
					<div>
						<input type="text" id="pro_img" name="pro_img"  class="form-control" value="${proDTO.pro_img}">
					</div>
					<div>
						<input type="text" id="pro_price" name="pro_price" class="form-control" value="${proDTO.pro_price}">
					</div>
					<div>
						<input type="number" id="pro_qty" name="pro_qty" class="form-control" value="${proDTO.pro_qty}">
					</div>
					<div>
						<input name="zip_code"  class="add" style="height: 35px; width: 380px;" type="adress" id="sample4_postcode" placeholder="우편번호">
	                    <input  class="btn btn-outline-dark mb-1" style="height: 35px;" type="button" onclick="sample4_execDaumPostcode()" value="우편번호 찾기"><br>
	                    <input name="address"  class="mt-2 add" style="height: 35px; width: 510px;" type="adress" id="sample4_roadAddress" placeholder="도로명주소"><br>
	                    <input name="DetAddress"  class="mt-2 add"  style="height: 35px; width:510px ; " type="adress" id="sample4_detailAddress" placeholder="상세주소">
               
					
					</div>
					<div>
						<select>
							<option>경비실</option>
							<option>문앞</option>
							<option>직접 수령</option>
						</select>					
					</div>
					<div>
						<textarea rows="5" cols="50" class="form-control" name="order_comment" id="order_comment"  placeholder="주문요청사항"></textarea>
					</div> 
					
					<div>
							<input type="text" id="name" class="form-control" name="name" value="" placeholder="수령인이름">
					</div>
					<div>
							<input type="text" id="phone" class="form-control" name="phone" value="010-4444-2222" placeholder="전화번호">
					</div>
					<!-- <div>
							<input type="text" id="" class="form-control" value="수령인 이름 ">
					</div> -->
				
								
				</div>
			
			</div>
					<button type="submit">구매하기</button>




        </form>
    </div>
   


   <!--주문 상품 정보-->
        <div class="container">
      
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
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>

    <script type="text/javascript">
    function sample4_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수

                // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('sample4_postcode').value = data.zonecode;
                document.getElementById("sample4_roadAddress").value = roadAddr;
                document.getElementById("sample4_jibunAddress").value = data.jibunAddress;
                
                // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                if(roadAddr !== ''){
                    document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                } else {
                    document.getElementById("sample4_extraAddress").value = '';
                }

                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
            }
        }).open();
    }       
    
    </script>        

        
        
        
        
        </html>