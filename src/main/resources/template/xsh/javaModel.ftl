package com.xsh.models.plus;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableLogic;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;
<#list data.imports as import>
import ${import};
</#list>

import java.io.Serializable;

@Accessors(chain = true)
@Data
@TableName("${data.tableName}")
public class Plus${data.className} implements Serializable {

    private static final long serialVersionUID = 1L;
<#list data.allColumn as column>

    /**
    * ${column.columnRemark}
    */
    <#if column.isPk>
    @TableId(type = IdType.AUTO)
    </#if>
    <#if column.javaFieldName == "isActive">
    @TableLogic
    </#if>
    public ${column.javaFieldClass.simpleName} ${column.javaFieldName};

</#list>
}