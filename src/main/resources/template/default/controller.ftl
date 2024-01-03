package ${configs.controllerPackage};

import com.alibaba.fastjson.JSON;
import lombok.extern.slf4j.Slf4j;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.core.conditions.query.LambdaQueryWrapper;
import com.baomidou.mybatisplus.core.toolkit.Wrappers;
import com.baomidou.mybatisplus.extension.plugins.pagination.Page;
import ${configs.entityPackage}.${data.className}${configs.entitySuffix};
import ${configs.entityPackage}.Personnel;
import ${configs.servicePackage}.${data.className}Service;
import com.shangqi.xfd.common.Result;
import com.shangqi.xfd.common.Constant;
import org.springframework.web.bind.annotation.*;
import javax.servlet.http.HttpSession;
<#if configs.enableApi??>
import com.citrsw.annatation.*;
</#if>

import java.time.LocalDateTime;

/**
* ${data.tableRemark}${configs.controllerSuffix}
*
<#if configs.author??>
* @author ${configs.author}
</#if>
<#if configs.author??>
* @version ${configs.version}
</#if>
* @date ${configs.createTime?string('yyyy-MM-dd hh:mm:ss')}
*/
@RestController
@Slf4j
<#if configs.enableApi??>
@ApiClass(value = "${data.tableRemark}")
</#if>
public class ${data.className}${configs.controllerSuffix} {

    private final ${data.className}${configs.serviceSuffix} ${data.objectName}${configs.serviceSuffix};

    public ${data.className}${configs.controllerSuffix}(${data.className}${configs.serviceSuffix} ${data.objectName}${configs.serviceSuffix}) {
        this.${data.objectName}${configs.serviceSuffix} = ${data.objectName}${configs.serviceSuffix};
    }

    /**
     * 保存${data.tableRemark}
     */
    <#if configs.enableApi??>
    @ApiMethod("保存${data.tableRemark}")
    </#if>
    @PostMapping("/${data.tableMappingName}")
    @ApiAppointParam(require = {<#list data.allFieldDefinitions as fieldDefinition>"${fieldDefinition.javaFieldName}"<#if fieldDefinition_has_next>, </#if> </#list>}, nonRequire = {<#list data.allFieldDefinitions as fieldDefinition>"${fieldDefinition.javaFieldName}"<#if fieldDefinition_has_next>, </#if> </#list>})
    public Result<Boolean> save(@RequestBody ${data.className}${configs.entitySuffix} ${data.objectName}${configs.entitySuffix}, HttpSession session) {
        Personnel personnel = (Personnel) session.getAttribute(Constant.USER_KEY);
        boolean save = ${data.objectName}${configs.serviceSuffix}.save(${data.objectName}${configs.entitySuffix});
        log.info("新建${data.tableRemark}成功，创建人Id:[{}],新${data.tableRemark}Id:[{}]", personnel.getId(), ${data.objectName}${configs.entitySuffix}.getId());
        return Result.buildSaveOk(save);
    }

    /**
    * 根据Id查询${data.tableRemark}
    */
    <#if configs.enableApi??>
        @ApiMethod("根据Id查询${data.tableRemark}")
    </#if>
    @GetMapping("/${data.tableMappingName}/query")
    @ApiAppointParam(require = {"id"})
    public Result<${data.className}${configs.entitySuffix}> query(Long id, HttpSession session) {
        Personnel personnel = (Personnel) session.getAttribute(Constant.USER_KEY);
        ${data.className}${configs.entitySuffix} ${data.objectName}${configs.entitySuffix} = ${data.objectName}${configs.serviceSuffix}.getById(id);
        return Result.buildQueryOk(${data.objectName}${configs.entitySuffix});
    }

    /**
     * 根据Id修改${data.tableRemark}
     */
    <#if configs.enableApi??>
    @ApiMethod("根据Id修改${data.tableRemark}")
    </#if>
    @PutMapping("/${data.tableMappingName}")
    @ApiAppointParam(require = {<#list data.allFieldDefinitions as fieldDefinition>"${fieldDefinition.javaFieldName}"<#if fieldDefinition_has_next>, </#if></#list>}, nonRequire = {<#list data.allFieldDefinitions as fieldDefinition>"${fieldDefinition.javaFieldName}"<#if fieldDefinition_has_next>, </#if></#list>})
    public Result<Boolean> modify(@RequestBody ${data.className}${configs.entitySuffix} ${data.objectName}${configs.entitySuffix}, HttpSession session) {
        Personnel personnel = (Personnel) session.getAttribute(Constant.USER_KEY);
        boolean modify = ${data.objectName}${configs.serviceSuffix}.updateById(${data.objectName}${configs.entitySuffix});
        log.info("修改${data.tableRemark}成功，修改人Id:[{}],${data.tableRemark}Id:[{}]", personnel.getId(), ${data.objectName}${configs.entitySuffix}.getId());
        return Result.buildUpdateOk(modify);
    }

    /**
     * 根据Id删除${data.tableRemark}
     */
    <#if configs.enableApi??>
    @ApiMethod("根据Id删除${data.tableRemark}")
    </#if>
    @DeleteMapping("/${data.tableMappingName}/{id}")
    public Result<Boolean> delete(@PathVariable Long id, HttpSession session) {
        Personnel personnel = (Personnel) session.getAttribute(Constant.USER_KEY);
        ${data.className}${configs.entitySuffix} ${data.objectName}${configs.entitySuffix} = ${data.objectName}${configs.serviceSuffix}.getById(id);
        boolean delete = ${data.objectName}${configs.serviceSuffix}.removeById(id);
        log.warn("已删除${data.tableRemark}信息，[{}]", JSON.toJSONString(${data.objectName}${configs.entitySuffix}));
        log.info("删除${data.tableRemark}成功，删除人Id:[{}],${data.tableRemark}Id:[{}]", personnel.getId(), id);
        return Result.buildDeleteOk(delete);
    }

    /**
     * 根据条件分页查询${data.tableRemark}
     */
    <#if configs.enableApi??>
    @ApiMethod("根据条件分页查询${data.tableRemark}")
    </#if>
    @GetMapping("/${data.tableMappingName}/page/all")
    @ApiAppointParam(require = {<#list data.allFieldDefinitions as fieldDefinition>"${fieldDefinition.javaFieldName}"<#if fieldDefinition_has_next>, </#if></#list>}, nonRequire = {<#list data.allFieldDefinitions as fieldDefinition>"${fieldDefinition.javaFieldName}"<#if fieldDefinition_has_next>, </#if></#list>, "current", "size", "orders.column", "orders.asc"})
    public Result<Page<${data.className}${configs.entitySuffix}>> pageAll(${data.className}${configs.entitySuffix} ${data.objectName}${configs.entitySuffix}, Page<${data.className}${configs.entitySuffix}> page, HttpSession session) {
        Personnel personnel = (Personnel) session.getAttribute(Constant.USER_KEY);
        LambdaQueryWrapper<${data.className}${configs.entitySuffix}> wrapper = Wrappers.lambdaQuery();
        return Result.buildQueryOk(${data.objectName}${configs.serviceSuffix}.page(page, wrapper));
    }
}