package ysac.cart.service;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.cart.domain.CartJoinVO;
import ysac.cart.domain.CartVO;
import ysac.cart.dto.CartDTO;
import ysac.cart.dto.CartJoinDTO;
import ysac.cart.mapper.CartSqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public class CartServiceImpl implements CartService  {
		
	
		
	    private  ModelMapper modelMapper;
	    private  CartSqlMapper cartSqlMapper;
	    private  SqlSessionFactory factory;
	    private  SqlSession session;

	    public CartServiceImpl() {
	        modelMapper = MapperUtil.INSTANCE.get();
	        factory = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
	        session = factory.openSession();
	        cartSqlMapper = session.getMapper(CartSqlMapper.class);
	        session.commit();
	    }

	    @Override
	    public List<CartDTO> getAllCarts() {
	        List<CartVO> voList = cartSqlMapper.getAllCarts();
	        session.commit();
	        return voList.stream()
	                .map(vo -> modelMapper.map(vo, CartDTO.class))
	                .collect(Collectors.toList());
	        
	    }

	    @Override
	    public CartDTO getCartById(int cart, String user_id) {
	        CartVO vo = cartSqlMapper.getCartById(cart, user_id);
	        session.commit();
	        return modelMapper.map(vo, CartDTO.class);
	    }

	    @Override
	    public int insertCart(CartDTO dto) {
	        CartVO vo = modelMapper.map(dto, CartVO.class);
	      int re=  cartSqlMapper.insertCart(vo);
	        session.commit();
	        
	        return re;  
	    }

	    @Override
	    public void updateCart(CartDTO dto) {
	        CartVO vo = modelMapper.map(dto, CartVO.class);
	        cartSqlMapper.updateCart(vo);
	        session.commit();
	    }

	    @Override
	    public int deleteCart(int cart, String user_id ,String product_code) {
	    	  int result=  cartSqlMapper.deleteCart(cart, user_id,product_code);
		        session.commit();
		        
		        return result;
	    }

		@Override
		public List<CartJoinDTO> getCartById2(String user_id) {
			List<CartJoinVO> vo = cartSqlMapper.getCartById2(user_id);
			 
			List<CartJoinDTO> dtoList = new ArrayList<>();
			for(CartJoinVO cart : vo) {
				CartJoinDTO cartDTO = CartJoinDTO.of(cart);
				dtoList.add(cartDTO);
			}
			  session.commit();
			return dtoList;
		}

		@Override
		public int deleteCart2(int cart) {
			 int result=  cartSqlMapper.deleteCart2(cart);
			 session.commit();
		        
		  return result;
		}
		
		
	}
