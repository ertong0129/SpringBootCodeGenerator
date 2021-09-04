package ${packageName}.service.impl;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.domain.dto.${classInfo.className}DTO;
import ${packageName}.domain.query.${classInfo.className}Query;
import ${packageName}.manager.${classInfo.className}Manager;
import ${packageName}.service.${classInfo.className}Service;

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