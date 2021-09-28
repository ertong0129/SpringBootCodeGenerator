package ${packageName}.core.manager;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.core.dao.query.${classInfo.className}Query;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}Manager extends BaseInterfaceManager<${classInfo.className}DTO, ${classInfo.className}Query> {

}
