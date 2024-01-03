package ${common.modulePath}.${createInfo.packageName};

import org.hibernate.validator.constraints.Length;
import io.swagger.annotations.ApiModelProperty;
<#if common.autoFill>
import com.ceair.gsm.gst.entity.UserInfoAutoFillEntity;
</#if>
<#list data.imports as import>
import ${import};
</#list>
<#if data.hasEnum>
import ${common.modulePath}.enums.${data.className}Enums;
</#if>
/**
* ${data.tableRemark}(${data.tableName})实体类
*
* @author ${common.username}
* @since ${common.now}
*/
public class ${data.className} <#if common.autoFill>extends UserInfoAutoFillEntity</#if> {
<#assign fieldList = ["creator","creatorName","createTime","modifier","modifierName","modifyTime","active"]>

<#list data.allColumn as column>
    <#if !(fieldList?seq_contains(column.javaFieldName)) || !common.autoFill>
    <#if column.columnRemark?has_content>
    /**
    * ${column.columnRemark}
    */
    @ApiModelProperty(value = "${column.columnRemark}")
    </#if>
    <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
    @Length(min=0, max=${column.columnSize}, message="${column.columnRemark}不能超过 ${column.columnSize}个字符")
    </#if>
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>

    </#if>

</#list>
<#list data.allColumn as column>
    <#if !(fieldList?seq_contains(column.javaFieldName)) || !common.autoFill>
<#if column.isEnum>
    public ${data.className}Enums.${column.enumName} get${column.javaFieldNameTitleCase}() {
    return ${column.javaFieldName};
    }

    public ${data.className} set${column.javaFieldNameTitleCase}(${data.className}Enums.${column.enumName} ${column.javaFieldName}) {
    this.${column.javaFieldName} = ${column.javaFieldName};
    return this;
    }
<#else>
    public ${column.javaFieldClass.simpleName} get${column.javaFieldNameTitleCase}() {
        return ${column.javaFieldName};
    }

    public ${data.className} set${column.javaFieldNameTitleCase}(${column.javaFieldClass.simpleName} ${column.javaFieldName}) {
        this.${column.javaFieldName} = ${column.javaFieldName};
        return this;
    }
</#if>
</#if>

</#list>
}