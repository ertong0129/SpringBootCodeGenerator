package com.softdev.system.generator.entity;

import lombok.Data;

/**
 * field info
 *
 * @author xuxueli 2018-05-02 20:11:05
 */
@Data
public class FieldInfo {

    private String columnName;
    private String fieldName;
    private String ucHeadFieldName;
    private String fieldClass;
    private String swaggerClass;
    private String fieldComment;
    //暂时只考虑，BIGINT、TINYINT、INTEGER、VARCHAR、TIMESTAMP
    private String jdbcType;

    public void setFieldName(String fieldName) {
        this.fieldName = fieldName;
        this.ucHeadFieldName = (new StringBuilder())
                .append(Character.toUpperCase(fieldName.charAt(0)))
                .append(fieldName.substring(1))
                .toString();
    }

}
