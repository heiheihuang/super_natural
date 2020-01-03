package com.example.express.service.impl;

import com.baomidou.mybatisplus.core.conditions.query.QueryWrapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import com.example.express.common.cache.CommonDataCache;
import com.example.express.common.constant.RedisKeyConstant;
import com.example.express.domain.bean.DataCompany;
import com.example.express.domain.bean.DataNotice;
import com.example.express.domain.vo.BootstrapTableVO;
import com.example.express.mapper.DataCompanyMapper;
import com.example.express.mapper.DataNoticeMapper;
import com.example.express.service.DataCompanyService;
import com.example.express.service.DataNoticeService;
import io.netty.util.concurrent.DefaultThreadFactory;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.context.event.ApplicationStartedEvent;
import org.springframework.context.ApplicationListener;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ScheduledThreadPoolExecutor;
import java.util.concurrent.TimeUnit;

@Slf4j
@Service
public class DataNoticeServiceImpl extends ServiceImpl<DataNoticeMapper, DataNotice> implements DataNoticeService {
    @Resource
    private DataNoticeMapper dataNoticeMapper;
    @Resource
    private RedisTemplate<String, DataCompany> redisTemplate;

    @Override
    public BootstrapTableVO<DataNotice> pageDataNoticeVO(Page<DataNotice> dataNoticePage) {
        IPage<DataNotice> selectPage = dataNoticeMapper.selectPage(dataNoticePage, new QueryWrapper<>());
        BootstrapTableVO<DataNotice> result = new BootstrapTableVO<>();
        result.setTotal(selectPage.getTotal());
        result.setRows(selectPage.getRecords());
        return result;
    }

}
