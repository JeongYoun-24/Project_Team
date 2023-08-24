package ysac.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.commons.io.FileUtils;

import ysac.product.dto.ProductDTO;
import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/productUpdate")
public class ProductUpdateController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\product_img";
	private ProductService productService = new ProductServiceImpl();
    String action = null;
    String nextPage = null;
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String product_code = req.getParameter("product_code");
    	
    	ProductDTO proDTO= productService.proCodeSelectOne(product_code);
    	
    	req.setAttribute("proDTO", proDTO);
    	
    	nextPage ="/project/PRODUCT01.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
    }
    
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("상품 수정 요청");
    	
//        String product_code = request.getParameter("product_code");
//        String category = request.getParameter("category");
//        String pro_name = request.getParameter("pro_name");
//        String pro_info = request.getParameter("pro_info");
//        int pro_price = Integer.parseInt(request.getParameter("pro_price"));
//        int pro_qty = Integer.parseInt(request.getParameter("pro_qty"));
//        String pro_img = request.getParameter("pro_img");
        Map<String, String> articleMap = upload(req,resp);
        
        ProductDTO product = ProductDTO.builder()
            .product_code(articleMap.get("product_code"))
            .category(articleMap.get("category"))
            .pro_name(articleMap.get("pro_name"))
            .pro_info(articleMap.get("pro_info"))
            .pro_price(Integer.parseInt(articleMap.get("pro_price")))
            .pro_content(articleMap.get("pro_content"))
            .pro_qty(Integer.parseInt(articleMap.get("pro_qty")))
            .pro_img(articleMap.get("pro_img"))
            .build();
        	
        System.out.println(product);
        
        int r =  productService.productModify(product);
        
        
        if(product.getPro_img() != null && product.getPro_img().length() != 0) {
			
			//temp 폴더에 임시 업로드
			File srcFile = new File(ARTICLE_IMAGE_REPO +"\\"+"temp" +"\\" + product.getPro_img());
			
			//temp 폴더의 파일을 글번호를 이름으로 하는 폴더 생성
			File descFile = new File(ARTICLE_IMAGE_REPO+"\\"+product.getProduct_code());
			
			descFile.mkdirs();
			// temp 폴더의 파일을 글번호를 이름으로 하 폴더로 이동
			FileUtils.moveFileToDirectory(srcFile, descFile, true);
			
			//수정 전 이미지 삭제
			String originalFileName = articleMap.get("origin_img");
			File oldFile = new File(ARTICLE_IMAGE_REPO+"\\"+product.getProduct_code()+"\\"+ originalFileName);
			oldFile.delete();
			
		}
        
        
        
        
//        try {
//			response.sendRedirect("/productList");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
        resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		
		if(r == 1) {
			pw.print("<script> alert('새 글을 추가 했습니다'); location.href='" + req.getContextPath() + "/productList'" +" </script>");
		}
		
       
        
		  nextPage ="/main.do";
			req.getRequestDispatcher(nextPage).forward(req, resp); 
    }
    
  //이미지 업로드 메서드 선언
  	private Map<String, String> upload(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
  		
  		Map<String, String> articleMap = new HashMap<String,String>();
  		String encoding = "utf-8";
  		//문자열 -<> 시스템 파일로 변환
  		File currentPath = new File(ARTICLE_IMAGE_REPO);
  		
  		DiskFileItemFactory factory = new DiskFileItemFactory();
  		
  		factory.setRepository(currentPath);
  		factory.setSizeThreshold(1024*1024);
  		
  		ServletFileUpload upload = new ServletFileUpload(factory);
  		
  		try {
  			// req에 저장되어있는 매개변수를 List에 저장
  			List<FileItem> items = upload.parseRequest(request);
  			
  			
  			for(int i = 0; i < items.size(); i++) {
  				
  				FileItem fileItem = items.get(i);
  				if(fileItem.isFormField()) { //form 요소이면
  					System.out.println(fileItem.getFieldName() + fileItem.getString(encoding));
  				
  					articleMap.put(fileItem.getFieldName(), fileItem.getString(encoding));
  					
  				}else {
  					
  					System.out.println("파라미터이름 : " + fileItem.getFieldName());
  					System.out.println("파일 이름 : " + fileItem.getName() );
  					System.out.println("파일 크기 : "+ fileItem.getSize());
  					
  					
  					
  					articleMap.put(fileItem.getFieldName(),fileItem.getName());
  					
  					if(fileItem.getSize() > 0) {
  						int idx = fileItem.getName().lastIndexOf("\\");
  						if(idx == -1) {
  							idx = fileItem.getName().lastIndexOf("/");
  							
  						}
  						
  						String fileName = fileItem.getName().substring(idx +1);
  						File uploadFile = new File(currentPath +"\\"+"temp"+"\\"+fileName);
  						
  						fileItem.write(uploadFile);
  					}
  					
  				}
  			}
  			
  		} catch (Exception e) {

  		}
  		
  		return articleMap;
  	}
    
}