package com.softdev.system.generator.entity;

import lombok.Data;

import java.util.List;

/**
 * class info
 *
 * @author xuxueli 2018-05-02 20:02:34
 */
@Data
public class ClassInfo {

    private String tableName;
    private String originTableName;
    private String className;
    private String lcHeadClassName;
    private String classComment;
    private List<FieldInfo> fieldList;

    public void setClassName(String className) {
        this.className = className;
        this.lcHeadClassName = (new StringBuilder())
                .append(Character.toLowerCase(className.charAt(0)))
                .append(className.substring(1))
                .toString();
    }

}
