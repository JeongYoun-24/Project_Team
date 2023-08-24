package ysac.order.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.order.dto.UorderDTO;
import ysac.order.sevice.UorderService;
import ysac.order.sevice.UorderServiceImpl;

@WebServlet("/order/update")
public class UorderUpdateController extends HttpServlet {
    private UorderService uorderService;

    public UorderUpdateController() {
    	uorderService = new UorderServiceImpl();
    }
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		String user_id =req.getParameter("user_id");
		int order_code = Integer.parseInt(req.getParameter("order_code"));
		int order_status = 0;
		
		System.out.println(user_id);
		System.out.println(order_code);
		UorderDTO uorderDTO = UorderDTO.builder()
				.order_code(order_code)
				.user_id(user_id)
				.order_status(0)
				.build();
		
		
		
		uorderService.updateOrder(order_status,order_code,user_id);
		
		resp.sendRedirect(req.getContextPath() + "/order/list?user_id="+user_id);
	}
    
    
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
      
    	
    	
//    	UorderDTO uorderDTO = UorderDTO.builder()
//    			.order_code(Integer.parseInt(request.getParameter("order_code")))
//                .user_id(request.getParameter("user_id"))
//                .order_status(Integer.parseInt(request.getParameter("order_status")))
//            .build();
//
//        uorderService.updateOrder(uorderDTO);
//        response.sendRedirect(request.getContextPath() + "/order/detail?order_code=" + uorderDTO.getOrder_code() + "&user_id=" + uorderDTO.getUser_id());
    }
}
