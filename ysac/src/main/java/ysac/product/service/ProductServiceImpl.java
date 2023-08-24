package ysac.product.service;

import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.modelmapper.ModelMapper;

import ysac.product.domain.ProductVO;
import ysac.product.dto.ProductDTO;
import ysac.product.mapper.ProductSqlMapper;
import ysac.util.ConnectionOracleUtil;
import ysac.util.MapperUtil;

public class ProductServiceImpl implements ProductService{
	
	private ModelMapper modelMapper;
	private ProductSqlMapper productSqlMapper;
	private SqlSessionFactory factory;
	private SqlSession session;
	
	public ProductServiceImpl() {
		modelMapper = MapperUtil.INSTANCE.get();
		factory = ConnectionOracleUtil.INSTANCE.getSqlSessionFactory();
		session = factory.openSession();
		productSqlMapper = session.getMapper(ProductSqlMapper.class);
	}

	@Override
	public ProductDTO proCodeSelectOne(String product_code) {
		
		ProductVO vo = productSqlMapper.proCodeSelectOne(product_code);
		ProductDTO dto = modelMapper.map(vo, ProductDTO.class);
		
		return dto;
	}

	
	//상품 전체 4번쩨까지 서비스
	@Override
	public List<ProductDTO>	proList(){
			List<ProductVO> boardList = productSqlMapper.proList();
			// vo-> dto
			List<ProductDTO> dtoList = boardList.stream()
								.map(vo -> modelMapper.map(vo, ProductDTO.class))
								.collect(Collectors.toList());
						
						
		return dtoList;	
	}	
	
	
	@Override
	public List<ProductDTO> proAllList(Map<String, Integer> pagingMap) {
        List<ProductVO> voList = productSqlMapper.proAllList(pagingMap);
        List<ProductDTO> dtoList = voList.stream()
                                         .map(vo -> modelMapper.map(vo, ProductDTO.class))
                                         .collect(Collectors.toList());
        return dtoList;
    }

	@Override
	public List<ProductDTO> proNameSelectList(Map<String, String> pageingMap) {
		
		List<ProductVO> voList = productSqlMapper.proNameSelectList(pageingMap);
		List<ProductDTO> dtoList = voList.stream()
									.map(vo -> modelMapper.map(vo, ProductDTO.class))
									.collect(Collectors.toList());
		return dtoList;
		
	}

	@Override
	public void productAdd(ProductDTO dto) {
		
		ProductVO vo = modelMapper.map(dto, ProductVO.class);
		productSqlMapper.productAdd(vo);
		session.commit();
		
	}

	@Override
	public int productModify(ProductDTO dto) {
		
		ProductVO vo = modelMapper.map(dto, ProductVO.class);
	int r=	productSqlMapper.productModify(vo);
		session.commit();
		return r;
	}

	@Override
	public int productDelete(String product_code) {
		
	int r=	productSqlMapper.productDelete(product_code);
		session.commit();
		return r;
	}

	@Override
	public int proTotNum() {
		int proTotNum = productSqlMapper.proTotNum();
		return proTotNum;
	}

	@Override
	public int proNameTotNum(String pro_name) {
		int proTotNum = productSqlMapper.proNameTotNum(pro_name);
		

		return proTotNum;
	}

	

	
	
}
