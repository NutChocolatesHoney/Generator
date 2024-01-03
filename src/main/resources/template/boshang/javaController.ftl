package com.boshang.base.controllers;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import com.boshang.base.commons.ApiResultHelper;
import com.boshang.base.entities.request.Edit${data.classNameWithOutPrefix}Req;
import com.boshang.base.entities.response.${data.classNameWithOutPrefix}Resp;
import com.boshang.base.entities.condition.${data.className}Condition;
import com.boshang.base.models.${data.className};
import com.boshang.base.services.${data.className}Service;
import com.boshang.base.interfaces.Add;
import com.boshang.base.interfaces.Edit;
import com.github.yulichang.toolkit.MPJWrappers;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

@RestController
@RequestMapping
@Api(value = "${data.tableRemark}")
public class ${data.className}Controller {

    @Resource
    private ${data.className}Service ${data.objectName}Service;

    @GetMapping("/${data.objectNameWithOutPrefix}/{id}")
    @ApiOperation("详情")
    ApiResultHelper<${data.classNameWithOutPrefix}Resp> detail(@PathVariable Integer id) {
        return ApiResultHelper.buildData(new ${data.classNameWithOutPrefix}Resp(${data.objectName}Service.get${data.className}(id)));
    }

    @GetMapping("/${data.objectNameWithOutPrefix}s")
    @ApiOperation("分页")
    ApiResultHelper<IPage<${data.classNameWithOutPrefix}Resp>> page(
            Page<Void> page,
            ${data.className}Condition condition) {
        IPage<${data.classNameWithOutPrefix}Resp> res = ${data.objectName}Service.selectJoinListPage(page, ${data.classNameWithOutPrefix}Resp.class, MPJWrappers.lambdaJoin()
                .selectAll(${data.className}.class)
                .selectAs(${data.className}::getId, ${data.classNameWithOutPrefix}Resp::get${data.classNameWithOutPrefix}Id));
        return ApiResultHelper.buildData(res);
    }

    @PostMapping("/${data.objectNameWithOutPrefix}")
    @ApiOperation("保存")
    ApiResultHelper<Void> save(@RequestBody @Validated(Add.class) Edit${data.classNameWithOutPrefix}Req req) {
        ${data.objectName}Service.save(req.transToModel());
        return ApiResultHelper.build();
    }

    @PutMapping("/${data.objectNameWithOutPrefix}")
    @ApiOperation("修改")
    ApiResultHelper<Void> update(@RequestBody @Validated(Edit.class) Edit${data.classNameWithOutPrefix}Req req) {
        ${data.objectName}Service.updateById(req.transToModel().setId(req.get${data.classNameWithOutPrefix}Id()));
        return ApiResultHelper.build();
    }

    @DeleteMapping("/${data.objectNameWithOutPrefix}/{id}")
    @ApiOperation("删除")
    ApiResultHelper<Void> delete(@PathVariable Integer id) {
        ${data.objectName}Service.removeById(id);
        return ApiResultHelper.build();
    }
}