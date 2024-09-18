package ${createInfo.modulePath};

<#list data.imports as import>
import ${import};
</#list>
<#if data.hasEnum>
import com.aiseeding.ase.common.table.enumeration.${data.className}Enums;
</#if>

import lombok.Data;
import lombok.experimental.Accessors;

/**
* ${data.tableRemark}(${data.tableName})查询类
*
* @author ${common.username}
* @since ${common.now}
*/
@Accessors(chain = true)
@Data
public class ${data.className}QO {

<#list data.commonColumn as column>
<#if column.javaFieldClass.simpleName == "Date">
    /**
    * ${column.columnRemark} 范围查询 开始时间
    */
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName}StartTime;

    /**
    * ${column.columnRemark} 范围查询 结束时间
    */
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName}EndTime;

<#else>
    /**
    * ${column.columnRemark}
    */
<#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
<#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
</#if>

</#if>
</#list>
}