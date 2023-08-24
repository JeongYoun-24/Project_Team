package ysac.order.controller;

import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import oracle.sql.DATE;
import ysac.order.dto.UorderDTO;
import ysac.order.sevice.UorderService;
import ysac.order.sevice.UorderServiceImpl;
import ysac.product.dto.ProductDTO;
import ysac.product.service.ProductService;
import ysac.product.service.ProductServiceImpl;

@WebServlet("/order/insert")
public class UorderInsertController extends HttpServlet {
    private UorderService uorderService = new UorderServiceImpl() ;
    private ProductService productService = new ProductServiceImpl();
    public UorderInsertController() {
        uorderService = new UorderServiceImpl();
    }
    String action = null;
    String nextPage = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	String product_code = req.getParameter("product_code");
    	int pro_qty =Integer.parseInt(req.getParameter("pro_qty"));
    	
    	
    	System.out.println("---------------------");
    	System.out.println(product_code);
    	System.out.println(pro_qty);
    	
    	System.out.println("---------------------");
    	
    	
    	ProductDTO proDTO =	productService.proCodeSelectOne(product_code);
    		
    	proDTO.setPro_qty(pro_qty);
    	
    	req.setAttribute("proDTO", proDTO);
   
    	
    	
    	nextPage ="/project/orderForm.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
    }
    
    
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("구매 요청");
        UorderDTO uorderDTO = UorderDTO.builder()
			.user_id(req.getParameter("user_id"))
			.product_code(req.getParameter("product_code"))
			.pro_price(Integer.parseInt(req.getParameter("pro_price")))
			.pro_img(req.getParameter("pro_img"))
			.order_comment(req.getParameter("order_comment"))
			.name(req.getParameter("name"))
			.address(req.getParameter("address"))
			.phone(req.getParameter("phone"))
			.pro_name(req.getParameter("pro_name"))
			.pro_qty(Integer.parseInt(req.getParameter("pro_qty")))
			.order_status(1)
			.build();
        
        System.out.println(uorderDTO);

        uorderService.insertOrder(uorderDTO);
        resp.sendRedirect(req.getContextPath() + "/order/list?user_id="+uorderDTO.getUser_id());
    }
}