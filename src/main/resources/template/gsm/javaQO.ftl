package ${common.modulePath}.${createInfo.packageName};

import org.hibernate.validator.constraints.Length;
import io.swagger.annotations.ApiModelProperty;
<#list data.imports as import>
import ${import};
</#list>
<#if data.hasEnum>
import ${common.modulePath}.enums.${data.className}Enums;
</#if>
/**
* ${data.tableRemark}(${data.tableName})查询类
*
* @author ${common.username}
* @since ${common.now}
*/
public class ${data.className}QO {

<#list data.allColumn as column>
<#if column.javaFieldClass.simpleName == "Date">
    <#if column.columnRemark?has_content>
    /**
    * ${column.columnRemark}
    */
    @ApiModelProperty(value = "${column.columnRemark} 范围查询 开始时间")
    </#if>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName}StartTime;

    <#if column.columnRemark?has_content>
    /**
    * ${column.columnRemark}
    */
    @ApiModelProperty(value = "${column.columnRemark} 范围查询 结束时间")
    </#if>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName}EndTime;

<#else>
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
<#if column.javaFieldClass.simpleName == "Date">
    public ${column.javaFieldClass.simpleName} get${column.javaFieldNameTitleCase}StartTime() {
    return ${column.javaFieldName}StartTime;
    }

    public ${data.className}QO set${column.javaFieldNameTitleCase}StartTime(${column.javaFieldClass.simpleName} ${column.javaFieldName}StartTime) {
    this.${column.javaFieldName}StartTime = ${column.javaFieldName}StartTime;
    return this;
    }

    public ${column.javaFieldClass.simpleName} get${column.javaFieldNameTitleCase}EndTime() {
    return ${column.javaFieldName}EndTime;
    }

    public ${data.className}QO set${column.javaFieldNameTitleCase}EndTime(${column.javaFieldClass.simpleName} ${column.javaFieldName}EndTime) {
    this.${column.javaFieldName}EndTime = ${column.javaFieldName}EndTime;
    return this;
    }
<#elseif column.isEnum>
    public ${data.className}Enums.${column.enumName} get${column.javaFieldNameTitleCase}() {
    return ${column.javaFieldName};
    }

    public ${data.className}QO set${column.javaFieldNameTitleCase}(${data.className}Enums.${column.enumName} ${column.javaFieldName}) {
    this.${column.javaFieldName} = ${column.javaFieldName};
    return this;
    }
<#else>
    public ${column.javaFieldClass.simpleName} get${column.javaFieldNameTitleCase}() {
    return ${column.javaFieldName};
    }

    public ${data.className}QO set${column.javaFieldNameTitleCase}(${column.javaFieldClass.simpleName} ${column.javaFieldName}) {
    this.${column.javaFieldName} = ${column.javaFieldName};
    return this;
    }
</#if>

</#list>
}