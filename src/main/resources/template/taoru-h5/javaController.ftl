package com.h5.base.controllers;

import cn.hutool.core.bean.BeanUtil;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.h5.base.commons.ApiResultHelper;
import com.h5.base.entities.request.Edit${data.classNameWithOutPrefix}Req;
import com.h5.base.entities.response.${data.classNameWithOutPrefix}Resp;
import com.h5.base.entities.condition.${data.className}Condition;
import com.h5.base.models.${data.className};
import com.h5.base.services.${data.className}Service;
import com.h5.base.interfaces.Add;
import com.h5.base.interfaces.Edit;
import com.github.yulichang.toolkit.MPJWrappers;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;

@RestController
@RequestMapping("/api/${data.objectNameWithOutPrefix}")
@Api(tags = "${data.tableRemark}接口")
public class ${data.className}Controller {

    @Resource
    private ${data.className}Service ${data.objectName}Service;

    @GetMapping("/{id}")
    @ApiOperation(value = "详情 蔡")
    ApiResultHelper<${data.classNameWithOutPrefix}Resp> detail(@PathVariable Integer id) {
        return ApiResultHelper.buildData(BeanUtil.copyProperties(${data.objectName}Service.get${data.className}(id), ${data.classNameWithOutPrefix}Resp.class));
    }

    @GetMapping("/page")
    @ApiOperation(value = "分页 蔡")
    ApiResultHelper<IPage<${data.classNameWithOutPrefix}Resp>> page(Page<Void> page, ${data.className}Condition condition) {
        IPage<${data.classNameWithOutPrefix}Resp> res = ${data.objectName}Service.selectJoinListPage(page, ${data.classNameWithOutPrefix}Resp.class, MPJWrappers.lambdaJoin()
                .selectAll(${data.className}.class)
                .selectAs(${data.className}::getId, ${data.classNameWithOutPrefix}Resp::get${data.classNameWithOutPrefix}Id));
        return ApiResultHelper.buildData(res);
    }

    @PostMapping
    @ApiOperation(value = "新增 蔡")
    ApiResultHelper<Void> save(@RequestBody @Validated(Add.class) Edit${data.classNameWithOutPrefix}Req req) {
        ${data.objectName}Service.save(BeanUtil.copyProperties(req, ${data.className}.class));
        return ApiResultHelper.build();
    }

    @PutMapping
    @ApiOperation(value = "修改 蔡")
    ApiResultHelper<Void> update(@RequestBody @Validated(Edit.class) Edit${data.classNameWithOutPrefix}Req req) {
        ${data.objectName}Service.updateById(BeanUtil.copyProperties(req, ${data.className}.class).setId(req.get${data.classNameWithOutPrefix}Id()));
        return ApiResultHelper.build();
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value = "删除 蔡")
    ApiResultHelper<Void> delete(@PathVariable Integer id) {
        ${data.objectName}Service.removeById(id);
        return ApiResultHelper.build();
    }
}