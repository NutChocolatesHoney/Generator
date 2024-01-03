<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper
        PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN"
        "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="com.shdy.project.worksheet.mapper.${data.className}Mapper">
    <resultMap type="com.shdy.project.worksheet.domain.${data.className}" id="${data.className}Result">
        <#list data.allColumn as column>
        <result property="${column.javaFieldName}"    column="${column.columnName}"    />
        </#list>
    </resultMap>

    <sql id="select${data.className}Vo">
        select
        <#list data.allColumn as column>
        <#if column.javaFieldName != "isActive">
        ${column.columnName},
        </#if>
        </#list>
        is_active from ${data.tableName}
    </sql>

    <select id="select${data.className}List" parameterType="com.shdy.project.worksheet.domain.${data.className}" resultMap="${data.className}Result">
        <include refid="select${data.className}Vo"/>
        <where>
            <#list data.allColumn as column>
                <#if column.javaFieldName != "id">
                    <#if column.javaFieldName != "isActive" && column.dbType != "VARCHAR">
            <if test="${column.javaFieldName} != null  and ${column.javaFieldName} != ''"> and ${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}<#noparse>}</#noparse></if>
                    </#if>
                    <#if column.javaFieldName != "isActive" && column.dbType == "VARCHAR">
            <if test="${column.javaFieldName} != null  and ${column.javaFieldName} != ''"> and ${column.columnName} like concat('%', <#noparse>#{</#noparse>${column.javaFieldName}<#noparse>}</#noparse>, '%')</if>
                    </#if>
                </#if>
            </#list>
            and is_active = 1
        </where>
    </select>

    <select id="select${data.className}ById" parameterType="Long" resultMap="${data.className}Result">
        <include refid="select${data.className}Vo"/>
        where id = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
    </select>

    <insert id="insert${data.className}" parameterType="com.shdy.project.worksheet.domain.${data.className}" useGeneratedKeys="true" keyProperty="id">
        insert into ${data.tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list data.allColumn as column>
                <#if column.javaFieldName != "id" && column.javaFieldName != "updateTime" && column.javaFieldName != "updateBy" && column.javaFieldName != "updateId">
                    <#if column.dbType != "VARCHAR">
            <if test="${column.javaFieldName} != null ">${column.columnName},</if>
                    </#if>
                    <#if column.dbType == "VARCHAR">
            <if test="${column.javaFieldName} != null  and ${column.javaFieldName} != ''">${column.columnName},</if>
                    </#if>
                </#if>
            </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list data.allColumn as column>
                <#if column.javaFieldName != "id" && column.javaFieldName != "updateTime" && column.javaFieldName != "updateBy" && column.javaFieldName != "updateId">
                    <#if column.dbType != "VARCHAR">
            <if test="${column.javaFieldName} != null "><#noparse>#{</#noparse>${column.javaFieldName}<#noparse>}</#noparse>,</if>
                    </#if>
                    <#if column.dbType == "VARCHAR">
            <if test="${column.javaFieldName} != null  and ${column.javaFieldName} != ''"><#noparse>#{</#noparse>${column.javaFieldName}<#noparse>}</#noparse>,</if>
                    </#if>
                </#if>
            </#list>
        </trim>
    </insert>

    <update id="update${data.className}" parameterType="com.shdy.project.worksheet.domain.${data.className}">
        update ${data.tableName}
        <trim prefix="SET" suffixOverrides=",">
            <#list data.allColumn as column>
                <#if column.javaFieldName != "id" && column.javaFieldName != "createTime" && column.javaFieldName != "createBy" && column.javaFieldName != "createId">
                    <#if column.dbType != "VARCHAR">
            <if test="${column.javaFieldName} != null ">${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}<#noparse>}</#noparse>,</if>
                    </#if>
                    <#if column.dbType == "VARCHAR" && column.javaFieldName != "createTime" && column.javaFieldName != "createBy" && column.javaFieldName != "createId">
            <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}<#noparse>}</#noparse>,</if>
                    </#if>
                </#if>
            </#list>
        </trim>
        where id = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
    </update>

    <update id="delete${data.className}ById" parameterType="Long">
        UPDATE ${data.tableName} SET is_active = 0 where id = <#noparse>#{</#noparse>id<#noparse>}</#noparse>
    </update>

    <update id="delete${data.className}ByIds" parameterType="String">
        UPDATE ${data.tableName} SET is_active = 0 where id in
        <foreach item="id" collection="array" open="(" separator="," close=")">
            <#noparse>#{</#noparse>id<#noparse>}</#noparse>
        </foreach>
    </update>

</mapper>