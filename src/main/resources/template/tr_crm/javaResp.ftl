package com.crm.base.entities.response;

import com.crm.base.models.${data.className};
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.NoArgsConstructor;
<#if data.hasEnum>
import com.crm.base.enums.${data.className}Enums;
</#if>
import lombok.experimental.Accessors;

@Accessors(chain = true)
@Data
@NoArgsConstructor
public class ${data.classNameWithOutPrefix}Resp {
<#list data.allColumn as column>
    <#if column.javaFieldName != "orgId" && column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive">

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

    public ${data.classNameWithOutPrefix}Resp(${data.className} ${data.objectName}) {
    <#list data.allColumn as column1>
        <#if column1.javaFieldName != "orgId" && column1.javaFieldName != "updateTime" && column1.javaFieldName != "updateOpId" && column1.javaFieldName != "updateOpName" && column1.javaFieldName != "createTime" && column1.javaFieldName != "createOpId" && column1.javaFieldName != "createOpName" && column1.javaFieldName != "isActive">
        <#if column1.isPk>
        ${data.objectNameWithOutPrefix}${column1.javaFieldNameTitleCase} = ${data.objectName}.get${column1.javaFieldNameTitleCase}();
        <#else>
        ${column1.javaFieldName} = ${data.objectName}.get${column1.javaFieldNameTitleCase}();
        </#if>
        </#if>
    </#list>
    }
}
