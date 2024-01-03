package com.durian.base.models;

import com.baomidou.mybatisplus.annotation.FieldFill;
import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import com.durian.base.commons.CommonConstant;
<#if data.hasEnum>
import com.durian.base.enums.${data.className}Enums;
</#if>
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
    <#if column.javaFieldName == "isActive">
    @TableLogic
    @ApiModelProperty(value = "${column.columnRemark}")
    private CommonConstant.IsActive isActive;
    </#if>
    <#if column.isEnum>
    @ApiModelProperty(value = "${column.columnRemark}")
    private ${data.className}Enums.${column.enumName} ${column.javaFieldName};
    <#else>
    <#if column.javaFieldName != "isActive">
    @ApiModelProperty(value = "${column.columnRemark}")
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#if>
    </#if>
</#list>
}