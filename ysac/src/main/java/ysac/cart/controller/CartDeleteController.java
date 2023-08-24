package ysac.cart.controller;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import lombok.extern.log4j.Log4j2;
import ysac.cart.service.CartService;
import ysac.cart.service.CartServiceImpl;

@Log4j2
@WebServlet("/cart/delete")
public class CartDeleteController extends HttpServlet{
	private CartService cartService = new CartServiceImpl();
    String action = null;
    String nextPage = null;
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		int cart = (Integer.parseInt(req.getParameter("cart")));
		String user_id = req.getParameter("user_id");
		int result = cartService.deleteCart2(cart);
		
		
		
		nextPage ="/cartList?user_id="+user_id;
		resp.sendRedirect(req.getContextPath() + nextPage);
	}
	
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		String user_id = req.getParameter("user_id");
		String product_code = req.getParameter("product_code");
		int cart = (Integer.parseInt(req.getParameter("cart")));
	
		System.out.println(user_id);
		System.out.println(product_code);
		System.out.println(cart);
		
		int result = cartService.deleteCart(cart, user_id,product_code);
		
    		PrintWriter pw = resp.getWriter();
    		//	resp.setContentType("text/html; charset=utf-8");
			resp.setContentType("text/plane; charset=utf-8");
					
			JSONObject sendData = new JSONObject();
			
		if(result == 1) {
			log.info("장바구니 삭제");
		 	sendData.put("code","ok");
	 		sendData.put("message","삭제 성공");
	 		pw.print(sendData);
			
		}else {
			log.info("장바구니 삭제실패");
		 	sendData.put("code","error");
	 		sendData.put("message","삭제실패");
	 		pw.print(sendData);
	 		log.info(sendData);
			
		}
		
		
		
		
	}
	
	
}



