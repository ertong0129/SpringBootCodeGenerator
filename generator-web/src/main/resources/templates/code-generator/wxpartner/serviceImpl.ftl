package ${packageName}.core.service.impl;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.core.dao.query.${classInfo.className}Query;
import ${packageName}.core.manager.${classInfo.className}Manager;
import ${packageName}.core.service.${classInfo.className}Service;

import com.aifocus.base.common.result.ErrorEnum;
import com.aifocus.base.common.result.Result;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Service
public class ${classInfo.className}ServiceImpl implements ${classInfo.className}Service {

    @Resource
    private ${classInfo.className}Manager ${classInfo.lcHeadClassName}Manager;

}