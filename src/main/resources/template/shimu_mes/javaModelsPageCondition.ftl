package com.shimu.mes.base.entities.condition;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
<#if data.hasEnum>
import com.shimu.mes.base.enums.${data.className}Enums;
</#if>
<#list data.imports as import>
import ${import};
</#list>

@Accessors(chain = true)
@Data
public class ${data.className}Condition {
<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive" && !column.isPk>

    @ApiModelProperty(value = "${column.columnRemark}")
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
    </#if>
</#list>
}