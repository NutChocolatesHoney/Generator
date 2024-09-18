<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.aiseeding.ase.main.orm.dao.${data.className}Mapper">

    <select id="select${data.classNameWithOutPrefix}List" resultType="com.aiseeding.ase.main.entity.resp.${data.className}Resp">
        select
        <#list data.commonColumn as column>
            <#if column?is_last>
                ${column.columnName}
            <#else>
                ${column.columnName},
            </#if>
        </#list>
        from ${data.tableName}
        <where>
        <#if data.isLogicalDel>
            and active = 1
        </#if>
            <#list data.commonColumn as column>
                <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
                    <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">
                        and ${column.columnName} like concat('%',<#noparse>#{</#noparse>${column.javaFieldName}},'%')
                    </if>
                <#elseif column.javaFieldClass.simpleName == "Date">
                    <if test="${column.javaFieldName}StartTime != null">
                        and ${column.columnName} <#noparse>< #{</#noparse>${column.javaFieldName}StartTime}
                    </if>
                    <if test="${column.javaFieldName}EndTime != null">
                        and <#noparse>#{</#noparse>${column.javaFieldName}EndTime} <#noparse><</#noparse> ${column.columnName}
                    </if>
                <#else>
                    <if test="${column.javaFieldName} != null">
                        and ${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}}
                    </if>
                </#if>
            </#list>
        </where>

    </select>

    <select id="select${data.classNameWithOutPrefix}Page" resultType="com.aiseeding.ase.main.entity.resp.${data.className}Resp">
        select
        <#list data.commonColumn as column>
            <#if column?is_last>
                ${column.columnName}
            <#else>
                ${column.columnName},
            </#if>
        </#list>
        from ${data.tableName}
        <where>
        <#if data.isLogicalDel>
            and active = 1
        </#if>
            <if test="qo != null">
            <#list data.commonColumn as column>
            <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
                <if test="qo.${column.javaFieldName} != null and qo.${column.javaFieldName} != ''">
                    and ${column.columnName} like concat('%',<#noparse>#{qo.</#noparse>${column.javaFieldName}},'%')
                </if>
            <#elseif column.javaFieldClass.simpleName == "Date">
                <if test="qo.${column.javaFieldName}StartTime != null">
                    and ${column.columnName} <#noparse>< #{qo.</#noparse>${column.javaFieldName}StartTime}
                </if>
                <if test="qo.${column.javaFieldName}EndTime != null">
                    and <#noparse>#{</#noparse>qo.${column.javaFieldName}EndTime} <#noparse><</#noparse> ${column.columnName}
                </if>
            <#else>
                <if test="qo.${column.javaFieldName} != null">
                    and ${column.columnName} = <#noparse>#{qo.</#noparse>${column.javaFieldName}}
                </if>
            </#if>
            </#list>
            </if>
        </where>
    </select>
</mapper>