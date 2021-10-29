package com.webuy.whale.defend.admin.manager;

<#if isAutoImport?exists && isAutoImport==true>
import com.webuy.whale.defend.admin.query.${classInfo.className}Query;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}Manager extends BaseInterfaceManager<${classInfo.className}DTO, ${classInfo.className}Query> {

}
