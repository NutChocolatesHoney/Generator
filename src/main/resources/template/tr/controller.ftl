package com.tr.app.controller

import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper
import com.baomidou.mybatisplus.core.toolkit.Wrappers
import com.baomidou.mybatisplus.extension.plugins.pagination.Page
import com.tr.common.ApiDataResultHelper
import com.tr.common.ApiResultListHelper
import com.tr.common.PageRequestHelper
import com.tr.constant.CommonConstant
import com.tr.app.service.App${data.className}Service
import com.tr.models.${data.className}
import com.tr.models.request.${data.className}Request
import com.tr.models.response.${data.className}Response
import com.tr.validate.Add
import com.tr.validate.Edit
import groovy.transform.CompileStatic
import groovy.transform.TypeChecked
import io.swagger.annotations.Api
import io.swagger.annotations.ApiOperation
import io.swagger.annotations.ApiParam
import org.springframework.beans.BeanUtils
import org.springframework.beans.factory.annotation.Autowired
import org.springframework.validation.annotation.Validated
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.PostMapping
import org.springframework.web.bind.annotation.RequestBody
import org.springframework.web.bind.annotation.RequestMapping
import org.springframework.web.bind.annotation.RequestParam
import org.springframework.web.bind.annotation.RestController

@CompileStatic
@TypeChecked
@RestController
@RequestMapping("/api/app/${data.objectName}")
@Api("${data.tableRemark}接口")
class App${data.className}Controller {

    @Autowired
    private App${data.className}Service ${data.objectName}Service

    @PostMapping("/add")
    @ApiOperation(value = "新增")
    ApiDataResultHelper<Boolean> add(@RequestBody @Validated(Add.class) ${data.className}Request req) {
        def ${data.objectName} = new ${data.className}()
        BeanUtils.copyProperties(req, ${data.objectName})
        new ApiDataResultHelper<>(
                resCode: CommonConstant.RE_SUCCESS_CODE,
                data: ${data.objectName}Service.save(${data.objectName} as ${data.className})
        )
    }

    @GetMapping("/del")
    @ApiOperation(value = "删除")
    ApiDataResultHelper<Boolean> del(@ApiParam(value = "id") @RequestParam(value = "id", required = true) Integer id) {
        new ApiDataResultHelper<>(
                resCode: CommonConstant.RE_SUCCESS_CODE,
                data: ${data.objectName}Service.removeById(id)
        )
    }

    @PostMapping("/modify")
    @ApiOperation(value = "修改")
    ApiDataResultHelper<Boolean> modify(@RequestBody @Validated(Edit.class) ${data.className}Request req) {
        def ${data.objectName} = new ${data.className}()
        BeanUtils.copyProperties(req, ${data.objectName})
        new ApiDataResultHelper<>(
                resCode: CommonConstant.RE_SUCCESS_CODE,
                data: ${data.objectName}Service.updateById(${data.objectName} as ${data.className})
        )
    }

    @PostMapping("/page")
    @ApiOperation(value = "列表-分页", notes = """查询条件：""")
    ApiResultListHelper<${data.className}Response> page(@RequestBody PageRequestHelper req) {
        Page<${data.className}> pageData = new Page<>(req.page, req.pageSize)
        LambdaQueryWrapper<${data.className}> wrapper = Wrappers.lambdaQuery()
        ${data.objectName}Service.page(pageData,wrapper)
        new ApiResultListHelper<${data.className}Response>(
                resCode: CommonConstant.RE_SUCCESS_CODE,
                page: pageData.current as Integer,
                pageSize: pageData.size as Integer,
                resultList: pageData.records,
                resultCount: pageData.total as Integer,
                pageCount: pageData.pages as Integer
        )
    }

    @GetMapping("/detail")
    @ApiOperation(value = "详细")
    ApiDataResultHelper<${data.className}> detail(@ApiParam(value = "id") @RequestParam(value = "id", required = true) Integer id) {
        return new ApiDataResultHelper<${data.className}>(
                resCode: CommonConstant.RE_SUCCESS_CODE,
                data: ${data.objectName}Service.getById(id)
        )
    }
}