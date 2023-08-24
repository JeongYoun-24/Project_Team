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
   <div class="main">
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
       </div>
               
         <!--글작성부분-->
                
          <div class="container mt-3">
                        
     <!-- 업로드(이미지파일)기능이 포함된 form  -->
             <form action="${ctxPath}/productAdd" enctype="multipart/form-data" method="post" >
                  <div class="w-75 m-auto" >
                        <h4 class="text-center">상품 등록</h4>
                            <hr>
                  </div>
                       <div class="w-75 m-auto" >
                          <!-- <input type="hidden" name="PRODUCT_CODE"  id="PRODUCT_CODE" > -->
                              <div class="mb-3 row">
                                   <label for="id" class="col-sm-2 col-form-label">상품번호</label>
                                     <!--  <div class="col-sm-10">
                                        <input type="text" name="PRO_NAME" 
                                        class="form-control-md border rounded-1 p-2" id="product_code" placeholder="" readonly>
                                      </div> -->
                                 </div>
                                 
                                <div class="mb-3 row"> 
                                      <label for="id" class="col-sm-2 col-form-label">카테고리 아이디</label>
                                      <div class="col-sm-10">
                                          <input type="text" name="category" 
                                            class="-form-control-md border rounded-1 p-2" id="category" >
                                            <p class="" style="font-size: 10px">1=화장품,2=샴푸,3=향수</p>
                                      </div>
                                      
                                 </div>
                                    <div class="mb-3 row">
                                        <label for="id" class="col-sm-2 col-form-label">상품이름</label>
                                         <div class="col-sm-10">
                                             <input type="text" name="pro_name" 
                                                    class="form-control-md border rounded-1 p-2" id="pro_name" placeholder="상품이름">
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3 row">
                                          <label for="title" class="col-sm-2 col-form-label">상품브랜드</label>
                                        <div class="col-sm-10">
                                           <input type="text" name="pro_info"
                                                class="form-control-md border rounded-1 p-2" id="pro_info" placeholder="상품정보">
                                        </div>
                                    </div>
                                     <div class="mb-3 row">
                                          <label for="title" class="col-sm-2 col-form-label">상품정보</label>
                                        <div class="col-sm-10">
                                         <!--   <input type="text" name="pro_content"
                                                class="form-control-md border rounded-1 p-2" id="pro_content" placeholder="상품정보"> -->
                                            <textarea rows="5" cols=50" name="pro_content"  class="form-control-md border rounded-1 p-2"placeholder="상품정보">
                                            
                                            
                                            
                                            </textarea>    
                                                
                                        </div>
                                    </div>
                                    
                                    <div class="mb-3 row">
                                        <label for="content" class="col-sm-2 col-form-label">상품가격</label>
                                        <div class="col-sm-10">
                                           <input type="text" name="pro_price" class="form-control-md border rounded-1 p-2" id="pro_price" placeholder="상품가격">
                                      </div>
                                    </div>
                                  
                                    <div class="mb-3 row">
                                         <label for="imageFileName" class="col-sm-2 col-form-label" >재고</label>
                                         <div class="col-sm-10">
                                             <input type="text" name="pro_qty" 
                                                class="form-control-md border rounded-1 p-2" id="pro_qty" placeholder="재고">
                                        </div>
                                    </div>
                                      
                                    <div class="mb-3 row">
                                            <label for="imageFileName" class="col-sm-2 col-form-label" >상품이미지</label>
                                          <div class="col-sm-10">
                                          
                                            <!-- jquery에서 show태그는 숨기기로 설정, 파일선택시 표시하기로 변경 -->
                                            <div id="">
                                              <div class="alert alert-light p-1" role="alert">
                                                    <label id="PRO_IMG"></label>
                                                </div>
                                                  <div class="alert alert-light" role="alert" id="show2">
                                                    <img src="#" id="preview" width="300">
                                                  </div>
                                            </div>
                                            
                                            <input type="file"  name="pro_img" id="pro_img" 
                                                  onchange="readURL(this)"
                                                  class="form-control  p-2">
                                        
                                          </div>                                 
                                  </div>
                    
                                
                               <div class="w-100 m-auto " >
                                    <hr>
                                    <div class="mb-3 row">
                                        <label for="" class="col-form-label"> </label>
                                          <div class="d-flex justify-content-center" >
                                            <div class="col-sm-3 align-content-end">
                                              <button type="submit" class="btn btn-outline-dark btn-md w-50">등록</button>
                                              </div>
                                              <div class="col-sm-3">
                                              <button type="button" onClick="list()" class="btn btn-outline-danger btn-md w-50">삭제</button>
                                              </div>
                                                <div class="col-sm-3">
                                                    <button type="button" onClick="list()" class="btn btn-outline-secondary btn-md w-50">목록</button>
                                                  </div>


                                           
                                            <div>
                                              <!-- <button type="button" class="btn btn-danger btn-sm">답글기</button> -->
                                            </div>
                                           
                                        
                                   
                                    <hr>
                                </div> 
            </form>
          </div>
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