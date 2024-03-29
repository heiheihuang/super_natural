package com.example.express.domain.bean;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 用户订单统计
 * @date 2019年04月16日 23:10
 */
@Data
@Builder
public class VUserOrder {
    /**
     * 用户证件
     */
    private String idCard;
    private String realName;
    private BigDecimal waitOrder;
    private BigDecimal ingOrder;
    private BigDecimal errorOrder;
    private BigDecimal completeOrder;
}
