package com.durian.base.entities.request;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import com.durian.base.interfaces.Edit;
import com.durian.base.models.${data.className};
<#if data.hasEnum>
import com.durian.base.enums.${data.className}Enums;
</#if>

import javax.validation.constraints.NotNull;

@Accessors(chain = true)
@Data
public class Edit${data.classNameWithOutPrefix}Req {
<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive">

    @ApiModelProperty(value = "${column.columnRemark}")
    <#if column.isPk>
    @NotNull(groups = Edit.class)
    </#if>
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
