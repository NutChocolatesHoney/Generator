package ${config.create.modelPackage};

import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;
import lombok.experimental.Accessors;
<#list data.imports as import>
import ${import};
</#list>

import java.io.Serializable;


/**
 * ${data.tableRemark}
 *
<#--<#if config.author??>-->
<#-- * @author ${config.author}-->
<#--</#if>-->
<#--<#if config.author??>-->
<#-- * @version ${config.version}-->
<#--</#if>-->
<#-- * @date ${config.createTime?string('yyyy-MM-dd hh:mm:ss')}-->
 */
@TableName("${data.tableName}")
@Accessors(chain = true)
@Data
<#--<#if config.enableApi??>-->
<#--@ApiModel("${data.tableRemark}")-->
<#--</#if>-->
public class ${data.className} implements Serializable {

    private static final long serialVersionUID = 1L;
    <#list data.allColumn as column>

    /**
     * ${column.columnRemark}
     */
<#--    <#if config.enableApi??>-->
<#--    @ApiProperty(description = "${fieldDefinition.columnRemark}")-->
<#--    </#if>-->
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};
    </#list>
}