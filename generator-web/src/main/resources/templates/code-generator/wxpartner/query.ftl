package ${packageName}.core.dao.query;

<#if isAutoImport?exists && isAutoImport==true>
import lombok.Data;
import java.util.Date;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Data
public class ${classInfo.className}Query extends BaseQuery {

<#if classInfo.fieldList?exists && classInfo.fieldList?size gt 0>
    <#list classInfo.fieldList as fieldItem >
        <#switch fieldItem.fieldName>
            <#case "gmtCreate">
            <#case "gmtModify">
            <#case "attributeCc">
            <#case "attributes">
                <#break>
            <#default>
        <#if isComment?exists && isComment==true>/**
        * ${fieldItem.fieldComment}
        */</#if>
        private ${fieldItem.fieldClass} ${fieldItem.fieldName};

        </#switch>
    </#list>
</#if>

}
