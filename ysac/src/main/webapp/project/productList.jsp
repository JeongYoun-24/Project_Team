<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
          <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <c:set var="ctxPath"  value="${pageContext.request.contextPath }" />
 	<c:set var="show" value="0"  />
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 상품등록</title>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM" crossorigin="anonymous">
        <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
          <!--부트 아이콘 -->
       <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.10.5/font/bootstrap-icons.css">
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous"></script>

       
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
  <header>
    <!--배너-->
     <div class="swiper-slide pop2 show" data-time-start="2023/02/27 00:00:00" data-time-end="2025/03/01 23:59:59" style="background: #000000 ;">
      <a href="#none" ><span style="color: #ffffff; "class="d-flex justify-content-center">신규회원 무료배송 + 1만원 쿠폰팩</span></a></div>
    
    <!--네비바-->
   <jsp:include page="../nav/nav.jsp"/>   

    </header>
    
        
    
   <!--제목부분-->
  <main>
      <div class="container">
           <div class="row">
               <div class="col-4 mt-5 d-flex justify-content-start">
                  <span>NOTICE</span>
                </div>
         
                <div class="col-4 mt-5 p-2 d-flex justify-content-between">
                    
                        <span>NOTICE</span>
                        <span>Q&A</span>
                        <span>FAQ</span>
                        <span>MEMBERSHIP</span> 
                </div>
                <div class="col-4 mt-5">
                    <div class="d-flex justify-content-end">
                          <i class="bi bi-house-heart"></i>
                          <i class="bi bi-arrow-right-short"> </i>
                          <span>NOTICE</span>
                        </div>
                   </div>
                   
                   
                   
                   
             </div> 
             <form action="${ctxPath}/productName" method="get">
               <div class="input-group row">
                        <div class=" col-sm-4">
                           <!--  <select class="form-select" name="pro">
                                <option value="">---</option>
                                <option value="상품이름" >상품이름</option>
                                <option value="c">카테고리</option>
                                <option value="w" >브랜드</option>
                            </select> -->
                        </div>

                        <div  class="col-sm-8 d-flex">
                            <input class="form-control me-2" type="search" 
                                    name="pro_name"
                                    placeholder="Search" aria-label="Search">
                            <button class="btn btn-outline-secondary searchBtn" type="submit">검색</button>
                            <button class="btn btn-outline-secondary clearBtn " type="button">Clear</button>
                        </div>

                  </div>
             </form>
             <div>
             	
             <table class="table">
                            <thead>
                            <tr>
                                <th scope="col">번호</th>
                                <th scope="col">상품이름</th>
                                <th scope="col">상품이미지</th>
                                <th scope="col">브랜드</th>
                                <th scope="col">가격</th>
                            </tr>
                            </thead>
                            <tbody  >
                            <c:forEach var="list" items="${productList}" varStatus="articlNum">
                            <tr >
                                <th scope="row">${list.product_code}</th>
                                <td>
                                    <a href="${ctxPath}/rev/revList.do?product_code=${list.product_code}" class="text-decoration-none">
                                        ${list.pro_name}
                                    </a>
                                   
                                    
                                    <span class="badge text-bg-danger text-light"></span>

                                </td>
                                 <td>
                                 <!-- <img alt="" style="width: 100px; height: 100px" src="http://img.cgv.co.kr/GiftStore/Product/Pc/List/16680685701470.jpg">  -->
                                 <img style="width: 100px; height: 100px" src="${ctxPath}/product_img.do?pro_img=${list.pro_img}&product_code=${list.product_code}" class="card-img-top" alt="">
                                 </td>
                                <td>${list.pro_info}</td>
                                <td>${list.pro_price}원</td>
                                <c:if test="${manager != null}">
                            	 <td><a  href="${ctxPath}/productUpdate?product_code=${list.product_code}">수정하기</a></td>
                       			
                          		</c:if>
                            </tr>
                            	
                            
							</c:forEach>
                            </tbody>
                        </table>
             
             
             
             
             </div>
             
             <div class="w-75 m-auto d-flex justify-content-center" ><%-- ${lastPage } --%>
            
            	<c:if test="${totArticles != null }">
                <nav aria-label="...">
                
                    <ul class="pagination">
                       	<c:forEach var="page" begin="1" end="${lastPage}" step="1" >
		                     <!--  section 2이상이고 1page이면 이전 버튼 활성화 -->	
	                       	 <c:if test="${section > 1 && page==1 }">
		                      	<li class="page-item ">
		                        	<a class="page-link" href="${ctxPath}/productList/pageBlock=${section-1}&pageNum=1">이전</a>
		                     	</li>
		                     </c:if>  
		                     
		                     
		                     <!--  현재 보여지고 있는 페이지는 링크 안됨 -->
		                     <c:choose>
	   	                    	<c:when test="${page==pageNum}">
	   	                    	 <li class="page-item  disabled" aria-current="page">
			                      	<a class="page-link" href="${ctxPath}/productList/pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
			                     </li>
	   	                    	</c:when>
	   	                    	<c:otherwise>
	   	                    	 <li class="page-item ">
			                      	<a class="page-link" href="${ctxPath}/productList/pageBlock=${section}&pageNum=${page}">${(section-1)*10 + page}</a>
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
               
         <!--글작성부분-->
        
  </main>
 
  <footer>

  </footer>         
          
     
</body>
  <script src="//code.jquery.com/jquery-3.3.1.min.js"></script>
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
        <script type="text/javascript">
                
          function changeVideo(img){
            $(".video_large").hide();
            var video_id = $(img).attr('video_id');
            document.getElementById(video_id).style.display='block';
          }
          function readURL(rev_img){
      		
      		$('#show2').show()
      		
      		if(pro_img.files && pro_img.files[0]){
      			//파일 입출력 처리하는 객체 생성
      			var reader = new FileReader();

      			reader.onload = function(e){
      				//html에 소스 넘겨주기
      				$('#preview').attr('src',e.target.result)
      				
      				//${show = "1"}

      			}
      			reader.readAsDataURL(rev_img.files[0])
      			
      		}

      	}


 </script>



</html>