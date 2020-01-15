package com.example.express.domain.bean;

import lombok.Builder;
import lombok.Data;

import java.math.BigDecimal;

/**
 * 公司订单统计
 * @date 2019年04月16日 23:10
 */
@Data
@Builder
public class VCompanyOrder {

    private String id;
    private String name;
    private String code;
    private BigDecimal waitOrder;
    private BigDecimal ingOrder;
    private BigDecimal errorOrder;
    private BigDecimal completeOrder;
}
