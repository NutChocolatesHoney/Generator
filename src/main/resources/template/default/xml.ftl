<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${configs.mapperPackage}.${data.className}${configs.mapperSuffix}">
    <resultMap id="resultMap" type="${configs.entityPackage}.${data.className}${configs.entitySuffix}">
        <#list data.allFieldDefinitions as fieldDefinition>
            <#if fieldDefinition.isPk>
                <id column="${fieldDefinition.columnName}" property="${fieldDefinition.javaFieldName}"
                    jdbcType="${fieldDefinition.dbTypeName}"/>
            <#else>
                <result column="${fieldDefinition.columnName}" property="${fieldDefinition.javaFieldName}"
                        jdbcType="${fieldDefinition.dbTypeName}"/>
            </#if>
        </#list>
    </resultMap>
    <sql id="column_List">
        <!--@sql select -->
        <#list data.allFieldDefinitions as fieldDefinition>${fieldDefinition.columnName}<#if fieldDefinition_has_next>, </#if></#list>
        <!--@sql from ${data.tableName}-->
    </sql>

    <sql id="Example_Where_Clause">
        <trim prefix="where" prefixOverrides="and|or">
            <#list data.allFieldDefinitions as fieldDefinition>
                <#if !fieldDefinition.isPk>
                    <if test="entity.${fieldDefinition.javaFieldName}!=null">
                        and ${fieldDefinition.columnName}=${'#'}{entity.${fieldDefinition.javaFieldName}}
                    </if>
                </#if>
            </#list>
        </trim>
    </sql>

</mapper>
