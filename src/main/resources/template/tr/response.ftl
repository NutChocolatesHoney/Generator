package com.tr.models.app.response

import io.swagger.annotations.ApiModelProperty
import groovy.transform.CompileStatic
import groovy.transform.TypeChecked
import lombok.Data
import lombok.experimental.Accessors

@CompileStatic
@TypeChecked
class ${data.className}Response extends BaseResponse {
<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive">

    @ApiModelProperty("${column.columnRemark}")
    ${column.javaFieldClass.simpleName} ${column.javaFieldName}
    </#if>
</#list>

}