package ${packageName}.core.dao.po;

<#if isAutoImport?exists && isAutoImport==true>
import java.util.Date;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public class ${classInfo.className}PO {

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <#if isComment?exists && isComment==true>/**
        * ${fieldItem.fieldComment}
        */</#if>
        private ${fieldItem.fieldClass} ${fieldItem.fieldName};

    </#list>
</#if>

}