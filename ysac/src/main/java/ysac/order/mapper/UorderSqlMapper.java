package ysac.order.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import ysac.order.domain.UorderVO;

public interface UorderSqlMapper {


	String orderList ="""
			 SELECT *
        FROM (
            SELECT ROW_NUMBER() OVER (ORDER BY order_code) AS row_num, order_code, user_id, product_code, pro_price,order_comment ,pro_img, order_join, pro_name, order_status, pro_qty
            FROM u_order
            WHERE order_join >= ADD_MONTHS(TRUNC(SYSDATE), #{month}) AND user_id = #{user_id}
        )
        WHERE row_num BETWEEN (#{section}-1) * 100 + (#{pageNum}-1) * 10 + 1 AND (#{section}-1) * 100 + #{pageNum} * 10
        AND (
            order_status IN (0, 1, 2, 3, 4, 5) OR
            order_status IN (6, 7, 8)
        )
        ORDER BY order_status DESC

			""";
			
    
    @Select(orderList)
    public List<UorderVO> orderList(@Param("month") int month,@Param("section") int section,@Param("pageNum") int pageNum,@Param("user_id")  String user_id);
    

    
    @Select("SELECT * FROM U_ORDER WHERE ORDER_CODE = #{order_code} AND USER_ID = #{user_id}")
    public UorderVO getOrderById(@Param("order_code") int order_code, @Param("user_id") String user_id);
    
    String orderInsert = """
    		INSERT INTO U_ORDER (ORDER_CODE, USER_ID, PRODUCT_CODE, PRO_PRICE, pro_img, ORDER_COMMENT, NAME, ADDRESS, PHONE, PRO_NAME, ORDER_STATUS, PRO_QTY)
    		VALUES (SEQ_ORDER.nextval, #{user_id}, #{product_code}, #{pro_price}, #{pro_img}, #{order_comment}, #{name}, #{address}, #{phone},#{pro_name}, #{order_status}, #{pro_qty}) 
    		""";

    @Insert(orderInsert)
    public void insertOrder(UorderVO vo);
    
    @Update("UPDATE U_ORDER SET ORDER_STATUS = #{order_status} WHERE ORDER_CODE = #{order_code} AND USER_ID = #{user_id}")
    public void updateOrder(@Param("order_status")int order_status ,@Param("order_code")int order_code,@Param("user_id")String user_id);
    
    @Delete("DELETE FROM U_ORDER WHERE ORDER_CODE = #{order_code} AND USER_ID = #{user_id}")
    public void deleteOrder(@Param("order_code") int orderCode, @Param("user_id") String user_id);
    
    @Select("select count(order_code) from u_order where user_id = #{user_id}")
	public int orderCount(String user_id);
    
    
}
