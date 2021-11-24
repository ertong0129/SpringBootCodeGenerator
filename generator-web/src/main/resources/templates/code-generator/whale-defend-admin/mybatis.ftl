<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="com.webuy.whale.defend.admin.dao.mapper.${classInfo.className}Mapper">

    <resultMap id="BaseResultMap" type="com.webuy.whale.defend.admin.entity.${classInfo.className}PO" >
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName == "id" >
        <id column="${fieldItem.columnName}" property="${fieldItem.fieldName}" jdbcType="${fieldItem.jdbcType}" />
                <#else>
        <result column="${fieldItem.columnName}" property="${fieldItem.fieldName}" jdbcType="${fieldItem.jdbcType}" />
                </#if>
            </#list>
        </#if>
    </resultMap>

    <sql id="Base_Column_List">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
        <#list classInfo.fieldList as fieldItem >${fieldItem.columnName}<#if fieldItem_has_next>, </#if></#list>
        </#if>
    </sql>

    <sql id="Base_Sql">
        <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
            <#list classInfo.fieldList as fieldItem >
                <#switch fieldItem.fieldName>
                    <#case "isDelete">
        <if test="isDelete != null">
            AND is_delete = ${r"#{"}${fieldItem.fieldName},jdbcType=${fieldItem.jdbcType}${r"}"}
        ${r"</if>"}
        <if test="isDelete == null">
            AND is_delete = 0
        ${r"</if>"}
                        <#break>
                    <#case "attributeCc">
                    <#case "attributes">
                    <#case "gmtCreate">
                    <#case "gmtModify">
                        <#break>
                    <#default>
        <if test="${fieldItem.fieldName} != null">
            AND ${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName},jdbcType=${fieldItem.jdbcType}${r"}"}
        ${r"</if>"}
                </#switch>
            </#list>
        </#if>
    </sql>

    <delete id="deleteByPrimaryKey" >
        UPDATE ${classInfo.originTableName} SET is_delete = 1
        WHERE id = ${r"#{id,jdbcType=BIGINT}"}
    </delete>

    <insert id="insertSelective" keyColumn="id" keyProperty="id" parameterType="com.webuy.whale.defend.admin.entity.${classInfo.className}PO" useGeneratedKeys="true">
        INSERT INTO ${classInfo.originTableName}
        <trim prefix="(" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <#if fieldItem.columnName != "id" >
            <if test="${fieldItem.fieldName} != null">
                ${fieldItem.columnName}<#if fieldItem_has_next>,</#if>
            ${r"</if>"}
                    </#if>
                </#list>
            </#if>
        </trim>
        <trim prefix="values (" suffix=")" suffixOverrides=",">
            <#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
                <#list classInfo.fieldList as fieldItem >
                    <#if fieldItem.columnName != "id" >
            <if test="${fieldItem.fieldName} != null">
                ${r"#{"}${fieldItem.fieldName},jdbcType=${fieldItem.jdbcType}${r"}"}<#if fieldItem_has_next>,</#if>
            ${r"</if>"}
                    </#if>
                </#list>
            </#if>
        </trim>
    </insert>

    <update id="updateByPrimaryKeySelective" parameterType="com.webuy.whale.defend.admin.entity.${classInfo.className}PO">
        UPDATE ${classInfo.originTableName}
        <set>
            <#list classInfo.fieldList as fieldItem >
                <#switch fieldItem.fieldName>
                    <#case "id">
                    <#case "gmtCreate">
                    <#case "gmtModify">
                        <#break>
                    <#default>
            <if test="${fieldItem.fieldName} != null">
                ${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName},jdbcType=${fieldItem.jdbcType}${r"}"}<#if fieldItem_has_next>,</#if>
            ${r"</if>"}
                </#switch>
            </#list>
        </set>
        WHERE id = ${r"#{id,jdbcType=BIGINT}"}
    </update>

    <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.Long" >
        SELECT
        <include refid="Base_Column_List" />
        FROM ${classInfo.originTableName}
        WHERE id = ${r"#{id,jdbcType=BIGINT}"}
    </select>

    <select id="queryList" parameterType="com.webuy.whale.defend.admin.query.${classInfo.className}Query" resultMap="BaseResultMap">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.originTableName}
        <where>
            <include refid="Base_Sql"/>
        </where>
        <if test="orderBySql != null">
            ORDER BY ${r"${orderBySql}"}
        </if>
        <if test="offset != null and pageSize != null">
            LIMIT ${r"#{offset},#{pageSize}"}
        </if>
        <if test="offset == null or pageSize == null">
            LIMIT 200
        </if>
    </select>

    <select id="queryCount" parameterType="com.webuy.whale.defend.admin.query.${classInfo.className}Query" resultType="java.lang.Integer">
        SELECT COUNT(1)
        FROM ${classInfo.originTableName}
        <where>
            <include refid="Base_Sql"/>
        </where>
    </select>

</mapper>