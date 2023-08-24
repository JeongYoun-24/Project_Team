package ysac.product.domain;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
@Builder
public class ProductVO {
	
	private String product_code;
	private String category;
	private String pro_name;
	private String pro_info;
	private String pro_content;
	private int    pro_price;
	private int    pro_qty;
	private String pro_img;
	
}
