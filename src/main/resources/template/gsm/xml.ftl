<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${common.modulePath}.dao.${data.className}Mapper">
    <resultMap id="BaseResultMap" type="${common.modulePath}.po.${data.className}">
        <!--@Table ${data.tableName}-->
        <#list data.allColumn as column>
        <result column="${column.columnName}" jdbcType="VARCHAR" property="${column.javaFieldName}"/>
        </#list>
    </resultMap>

    <sql id="Base_Column_List">
        <#list data.allColumn as column>
            <#if column?is_last>
            ${column.columnName}
            <#else>
            ${column.columnName},
            </#if>
        </#list>
    </sql>

    <!--查询单个-->
    <select id="selectByPrimaryKey" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${data.tableName}
        <#noparse>
        where id = #{id,jdbcType=INTEGER}
        </#noparse>
        <#if data.isLogicalDel>
        and active = true
        </#if>
    </select>

    <!--通过主键删除-->
    <delete id="deleteByPrimaryKey">
        <#if data.isLogicalDel>
        update ${data.tableName} set active = false
        <#else >
        delete
        from ${data.tableName}
        </#if>
        <#noparse>
        where id = #{id,jdbcType=INTEGER}
        </#noparse>
    </delete>


    <!--新增-->
    <insert id="insert" keyProperty="id" useGeneratedKeys="true">
        insert into ${data.tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#list data.allColumn as column>
            <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
            <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">
            <#else>
            <if test="${column.javaFieldName} != null">
            </#if>
                ${column.columnName},
            </if>
            </#list>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#list data.allColumn as column>
            <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
            <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">
            <#else>
            <if test="${column.javaFieldName} != null">
            </#if>
            <#noparse>#{</#noparse>${column.javaFieldName}},
            </if>
            </#list>
        </trim>
    </insert>


    <!--通过主键修改数据-->
    <update id="update">
        update ${data.tableName}
        <set>
            <#list data.allColumn as column>
            <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
            <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">
            <#else>
            <if test="${column.javaFieldName} != null">
            </#if>
                ${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}},
            </if>
            </#list>
        </set>
        where id = <#noparse>#{id}</#noparse>
    </update>

    <!--统计总行数-->
    <select id="count" resultType="java.lang.Long">
        select count(1)
        from ${data.tableName}
        <where>
            <#list data.allColumn as column>
            <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
            <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">
                and ${column.columnName} like concat('%',<#noparse>#{</#noparse>${column.javaFieldName}},'%')
            <#else>
            <if test="${column.javaFieldName} != null">
                and ${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}}
            </#if>
            </if>
            </#list>
        </where>
        <#if data.isLogicalDel>
                and active = true
        </#if>
    </select>

    <insert id="insertBatch">
        insert into tf_duty_holiday(
        <include refid="Base_Column_List"/>
        )
        values
        <foreach collection="entities" item="po" separator=",">
            (
            <#list data.allColumn as column>
            <#if column?is_last>
                <#noparse>#{</#noparse>po.${column.javaFieldName}}
            <#else>
                <#noparse>#{</#noparse>po.${column.javaFieldName}},
            </#if>
            </#list>
            )
        </foreach>
    </insert>

    <select id="findByAll" resultType="${common.modulePath}.po.${data.className}">
        select
        <include refid="Base_Column_List"/>
        from ${data.tableName}
        <where>
            <#list data.allColumn as column>
            <#if column.javaFieldClass.simpleName == "String" && !column.isEnum>
            <if test="${column.javaFieldName} != null and ${column.javaFieldName} != ''">
                and ${column.columnName} like concat('%',<#noparse>#{</#noparse>${column.javaFieldName}},'%')
            </if>
            <#else>
            <if test="${column.javaFieldName} != null">
                and ${column.columnName} = <#noparse>#{</#noparse>${column.javaFieldName}}
            </if>
            </#if>
            </#list>
        </where>
        <#if data.isLogicalDel>
                and active = true
        </#if>
    </select>
</mapper>

