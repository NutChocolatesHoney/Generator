package com.crm.base.entities.request;

import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
import com.crm.base.interfaces.Edit;
import com.crm.base.models.${data.className};
<#if data.hasEnum>
import com.crm.base.enums.${data.className}Enums;
</#if>

import javax.validation.constraints.NotNull;

@Accessors(chain = true)
@Data
public class Edit${data.classNameWithOutPrefix}Req {
<#list data.allColumn as column>
    <#if column.javaFieldName != "orgId" && column.javaFieldName != "updateTime" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createTime" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName" && column.javaFieldName != "isActive">

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

    public ${data.className} transToModel() {
        return new ${data.className}()
            <#list data.allColumn as column1>
            <#if !column1.isPk && column1.javaFieldName != "orgId" && column1.javaFieldName != "updateTime" && column1.javaFieldName != "updateOpId" && column1.javaFieldName != "updateOpName" && column1.javaFieldName != "createTime" && column1.javaFieldName != "createOpId" && column1.javaFieldName != "createOpName" && column1.javaFieldName != "isActive">
                .set${column1.javaFieldNameTitleCase}(${column1.javaFieldName})
            </#if>
            </#list>
                ;
    }
}
