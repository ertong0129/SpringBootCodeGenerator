package ${packageName}.convert;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.domain.dto.${classInfo.className}DTO;
import ${packageName}.dao.DO.${classInfo.className}DO;

import java.util.ArrayList;
import java.util.List;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public class ${classInfo.className}Convert {

    public static ${classInfo.className}DTO do2dto(${classInfo.className}DO item) {
        if (item == null) {
            return null;
        }

        ${classInfo.className}DTO ${classInfo.lcHeadClassName}DTO = new ${classInfo.className}DTO();
        <#list classInfo.fieldList as fieldItem >
        ${classInfo.lcHeadClassName}DTO.set${fieldItem.ucHeadFieldName}(item.get${fieldItem.ucHeadFieldName}());
        </#list>

        return ${classInfo.lcHeadClassName}DTO;
    }

    public static List<${classInfo.className}DTO> dos2dtos(List<${classInfo.className}DO> itemList) {
        if (itemList == null) {
            return null;
        }

        List<${classInfo.className}DTO> ${classInfo.lcHeadClassName}DTOList = new ArrayList<${classInfo.className}DTO>(itemList.size());
        for (${classInfo.className}DO ${classInfo.lcHeadClassName}DO : itemList) {
            ${classInfo.lcHeadClassName}DTOList.add(do2dto(${classInfo.lcHeadClassName}DO));
        }

        return ${classInfo.lcHeadClassName}DTOList;
    }

    public static ${classInfo.className}DO dto2do(${classInfo.className}DTO item) {
        if (item == null) {
            return null;
        }

        ${classInfo.className}DO ${classInfo.lcHeadClassName}DO = new ${classInfo.className}DO();
        <#list classInfo.fieldList as fieldItem >
        ${classInfo.lcHeadClassName}DO.set${fieldItem.ucHeadFieldName}(item.get${fieldItem.ucHeadFieldName}());
        </#list>

        return ${classInfo.lcHeadClassName}DO;
    }

    public static List<${classInfo.className}DO> dtos2dos(List<${classInfo.className}DTO> itemList) {
        if (itemList == null) {
            return null;
        }

        List<${classInfo.className}DO> ${classInfo.lcHeadClassName}DOList = new ArrayList<${classInfo.className}DO>(itemList.size());
        for (${classInfo.className}DTO ${classInfo.lcHeadClassName}DTO : itemList) {
            ${classInfo.lcHeadClassName}DOList.add(dto2do(${classInfo.lcHeadClassName}DTO));
        }

        return ${classInfo.lcHeadClassName}DOList;
    }

}