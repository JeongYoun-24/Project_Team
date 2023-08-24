package ysac.product.controller;

import java.io.File;
import java.io.IOException;
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
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import ysac.product.dto.ProductDTO;
import ysac.product.mapper.ProductSqlMapper;
import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;
import ysac.rev.dto.RevDTO;
import ysac.rev.mapper.RevMapper;
import ysac.users.mapper.UsersMapper;
import ysac.util.ConnectionOracleUtil;

@WebServlet("/productAdd")
public class ProductAddController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\product_img";
    private ProductService productService = new ProductServiceImpl();
	private ProductSqlMapper productSqlMapper;
	private UsersMapper usersMapper;
	private SqlSessionFactory factor;
	private SqlSession session;

    String action = null;
    String nextPage = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	
    	
    	
    	nextPage ="/project/PRODUCT2.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
    }
    
    
    
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 System.out.println("상품 등록 요청");
//        String product_code = req.getParameter("product_code");
//        String category = req.getParameter("category");
//        String pro_name = req.getParameter("pro_name");
//        String pro_info = req.getParameter("pro_info");
//        String pro_content = req.getParameter("pro_content");
//        int pro_price = Integer.parseInt(req.getParameter("pro_price"));
//        int pro_qty = Integer.parseInt(req.getParameter("pro_qty"));
//        String pro_img = req.getParameter("pro_img");
    	
    	 
    	 
        Map<String, String> articleMap = upload(req, resp);

        ProductDTO product = ProductDTO.builder()
//            .product_code(articleMap.get("product_code"))
            .category(articleMap.get("category"))
            .pro_name(articleMap.get("pro_name"))
            .pro_info(articleMap.get("pro_info"))
            .pro_content(articleMap.get("pro_content"))
            .pro_price(Integer.parseInt(articleMap.get("pro_price")))
            .pro_qty(Integer.parseInt(articleMap.get("pro_qty")))
            .pro_img(articleMap.get("pro_img"))
            .build();
        System.out.println(product);
        
        
       productService.productAdd(product);
       
  	 factor = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factor.openSession();
		productSqlMapper = session.getMapper(ProductSqlMapper.class);
 	 int product_code = productSqlMapper.getproduct_code();
 	 System.out.println("fdsfdsf"+product_code);
       
       
       
   	if (product.getPro_img()!= null && product.getPro_img().length() != 0) {
		// temp폴더에 임시로 보관된 파일경로 설정
		File srcFile = 
			new File(ARTICLE_IMAGE_REPO+"\\"+"temp"+"\\"+product.getPro_img());
		
		//  ARTICLE_IMAGE_REPO 하위 경로에 글 번호 폴더를 생성: "d:\\file_repo\글번호폴더
		File descFile = new File(ARTICLE_IMAGE_REPO+"\\"+product_code);
		descFile.mkdirs();
		
		//temp폴더의 이미지 첨부파일을 글번호이름으로하는 폴더로 이동
		FileUtils.moveFileToDirectory(srcFile, descFile, true);
       
   	}
       
       
//        try {
//			response.sendRedirect("/productList");
//		} catch (IOException e) {
//			// TODO Auto-generated catch block
//			e.printStackTrace();
//		}
        
   	nextPage ="/project/PRODUCT2.jsp";
	req.getRequestDispatcher(nextPage).forward(req, resp);  
    }
    
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