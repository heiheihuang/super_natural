package com.example.express.controller.api;

import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.example.express.domain.ResponseResult;
import com.example.express.domain.bean.DataNotice;
import com.example.express.domain.enums.ResponseErrorCodeEnum;
import com.example.express.domain.vo.BootstrapTableVO;
import com.example.express.service.DataNoticeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.time.LocalDateTime;
import java.util.Date;

@RestController
@RequestMapping("/api/v1/notice")
public class NoticeApiController {
    @Autowired
    private DataNoticeService dataNoticeService;

    /**
     * 获取快递公司列表
     * @author jitwxs
     * @date 2019/5/3 21:58
     * @return
     */
    @GetMapping("/notice-list")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public BootstrapTableVO<DataNotice> listCompany(@RequestParam(required = false, defaultValue = "1") Integer current,
                                                     @RequestParam(required = false, defaultValue = "10") Integer size) {
        return dataNoticeService.pageDataNoticeVO(new Page<>(current, size));
    }

    /**
     * 删除公告
     * @author jitwxs
     * @date 2019/5/2 13:50
     */
    @PostMapping("/{id}/delete")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseResult deleteCompany(@PathVariable String id) {
        DataNotice dataNotice = dataNoticeService.getById(id);
        if(dataNoticeService.removeById(dataNotice)) {
            return ResponseResult.success();
        } else {
            return ResponseResult.failure(ResponseErrorCodeEnum.OPERATION_ERROR);
        }
    }

    /**
     * 新增公告
     * @author jitwxs
     * @date 2019/5/2 13:50
     */
    @PostMapping("/add")
    @PreAuthorize("hasRole('ROLE_ADMIN')")
    public ResponseResult addCompany(String title, String content) {
        DataNotice dataNotice = DataNotice.builder().title(title)
                .content(content).createTime(LocalDateTime.now()).build();
        dataNoticeService.save(dataNotice);
        return ResponseResult.success();
    }
}
