package ${createInfo.modulePath};

<#if data.hasEnum>
import com.aiseeding.ase.common.table.enumeration.${data.className}Enums;
</#if>
<#list data.imports as import>
import ${import};
</#list>
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* ${data.tableRemark}
*
* @author ${common.username}
* @since ${common.now}
*/
@EqualsAndHashCode(callSuper = true)
@Accessors(chain = true)
@Data
@TableName("${data.tableName}")
public class ${data.className} extends BaseModel implements Serializable {

    private static final long serialVersionUID = 1L;
<#list data.commonColumn as column>

    /**
    * ${column.columnRemark}
    */
    <#if column.isPk>
    @TableId(type = IdType.AUTO)
    </#if>
    <#if column.javaFieldName == "companyCode">
    @TableField(fill = FieldFill.INSERT_UPDATE)
    </#if>
    <#if column.javaFieldName == "updateTime">
    @TableField(fill = FieldFill.INSERT_UPDATE)
    </#if>
    <#if column.javaFieldName == "updateUserId">
    @TableField(fill = FieldFill.UPDATE)
    </#if>
    <#if column.javaFieldName == "updateUsername">
    @TableField(fill = FieldFill.UPDATE)
    </#if>
    <#if column.javaFieldName == "createTime">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "createUserId">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "createUsername">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "active">
    @TableLogic
    private boolean active;
    </#if>
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    <#if column.javaFieldName != "active">
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
    </#if>
</#list>
}