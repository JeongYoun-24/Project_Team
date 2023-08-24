package ysac.product.mapper;

import org.apache.ibatis.jdbc.SQL;

public class ProductSQL {

	
	public String productAdd() {
		return new SQL() {{
			INSERT_INTO("product");
			INTO_COLUMNS("product_code", "category", "pro_name", "pro_info","pro_content", "pro_price", "pro_qty", "pro_img");
			INTO_VALUES("SEQ_product.nextval", "#{category}", "#{pro_name}", "#{pro_info}","#{pro_content}", "#{pro_price}" ,"#{pro_qty}", "#{pro_img}");
		}}.toString();
	}
	
	public String productModify() {
		return new SQL() {{
			UPDATE("product");
			SET("category = #{category}", "pro_name = #{pro_name}", "pro_info = #{pro_info}"," pro_content =#{pro_content}", "pro_price = #{pro_price}", "pro_qty = #{pro_qty}", "pro_img = #{pro_img}");
			WHERE("product_code = #{product_code}");
		}}.toString();
	}
	
}
