package ${packageName}.core.service;

<#if isAutoImport?exists && isAutoImport==true>
import com.aifocus.base.common.result.Result;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}Service {

}