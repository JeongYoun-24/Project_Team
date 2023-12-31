<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
     <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
    
    
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>쇼핑몰 메인</title>
       
       
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
          <div class="main">
            <jsp:include page="../nav/nav.jsp"/>   
               
             
                
                
                    <!--캐러셀 슬라이드-->
                   
              <div id="carouselExampleControls" class="carousel slide" data-bs-ride="carousel">
                
                
              	<div class="carousel-inner">
                  <div class="carousel-item active">
                    <img src="https://theforment.com/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/102da6866c9542f3cd22ad8fd4894f2d.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="https://theforment.com/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/7e7d55054646cc5ce7e8c921c660ea30.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="https://theforment.com/web/upload/appfiles/ZaReJam3QiELznoZeGGkMG/934f8502bda74a8bc3c0cd835ca4039b.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="https://theforment.com/web/upload/NNEditor/20220408/5fc13d4ab5710975ef79f46227853049.jpg" class="d-block w-100" alt="...">
                  </div>
                  <div class="carousel-item">
                    <img src="https://theforment.com/web/upload/NNEditor/20220728/ab942b1dba6f653acfdd85de78279a0e.jpg" class="d-block w-100" alt="...">
                  </div>

                  <div class="carousel-item">
                    <img src="https://theforment.com/web/upload/NNEditor/20220511/0e4524cfb17b7cb7781468221979e546.jpg" class="d-block w-100" alt="...">
                  </div>
                </div>
                <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="prev">
                  <span class="carousel-control-prev-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Previous</span>
                </button>
                <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleControls" data-bs-slide="next">
                  <span class="carousel-control-next-icon" aria-hidden="true"></span>
                  <span class="visually-hidden">Next</span>
                </button>
              </div>
              
              <!--"https://www.theforment.com/web/product/big/202305/9a89fd2ce12405b9cc15c43e965fa378.jpg"  -->
         <div class="mt_neo alert"><h3>MD's Pick</h3></div>
          <div class="container d-flex justify-content-center" >
          
         
           <c:forEach var="mem" items="${proList}" varStatus="loop">
             	<div class="p-3 ">
             	<div class="">
             		<div class="">
             		<img style="width: 250px; height:300px" src="${ctxPath}/product_img.do?pro_img=${mem.pro_img}&product_code=${mem.product_code}" class="card-img-top" alt=""></div>
             		<div class=" "> ${mem.pro_name}</div>
                    <div class=" ">${mem.pro_price}원</div>
                    <hr>
                   <div class=" ">
                       <a href="${ctxPath}/rev/revList.do?product_code=${mem.product_code}" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                   </div>
                   
             	</div>
             	
             	</div>

           </c:forEach>   
      	
         
       </div>
       
      <div class="container d-flex justify-content-center" >
           <c:forEach var="mem2" items="${proList2}" varStatus="loop">
             	<div class="p-3 ">
             	<div class="">
             		<div class=""><img style="width: 250px; height:300px" src="${ctxPath}/product_img.do?pro_img=${mem2.pro_img}&product_code=${mem2.product_code}" class="card-img-top" alt=""></div>
             		<div class=" "> ${mem2.pro_name}</div>
                    <div class=" ">${mem2.pro_price}원</div>
                    <hr>
                   <div class=" ">
                       <a href="${ctxPath}/rev/revList.do?product_code=${mem2.product_code}" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                   </div>
                   
             	</div>
             	
             	</div>
             	<div></div>
             	
             
           </c:forEach>     	
         
       </div> 
          <div class="row row-cols-1 row-cols-md-4 g-3">
                    <div class="col-3 ">
                     
                    </div>
                    
              </div>
              
              
              
              
              
              
              
              
              <!--첫줄-->
              <%-- <div class="main contents">
                <div class="container">
                <div class="mt_neo alert"><h3>MD's Pick</h3></div>
                  <div class="row row-cols-1 row-cols-md-4 g-3">
                    <div class="col ">
                      <div class="card h-50">
                        <img src="https://www.theforment.com/web/product/big/202305/9a89fd2ce12405b9cc15c43e965fa378.jpg" class="card-img-top" alt="">
                        <div class="card-body">
                          <h6 class="card-title">포맨트 내추럴 시그니처 퍼퓸 상탈 레인</h6>
                          <p class="card-text">
                            나무잎ㅣ바이올렛ㅣ샌달우드<hr>
                            49,000원
                          </p>
                          <div class="d-grid gap-2">
                            <a href="${ctxPath}/product/revList.do" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                            </div>
                        </div>
                      </div>
                    </div>
                    
                    
                    
                    <div class="col ">
                      <div class="card h-50">
                        <img src="https://www.theforment.com/web/product/big/202305/23237843ddf9097aa0977498efa7603d.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h6 class="card-title">포맨트 내추럴 시그니처 퍼퓸 피그 누아</h6>
                          <p class="card-text">
                            레몬제스트ㅣ달큰한 무화과ㅣ시더우드<hr>
                            49,000원
                          </p>
                          <div class="d-grid gap-2">
                            <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                            </div>
                      </div>
                    </div>
                  </div>
                    <div class="col ">
                      <div class="card h-50">
                        <img src="https://www.theforment.com/web/product/big/202305/9109aa9f26b35b081cfe1ddd96864b46.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h6 class="card-title">포맨트 내추럴 시그니처 퍼퓸 바질 테라스</h6>
                          <p class="card-text">
                            싱그러운 유자ㅣ바질ㅣ머스크<hr>
                            49,000원
                          </p>
                          <div class="d-grid gap-2">
                            <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div class="col ">
                      <div class="card h-50">
                        <img src="https://www.theforment.com/web/product/big/202305/1ef07b606877c3bb16a96893cd974210.jpg" class="card-img-top" alt="...">
                        <div class="card-body">
                          <h6 class="card-title">포맨트 내추럴 퍼퓸 샤워 바질 테라스</h6>
                          <p class="card-text">
                            싱그러운 유자ㅣ바질ㅣ머스크<hr>
                            24,000원
                          </p>
                          <div class="d-grid gap-2">
                            <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                          </div>
                        </div>
                      </div>
                    </div>
                    </div>
                    
                    
                    <!--두번째줄-->
                    <div class="row row-cols-1 row-cols-md-4 g-3  board">
                      <div class="col ">
                        <div class="card h-50">
                          <img src="https://www.theforment.com/web/product/big/202301/6f242b0fdda965f80172877a2f9e587e.jpg" class="card-img-top" alt="">
                          <div class="card-body">
                            <h6 class="card-title">포맨트 시그니처 솔리드 퍼퓸</h6>
                            <p class="card-text">
                              솔리드 퍼퓸의 3가지 향<hr>
                              32,000원
                            </p>
                            <div class="d-grid gap-2">
                              <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                              </div>
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="card h-50">
                          <img src="https://www.theforment.com/web/product/big/202301/2fec97ecb95719f1a6b979cd99c99eb1.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h6 class="card-title">포맨트 시그니처 솔리드 퍼퓸 코튼 허그</h6>
                            <p class="card-text">
                              욕조 속 비누거품ㅣ포근한 이불ㅣ머스크<hr>
                              32,000원
                            </p>
                            <div class="d-grid gap-2">
                              <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                              </div>
                        </div>
                      </div>
                    </div>
                      <div class="col">
                        <div class="card h-50">
                          <img src="https://www.theforment.com/web/product/big/202301/e40cb09d88da342a9d1eabd5c1144d2c.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h6 class="card-title">포맨트 시그니처 솔리드 퍼퓸 코튼 메모리</h6>
                            <p class="card-text">
                              물기 어린 복숭아ㅣ히아신스ㅣ머스크<hr>
                              32,000원
                            </p>
                            <div class="d-grid gap-2">
                              <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                            </div>
                          </div>
                        </div>
                      </div>
                      <div class="col">
                        <div class="card h-50 ">
                          <img src="https://www.theforment.com/web/product/big/202301/16d7a59a178ba0b34dc266e3b68056de.jpg" class="card-img-top" alt="...">
                          <div class="card-body">
                            <h6 class="card-title">포맨트 시그니처 솔리드 퍼퓸 벨벳 허그</h6>
                            <p class="card-text">
                              달콤한 붉은사과ㅣ풍성한 작약ㅣ벨벳<hr>
                              32,000원
                            </p>
                            <div class="d-grid gap-2">
                              <a href="#" class=" btn btn-outline-secondary btn-lg">Add To Cart</a>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div> --%>
              
              
              
              </div>
                      
                      
               
                      
                      
                      
                      <!--main video-->
                <div class="main bg-light">
                 <div class="container ">
                  <div class="content_main">
                    <div class="row">
                      
                        <div class="">
                          <strong><h3 class="row mt-5"><strong>FORMENT VIDEO</strong></h3></strong> 
                          </div>
                          <div class="d-flex">
                            <div class="video-container">
                              <div class="col-8 d-flex">
                                <div id ="video_id1" class="video_large" style="display: block;">
                                 <iframe width="1024" height="560" class="m-3 p-3" src="https://www.youtube.com/embed/0kcLbkptq-k" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                
                                 <div class="video_txt d-flex justify-content-center ">
                                    <strong class="col-8">마스터 퍼퓨머가 '성공'에 영감을 받아 탄생한 향수</strong> 
                                 <span >포맨트 시그니처 퍼퓸 코튼썩세스</span>
                                </div>

                              </div>
                        </div>
                      </div>
      
                          <div class="col-4 d-flex">
                          <div id="video_id2" class="video_large"style="display: none;">
                         <div class="video-contanier">
                         <iframe width="1024" height="560" class="m-3 p-3" src="https://www.youtube.com/embed/EJkEAo5QewU" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                        </div>
                       <div class ="video_txt  d-flex justify-content-center" >
                        <strong class="col-8">향기가 실린 바람과 우연의 시작</strong>
                        <span> 포맨트 시그니처 퍼퓸 코튼 브리즈</span>
                      
                       </div>
                      </div>
                   
                             <div id="video_id3" class="video_large"style="display: none;">
                                <div class="video">
                                   <iframe style="width:768px; height: 568px; "  class="m-3 p-3" src="https://www.youtube.com/embed/ZQDWl6HCHpE" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen></iframe>
                                  </div> 
                                   <div class ="video_txt  d-flex justify-content-center">
                                       <strong class="col-8">향기와 함께 피어오르는 코랄빛 설렘의 기억</strong>
                                        <span> 포맨트 시그니처 퍼퓸 코튼 메모리</span>
                                        </div>
                                  </div> 
                                    <div id="imgA" class="img m-1 p-1">
                                      <a><img src="https://www.theforment.com/web/upload/images/v3_03.jpg" alt video_id ="video_id1" class="m-1 p-1" onclick="changeVideo(this);"></a>
                                      <a><img src="https://www.theforment.com/web/upload/images/v1_02.jpg" alt video_id ="video_id2" class="m-1 p-1" onclick="changeVideo(this);"></a>
                                      <a><img src="https://www.theforment.com/web/upload/images/v2_02.jpg" alt video_id ="video_id3" class="m-1 p-1" onclick="changeVideo(this);"></a>
                                  </div>
                                </div>
                              </div>
                              </div>
                              
                              
                              
                            </div>
                          </div>
                        </div>  
                    
                    
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
  <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script type="text/javascript">
                
          function changeVideo(img){
            $(".video_large").hide();
            var video_id = $(img).attr('video_id');
            document.getElementById(video_id).style.display='block';
          }
  


 </script>
</body>
</html>