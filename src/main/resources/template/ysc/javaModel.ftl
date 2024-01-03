package com.retail.common.v2.models;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import org.hibernate.validator.constraints.Length;
import io.swagger.annotations.ApiModelProperty;
import lombok.Data;
import lombok.experimental.Accessors;
<#list data.imports as import>
import ${import};
</#list>

import java.io.Serializable;

@Accessors(chain = true)
@Data
@TableName("${data.tableName}")
public class ${data.className} implements Serializable {

    private static final long serialVersionUID = 1L;
<#list data.allColumn as column>

    /**
    * ${column.columnRemark}
    */
    <#if column.isPk>
    @TableId(type = IdType.AUTO)
    </#if>
    <#if column.javaFieldName != "updateDate" && column.javaFieldName != "updateOpId" && column.javaFieldName != "updateOpName" && column.javaFieldName != "createDate" && column.javaFieldName != "createOpId" && column.javaFieldName != "createOpName">
    @TableField(value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "updateDate">
    @TableField(fill = FieldFill.INSERT_UPDATE, value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "updateOpId">
    @TableField(fill = FieldFill.UPDATE, value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "updateOpName">
    @TableField(fill = FieldFill.UPDATE, value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "createDate">
    @TableField(fill = FieldFill.INSERT, value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "createOpId">
    @TableField(fill = FieldFill.INSERT, value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "createOpName">
    @TableField(fill = FieldFill.INSERT, value = "${column.columnName}")
    </#if>
    <#if column.javaFieldName == "isActive">
    @TableLogic
    @ApiModelProperty(value = "${column.columnRemark}")
    private CommonConstant.IsActive isActive;
    </#if>
    <#if column.javaFieldName != "isActive">
        <#if column.javaFieldClass.simpleName == "String">
    @Length(min=0, max=${column.columnSize}, message="${column.columnRemark}不能超过 ${column.columnSize}个字符")
        </#if>
    @ApiModelProperty(value = "${column.columnRemark}")
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
</#list>
}