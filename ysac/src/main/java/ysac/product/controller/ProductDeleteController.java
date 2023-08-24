package ysac.product.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.io.FileUtils;

import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/productDelete")
public class ProductDeleteController extends HttpServlet {
	private static String ARTICLE_IMAGE_REPO = "C:\\JAVAstady2023\\JAVA\\ysac\\src\\main\\webapp\\project_A_img\\product_img";
    private ProductService productService = new ProductServiceImpl();
    String action = null;
    String nextPage = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	 String product_code = req.getParameter("product_code");

      int r =  productService.productDelete(product_code);
         
     	File imgDir = new File(ARTICLE_IMAGE_REPO+"\\"+product_code);
     	resp.setContentType("text/html;charset=utf-8");
		PrintWriter pw = resp.getWriter();
		if(imgDir.exists()) {
			FileUtils.deleteDirectory(imgDir);
			pw.print("<script> alert('상품을 삭제 했습니다'); location.href='" + req.getContextPath() + "/productList'" +" </script>");
		}
		
		
		if(r == 1) {
			pw.print("<script> alert('상품을 삭제 했습니다'); location.href='" + req.getContextPath() + "/productList'" +" </script>");
		}
         
         
         nextPage ="/productList";
 		req.getRequestDispatcher(nextPage).forward(req, resp); 
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	
    	
    }
    
    protected void doget(HttpServletRequest request, HttpServletResponse response) {
    	 String product_code = request.getParameter("product_code");

         productService.productDelete(product_code);
        try {
			response.sendRedirect("/productList");
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
    }
}