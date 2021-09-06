package ${packageName}.req;

<#if isAutoImport?exists && isAutoImport==true>
import lombok.Data;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Data
public class ${classInfo.className}Req extends BaseMQDTO {

}