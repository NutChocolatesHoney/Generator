package ${createInfo.modulePath};

<#list data.imports as import>
import ${import};
</#list>
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
* ${data.tableRemark}
*
* @author ${common.username}
* @since ${common.now}
*/
@Accessors(chain = true)
@Data
public class ${data.className} implements Serializable {

    private static final long serialVersionUID = 1L;

<#list data.commonColumn as column>
    /**
    * ${column.columnRemark}
    */
    private ${column.javaFieldClass.simpleName} ${column.javaFieldName};

</#list>
}