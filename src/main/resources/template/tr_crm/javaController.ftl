package com.crm.base.controllers;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import com.crm.base.commons.ApiResultHelper;
import com.crm.base.entities.request.Edit${data.classNameWithOutPrefix}Req;
import com.crm.base.entities.response.${data.classNameWithOutPrefix}Resp;
import com.crm.base.entities.condition.M${data.className}Condition;
import com.crm.base.models.${data.className};
import com.crm.base.services.${data.className}Service;
import com.crm.base.interfaces.Add;
import com.crm.base.interfaces.Edit;
import com.github.yulichang.toolkit.MPJWrappers;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;

@RestController
@RequestMapping("/api/${data.objectName}")
@Api(tags="${data.tableRemark}接口")
public class ${data.className}Controller {

    @Resource
    private ${data.className}Service ${data.objectName}Service;

    @GetMapping("/{id}")
    @ApiOperation(value="详情")
    ApiResultHelper<${data.classNameWithOutPrefix}Resp> detail(@PathVariable Integer id) {
        return ApiResultHelper.buildData(new ${data.classNameWithOutPrefix}Resp(${data.objectName}Service.get${data.className}(id)));
    }

    @GetMapping("/page")
    @ApiOperation(value="分页")
    ApiResultHelper<IPage<${data.classNameWithOutPrefix}Resp>> page(
            Page<Void> page,
            M${data.className}Condition condition) {
        IPage<${data.classNameWithOutPrefix}Resp> res = ${data.objectName}Service.selectJoinListPage(page, ${data.classNameWithOutPrefix}Resp.class, MPJWrappers.lambdaJoin()
                .selectAll(${data.className}.class)
                .selectAs(${data.className}::getId, ${data.classNameWithOutPrefix}Resp::get${data.classNameWithOutPrefix}Id));
        return ApiResultHelper.buildData(res);
    }

    @PostMapping
    @ApiOperation(value="新增")
    ApiResultHelper<Void> save(@RequestBody @Validated(Add.class) Edit${data.classNameWithOutPrefix}Req req) {
        ${data.objectName}Service.save(req.transToModel());
        return ApiResultHelper.build();
    }

    @PutMapping
    @ApiOperation(value="修改")
    ApiResultHelper<Void> update(@RequestBody @Validated(Edit.class) Edit${data.classNameWithOutPrefix}Req req) {
        ${data.objectName}Service.updateById(req.transToModel().setId(req.get${data.classNameWithOutPrefix}Id()));
        return ApiResultHelper.build();
    }

    @DeleteMapping("/{id}")
    @ApiOperation(value="删除")
    ApiResultHelper<Void> delete(@PathVariable Integer id) {
        ${data.objectName}Service.removeById(id);
        return ApiResultHelper.build();
    }
}