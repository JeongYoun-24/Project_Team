package ysac.product.service;

import java.util.List;
import java.util.Map;

import ysac.product.dto.ProductDTO;

public interface ProductService {

	public ProductDTO proCodeSelectOne(String product_code);
	
	public int proTotNum();
	
	public int proNameTotNum(String pro_name);
	public List<ProductDTO> proList();
	
	public List<ProductDTO> proAllList(Map<String, Integer> pageingMap);
	
	public List<ProductDTO> proNameSelectList(Map<String, String> pageingMap);
	
	public void productAdd(ProductDTO dto);
	
	public int productModify(ProductDTO dto);
	
	public int productDelete(String product_code);
	
}
