package ysac.product.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.product.dto.ProductDTO;
import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/productName")
public class ProductNameListController extends HttpServlet {
    private ProductService productService = new ProductServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) {
        try {
            String pro_name = request.getParameter("pro_name");
            String _section = request.getParameter("pageBlock");
            String _pageNum = request.getParameter("pageNum");

            int section = _section == null ? 1 : Integer.parseInt(_section);
            int pageNum = _pageNum == null ? 1 : Integer.parseInt(_pageNum);
            		
//            String section = _section == null ? "1" :(_section);
//          String pageNum = _pageNum == null ? "1" :(_pageNum);
            int totArticles = productService.proTotNum();
           
           

            int totalPage = (int) Math.ceil(totArticles * 1.0 / 10);
            int totalPageBlock = (int) Math.ceil(totalPage * 1.0 / 10);

            int lastPage = 1;
            for (int i = 1; i <= 10; i++) {
                int endPage = (section - 1) * 10 + i;

                if (endPage <= totalPage) {
                    lastPage = i;
                }
            }
            
           if(pro_name != null) {
        	totArticles = productService.proNameTotNum(pro_name);
            String section2 = _section == null ? "1" :(_section);
              String pageNum2 = _pageNum == null ? "1" :(_pageNum);
            	 Map<String, String> pagingMap = new HashMap<>();
            	  	
            	 totalPage = (int) Math.ceil(totArticles * 1.0 / 10);
                 totalPageBlock = (int) Math.ceil(totalPage * 1.0 / 10);
            	 
            	 for (int i = 1; i <= 10; i++) {
                      int endPage = (section - 1) * 10 + i;

                      if (endPage <= totalPage) {
                          lastPage = i;
                      }
                  }
            
                 pagingMap.put("section", section2);
                 pagingMap.put("pageNum", pageNum2);
                 pagingMap.put("pro_name", pro_name);
                 
                 List<ProductDTO> productList = productService.proNameSelectList(pagingMap);
               
           	 
                 
                 request.setAttribute("productList", productList);
                 request.setAttribute("totArticles", totArticles);
                 request.setAttribute("section", section);
                 request.setAttribute("pageNum", pageNum);
                 request.setAttribute("totSection", totalPageBlock);
                 request.setAttribute("lastPage", lastPage);
            	
            }
            
            
         

//           request.setAttribute("productList", productList);
//           request.setAttribute("totArticles", totArticles);
//           request.setAttribute("section", section);
//           request.setAttribute("pageNum", pageNum);
//           request.setAttribute("totSection", totalPageBlock);
//           request.setAttribute("lastPage", lastPage);

            request.getRequestDispatcher("project/productList.jsp").forward(request, response);
        } catch (IOException | ServletException | NumberFormatException e) {
            e.printStackTrace();
            // 적절한 오류 처리를 수행합니다. 예: 오류 페이지로 리다이렉트.
        }
    }
}