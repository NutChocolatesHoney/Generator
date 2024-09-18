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
* ${data.tableRemark}(${data.tableName})返回类
*
* @author ${common.username}
* @since ${common.now}
*/
@Accessors(chain = true)
@Data
public class ${data.className}Resp {

<#list data.commonColumn as column>
    /**
    * ${column.columnRemark}
    */
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>

</#list>
}