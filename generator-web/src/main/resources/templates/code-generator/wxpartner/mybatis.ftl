<?xml version="1.0" encoding="UTF-8" ?>
<!DOCTYPE mapper PUBLIC "-//mybatis.org//DTD Mapper 3.0//EN" "http://mybatis.org/dtd/mybatis-3-mapper.dtd" >
<mapper namespace="${packageName}.core.dao.${classInfo.className}DAO">

    <resultMap id="BaseResultMap" type="${packageName}.core.dao.po.${classInfo.className}PO" >
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
        <if test="${fieldItem.fieldName} != null">
            AND ${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName},jdbcType=${fieldItem.jdbcType}${r"}"}
        ${r"</if>"}
            </#list>
        </#if>
    </sql>

    <delete id="deleteByPrimaryKey" >
        DELETE FROM ${classInfo.tableName}
        WHERE id = ${r"#{id,jdbcType=BIGINT}"}
    </delete>

    <insert id="insertSelective" keyColumn="id" keyProperty="id" parameterType="${packageName}.core.dao.po.${classInfo.className}PO" useGeneratedKeys="true">
        INSERT INTO ${classInfo.tableName}
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

    <update id="updateByPrimaryKeySelective" parameterType="${packageName}.core.dao.po.${classInfo.className}PO">
        UPDATE ${classInfo.tableName}
        <set>
            <#list classInfo.fieldList as fieldItem >
                <#if fieldItem.columnName != "id">
            <if test="${fieldItem.fieldName} != null">
                ${fieldItem.columnName} = ${r"#{"}${fieldItem.fieldName},jdbcType=${fieldItem.jdbcType}${r"}"}<#if fieldItem_has_next>,</#if>
            ${r"</if>"}
                </#if>
            </#list>
        </set>
        WHERE id = ${r"#{id,jdbcType=BIGINT}"}
    </update>

    <select id="selectByPrimaryKey" resultMap="BaseResultMap" parameterType="java.lang.Long" >
        SELECT
        <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
        WHERE id = ${r"#{id,jdbcType=BIGINT}"}
    </select>

    <select id="queryList" parameterType="${packageName}.core.dao.query.${classInfo.className}Query" resultMap="BaseResultMap">
        SELECT <include refid="Base_Column_List" />
        FROM ${classInfo.tableName}
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

    <select id="queryCount" parameterType="${packageName}.core.dao.po.${classInfo.className}Query" resultType="java.lang.Integer">
        SELECT COUNT(1)
        FROM ${classInfo.tableName}
        <where>
            <include refid="Base_Sql"/>
        </where>
    </select>

</mapper>