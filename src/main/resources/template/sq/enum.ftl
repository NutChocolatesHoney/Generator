package com.sq.enums;

import com.sq.interfaces.TableEnum;
import com.fasterxml.jackson.annotation.JsonCreator;
import com.fasterxml.jackson.annotation.JsonValue;
import lombok.Getter;

public class ${data.className}Enums {
<#list data.enumColumn as column>

    @Getter
    public enum ${column.enumName} implements TableEnum<${column.enumNameType}, ${column.enumValueType}> {
    <#if column.enumData?size==0>
        ;
    </#if>
    <#list column.enumData as enum>
        ${enum.name}(<#if column.enumNameType == "String">"</#if>${enum.name}<#if column.enumNameType == "String">"</#if>, <#if column.enumValueType == "String">"</#if>${enum.value}<#if column.enumValueType == "String">"</#if>)<#if enum_has_next>,<#else>;</#if>
    </#list>

        private final ${column.enumNameType} name;
        @JsonValue
        private final ${column.enumValueType} value;

        @JsonCreator
        ${column.enumName}(${column.enumNameType} name, ${column.enumValueType} value) {
            this.name = name;
            this.value = value;
        }
    }
</#list>
}