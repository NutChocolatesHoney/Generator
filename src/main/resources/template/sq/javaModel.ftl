package com.sq.models;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;
<#if data.hasEnum>
import com.sq.enums.${data.className}Enums;
</#if>
import lombok.Data;
import lombok.experimental.Accessors;
<#list data.imports as import>
import ${import};
</#list>

import java.io.Serializable;

@ApiModel("${data.tableRemark}")
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
    <#if column.javaFieldName == "updateTime">
    @TableField(fill = FieldFill.UPDATE)
    </#if>
    <#if column.javaFieldName == "updateOpId">
    @TableField(fill = FieldFill.UPDATE)
    </#if>
    <#if column.javaFieldName == "updateOpName">
    @TableField(fill = FieldFill.UPDATE)
    </#if>
    <#if column.javaFieldName == "createTime">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "createOpId">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "createOpName">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "orgId">
    @TableField(fill = FieldFill.INSERT)
    </#if>
    <#if column.javaFieldName == "isActive">
    @TableLogic
    </#if>
    @ApiModelProperty(value = "${column.columnRemark}")
    <#if column.isEnum>
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
</#list>
}