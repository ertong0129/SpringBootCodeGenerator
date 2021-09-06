package ${packageName}.controller;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.service.${classInfo.className}Service;

import org.springframework.web.bind.annotation.*;
import javax.annotation.Resource;
import com.aifocus.base.common.result.Result;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@RestController
@RequestMapping(value = "/workWx")
public class ${classInfo.className}Controller extends BaseController {

    @Resource
    private ${classInfo.className}Service ${classInfo.lcHeadClassName}Service;

}