package com.boshang.base.entities.condition;

import lombok.Data;
import lombok.experimental.Accessors;
<#if data.hasEnum>
import com.boshang.base.enums.${data.className}Enums;
</#if>
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

@Accessors(chain = true)
@Data
@ApiModel("${data.tableRemark}查询条件")
public class ${data.className}Condition {
<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive" && !column.isPk>
    /**
    * ${column.columnRemark}
    */
    @ApiModelProperty(value = "${column.columnRemark}")
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
    </#if>
</#list>
}