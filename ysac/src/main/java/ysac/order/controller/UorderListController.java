package ysac.order.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import ysac.order.dto.UorderDTO;
import ysac.order.sevice.UorderService;
import ysac.order.sevice.UorderServiceImpl;

@WebServlet("/order/list")
public class UorderListController extends HttpServlet {
    private UorderService uorderService = new UorderServiceImpl();

    public UorderListController() {
        uorderService = new UorderServiceImpl();
    }
    String action = null;
    String nextPage = null;
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
    	System.out.println("주문록록 요청");
    	
    	String _section = req.getParameter("pageBlock");
        String _pageNum = req.getParameter("pageNum");
//        String _month = req.getParameter("month");
        String user_id = req.getParameter("user_id");
     
     
//     	int month = _month == null ? 0 : Integer.parseInt(_month);
     	int section = _section == null ? 1 : Integer.parseInt(_section);
        int pageNum = _pageNum == null ? 1 : Integer.parseInt(_pageNum);
    	int month = 0;
    	
//      int month = Integer.parseInt(request.getParameter("month"));
//        int section = Integer.parseInt(request.getParameter("section"));
//        int pageNum = Integer.parseInt(request.getParameter("pageNum"));
//      String user_id = request.getParameter("user_id");
//        
        Map<String, List<UorderDTO>> orderList = uorderService.orderList(month, section, pageNum, user_id);
//        
        System.out.println(orderList);
        
        
//        request.setAttribute("orderList", orderList.get("orderList"));
//        request.setAttribute("orderCancelList", orderList.get("orderCancelList"));
//        
//        request.getRequestDispatcher("/combined_order_list.jsp").forward(request, response);
        int totArticles = uorderService.ordercount(user_id);

        int totalPage = (int) Math.ceil(totArticles * 1.0 / 10);
        int totalPageBlock = (int) Math.ceil(totalPage * 1.0 / 10);

        int lastPage = 1;
        for (int i = 1; i <= 10; i++) {
            int endPage = (section - 1) * 10 + i;

            if (endPage <= totalPage) {
                lastPage = i;
            }
        }
        req.setAttribute("orderList", orderList);
        req.setAttribute("totArticles", totArticles);
        req.setAttribute("section", section);
        req.setAttribute("pageNum", pageNum);
        req.setAttribute("totSection", totalPageBlock);
        req.setAttribute("lastPage", lastPage);
    	
    	
    	nextPage ="/project/orderList.jsp";
    	req.getRequestDispatcher(nextPage).forward(req, resp);
    }
    
    
    
    
    
    
    
    
    
    
}

