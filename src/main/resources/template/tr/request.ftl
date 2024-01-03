package com.tr.models.app.request

import com.tr.validate.Edit
import io.swagger.annotations.ApiModelProperty
import groovy.transform.CompileStatic
import groovy.transform.TypeChecked
import lombok.Data
import lombok.experimental.Accessors
import javax.validation.constraints.NotNull

@CompileStatic
@TypeChecked
class ${data.className}Request extends BaseRequest {
<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive">

    @ApiModelProperty("${column.columnRemark}")
    <#if column.javaFieldName == "id">
    @NotNull(groups = Edit.class, message = "主键不可为空")
    </#if>
    ${column.javaFieldClass.simpleName} ${column.javaFieldName}
    </#if>
</#list>

}
