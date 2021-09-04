package ${packageName}.manager;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.domain.dto.${classInfo.className}DTO;
import ${packageName}.domain.query.${classInfo.className}Query;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}Manager extends BaseInterfaceManager<${classInfo.className}DTO, ${classInfo.className}Query> {

}
