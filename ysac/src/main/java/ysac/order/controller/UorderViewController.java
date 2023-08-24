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
import ysac.users.service.UsersService;

@WebServlet("/order/view")
public class UorderViewController extends HttpServlet {
    private UorderService uorderService;
    
    
    String action = null;
    String nextPage = null;
    public UorderViewController() {
        uorderService = new UorderServiceImpl();
    }

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        int order_code = Integer.parseInt(req.getParameter("order_code"));
        String user_id = req.getParameter("user_id");

        UorderDTO orderDTO = uorderService.getOrderById(order_code, user_id);
     
        req.setAttribute("orderDTO", orderDTO);
        
    	nextPage ="/project/orderFind.jsp";
		req.getRequestDispatcher(nextPage).forward(req, resp);
        
    }
    
    
    
    
    
}