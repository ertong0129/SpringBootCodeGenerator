package ${packageName}.domain.dto.mq;

<#if isAutoImport?exists && isAutoImport==true>
import lombok.Data;
import ${packageName}.mq.BaseMQDTO;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Data
public class ${classInfo.className}MQDTO extends BaseMQDTO {

}