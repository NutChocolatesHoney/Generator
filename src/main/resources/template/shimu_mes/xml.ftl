<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd">
<mapper namespace="${common.modulePath}.dao.${data.className}Mapper">
    <resultMap id="BaseResultMap" type="${common.modulePath}.entity.${data.className}">
        <!--@Table ${data.tableName}-->
        <#list data.allColumn as column>
        <result column="${column.columnName}" jdbcType="VARCHAR" property="${column.javaFieldName}"/>
        </#list>
    </resultMap>

    <sql id="Base_Column_List">
        <#list data.allColumn as column>
            <#if item?is_last>
                ${column.columnName},
            </#if>

        holiday,
        creator,
        creator_name,
        create_time,
        modifier,
        modifier_name,
        </#list>
    </sql>


    <!--查询单个-->
    <select id="selectByPrimaryKey" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${data.tableName}
        where id = #{id,jdbcType=INTEGER}
    </select>

    <!--通过主键删除-->
    <delete id="deleteByPrimaryKey">
        delete
        from ${data.tableName}
        where id = #{id,jdbcType=INTEGER}
    </delete>


    <!--新增所有列-->
    <insert id="insert" keyProperty="id" useGeneratedKeys="true">
        insert into ${data.tableName}(duty_date, holiday, creator, creator_name, create_time, modifier, modifier_name,
        modify_time)
        values (#{dutyDate}, #{holiday}, #{creator}, #{creatorName}, #{createTime}, #{modifier}, #{modifierName},
        #{modifyTime})
    </insert>


    <insert id="insertSelective" keyProperty="id" useGeneratedKeys="true">
        insert into ${data.tableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <if test="dutyDate != null">
                duty_date,
            </if>
            <if test="holiday != null">
                holiday,
            </if>
            <if test="creator != null">
                creator,
            </if>
            <if test="creatorName != null and creatorName != ''">
                creator_name,
            </if>
            <if test="createTime != null">
                create_time,
            </if>
            <if test="modifier != null">
                modifier,
            </if>
            <if test="modifierName != null and modifierName != ''">
                modifier_name,
            </if>
            <if test="modifyTime != null">
                modify_time,
            </if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <if test="dutyDate != null">
                #{dutyDate},
            </if>
            <if test="holiday != null">
                #{holiday},
            </if>
            <if test="creator != null">
                #{creator},
            </if>
            <if test="creatorName != null and creatorName != ''">
                #{creatorName},
            </if>
            <if test="createTime != null">
                #{createTime},
            </if>
            <if test="modifier != null">
                #{modifier},
            </if>
            <if test="modifierName != null and modifierName != ''">
                #{modifierName},
            </if>
            <if test="modifyTime != null">
                #{modifyTime},
            </if>
        </trim>
    </insert>


    <!--通过主键修改数据-->
    <update id="update">
        update ${data.tableName}
        <set>
            <if test="dutyDate != null">
                duty_date = #{dutyDate},
            </if>
            <if test="holiday != null">
                holiday = #{holiday},
            </if>
            <if test="creator != null">
                creator = #{creator},
            </if>
            <if test="creatorName != null and creatorName != ''">
                creator_name = #{creatorName},
            </if>
            <if test="createTime != null">
                create_time = #{createTime},
            </if>
            <if test="modifier != null">
                modifier = #{modifier},
            </if>
            <if test="modifierName != null and modifierName != ''">
                modifier_name = #{modifierName},
            </if>
            <if test="modifyTime != null">
                modify_time = #{modifyTime},
            </if>
        </set>
        where id = #{id}
    </update>


    <!--通过实体作为筛选条件查询-->
    <select id="queryAll" resultMap="BaseResultMap">
        select id,
        duty_date,
        holiday,
        creator,
        creator_name,
        create_time,
        modifier,
        modifier_name,
        modify_time
        from gsm.${data.tableName}
    </select>
    <!--统计总行数-->
    <select id="count" resultType="java.lang.Long">
        select count(1)
        from ${data.tableName}
        <where>
            <if test="id != null">
                and id = #{id}
            </if>
            <if test="dutyDate != null">
                and duty_date = #{dutyDate}
            </if>
            <if test="holiday != null">
                and holiday = #{holiday}
            </if>
            <if test="creator != null">
                and creator = #{creator}
            </if>
            <if test="creatorName != null and creatorName != ''">
                and creator_name = #{creatorName}
            </if>
            <if test="createTime != null">
                and create_time = #{createTime}
            </if>
            <if test="modifier != null">
                and modifier = #{modifier}
            </if>
            <if test="modifierName != null and modifierName != ''">
                and modifier_name = #{modifierName}
            </if>
            <if test="modifyTime != null">
                and modify_time = #{modifyTime}
            </if>
        </where>
    </select>


    <insert id="insertBatch">
        insert into ${data.tableName}(duty_date, holiday, creator, creator_name, create_time, modifier, modifier_name,
        modify_time)
        values
        <foreach collection="entities" item="entity" separator=",">
            (#{entity.dutyDate}, #{entity.holiday}, #{entity.creator}, #{entity.creatorName}, #{entity.createTime},
            #{entity.modifier}, #{entity.modifierName}, #{entity.modifyTime})
        </foreach>
    </insert>

    <insert id="insertOrUpdateBatch" keyProperty="id" useGeneratedKeys="true">
        insert into ${data.tableName}(duty_date, holiday, creator, creator_name, create_time, modifier, modifier_name,
        modify_time)
        values
        <foreach collection="entities" item="entity" separator=",">
            (#{entity.dutyDate}, #{entity.holiday}, #{entity.creator}, #{entity.creatorName}, #{entity.createTime},
            #{entity.modifier}, #{entity.modifierName}, #{entity.modifyTime})
        </foreach>
        on duplicate key update duty_date = values(duty_date),
        holiday = values(holiday),
        creator = values(creator),
        creator_name = values(creator_name),
        create_time = values(create_time),
        modifier = values(modifier),
        modifier_name = values(modifier_name),
        modify_time = values(modify_time)
    </insert>

    <select id="queryByTimeScope" resultMap="BaseResultMap">
        select
        <include refid="Base_Column_List"/>
        from ${data.tableName}
        where duty_date > #{startTime}
        and #{endTime} > duty_date
    </select>

    <delete id="delByTimeScope">
        delete
        from ${data.tableName}
        where duty_date > #{startTime}
        and #{endTime} > duty_date
    </delete>
</mapper>

