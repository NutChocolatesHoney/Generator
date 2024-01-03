package com.shimu.mes.base.entities.response;

import com.shimu.mes.base.models.${data.className};
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
<#if data.hasEnum>
import com.shimu.mes.base.enums.${data.className}Enums;
</#if>
<#list data.imports as import>
import ${import};
</#list>
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@NoArgsConstructor
public class ${data.classNameWithOutPrefix}Resp {
<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive">

    @ApiModelProperty(value = "${column.columnRemark}")
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    <#if column.isPk>
    private ${column.javaFieldClass.simpleName} ${data.objectNameWithOutPrefix}${column.javaFieldNameTitleCase};
    <#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
    </#if>
    </#if>
</#list>
}
