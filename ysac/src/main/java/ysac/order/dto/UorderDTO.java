package ysac.order.dto;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
public class UorderDTO {

	private int order_code;
	private String user_id;
	private String product_code;
	private int pro_price;
	private String pro_img;
	private String order_comment;
	private Date order_join;
	private String name;
	private String address;
	private String phone;
	private String pro_name;
	private int order_status;
	private int pro_qty;
	
}
