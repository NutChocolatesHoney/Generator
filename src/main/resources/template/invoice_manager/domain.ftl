package com.shdy.project.worksheet.domain;

import com.shdy.framework.aspectj.lang.annotation.Excel;
import com.shdy.framework.web.domain.BaseEntity;
import org.apache.commons.lang.builder.ToStringBuilder;
import org.apache.commons.lang.builder.ToStringStyle;

/**
* 群组参数对象 ${data.tableName}
*
* @author shdy
* @date 2022-09-22
*/
public class ${data.className} extends BaseEntity
{
    private static final long serialVersionUID = 1L;

<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "createTime" && column.javaFieldName != "updateBy" && column.javaFieldName != "createBy"  && column.javaFieldName != "remark">
    /** ${column.columnRemark} */
        <#if column.javaFieldName != "id">
    @Excel(name = "${column.columnRemark}")
        </#if>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
</#list>

<#list data.allColumn as column>
    <#if column.javaFieldName != "updateTime" && column.javaFieldName != "createTime" && column.javaFieldName != "updateBy" && column.javaFieldName != "createBy"  && column.javaFieldName != "remark">
    public void set${column.javaFieldNameTitleCase}(${column.javaFieldClass.simpleName} ${column.javaFieldName})
    {
    this.${column.javaFieldName} = ${column.javaFieldName};
    }

    public ${column.javaFieldClass.simpleName} get${column.javaFieldNameTitleCase}()
    {
    return ${column.javaFieldName};
    }
    </#if>
</#list>

    @Override
    public String toString() {
        return new ToStringBuilder(this,ToStringStyle.MULTI_LINE_STYLE)
<#list data.allColumn as column>
        .append("${column.javaFieldName}", get${column.javaFieldNameTitleCase}())
</#list>
        .toString();
    }
}