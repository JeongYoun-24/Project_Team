package ysac.product.dto;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class ProductDTO {
	private int	recNum;
	private String product_code;
	private String category;
	private String pro_name;
	private String pro_info;
	private String pro_content;
	private int    pro_price;
	private int    pro_qty;
	private String pro_img;
	
}
