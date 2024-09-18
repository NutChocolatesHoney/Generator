package ${createInfo.modulePath};

public class ${data.className}Enums {
<#list data.enumColumn as column>

    public enum ${column.enumName}{
    <#if column.enumData?size==0>
        ;
    </#if>
    <#list column.enumData as enum>
        //${enum.name}
        ${enum.value},
    </#list>
    }
</#list>
}