package ysac.order.domain;

import java.sql.Date;
import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.ToString;

@Getter
@AllArgsConstructor
@NoArgsConstructor
@Builder
@ToString
public class UorderVO {

	private int order_code; // 번호 
	private String user_id;   // 유저 아이디
	private String product_code;  // 상품 코드 
	private int pro_price;     //상품 가격 
	private String pro_img;   // 상품 이미지 
	private String order_comment;  // 상품 정보
	private Date order_join;   // 주문 일자일자 
	private String name;     // 주문자 이름 
	private String address;   // 주문 주소 
	private String phone;    // 유저 번호 
	private String pro_name;   // 상품 이름
	private int order_status;  // 주문 여부 
	private int pro_qty;   // 주문 수량 
	
}
