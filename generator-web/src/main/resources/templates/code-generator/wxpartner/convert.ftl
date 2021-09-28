package ${packageName}.core.dao.convert;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.core.dao.po.${classInfo.className}PO;

import java.util.ArrayList;
import java.util.List;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public class ${classInfo.className}Convert {

    public static ${classInfo.className}DTO do2dto(${classInfo.className}PO item) {
        if (item == null) {
            return null;
        }

        ${classInfo.className}DTO ${classInfo.lcHeadClassName}DTO = new ${classInfo.className}DTO();
        <#list classInfo.fieldList as fieldItem >
        ${classInfo.lcHeadClassName}DTO.set${fieldItem.ucHeadFieldName}(item.get${fieldItem.ucHeadFieldName}());
        </#list>

        return ${classInfo.lcHeadClassName}DTO;
    }

    public static List<${classInfo.className}DTO> dos2dtos(List<${classInfo.className}PO> itemList) {
        if (itemList == null) {
            return null;
        }

        List<${classInfo.className}DTO> ${classInfo.lcHeadClassName}DTOList = new ArrayList<${classInfo.className}DTO>(itemList.size());
        for (${classInfo.className}PO ${classInfo.lcHeadClassName}PO : itemList) {
            ${classInfo.lcHeadClassName}DTOList.add(do2dto(${classInfo.lcHeadClassName}PO));
        }

        return ${classInfo.lcHeadClassName}DTOList;
    }

    public static ${classInfo.className}PO dto2do(${classInfo.className}DTO item) {
        if (item == null) {
            return null;
        }

        ${classInfo.className}PO ${classInfo.lcHeadClassName}PO = new ${classInfo.className}PO();
        <#list classInfo.fieldList as fieldItem >
        ${classInfo.lcHeadClassName}PO.set${fieldItem.ucHeadFieldName}(item.get${fieldItem.ucHeadFieldName}());
        </#list>

        return ${classInfo.lcHeadClassName}PO;
    }

    public static List<${classInfo.className}PO> dtos2dos(List<${classInfo.className}DTO> itemList) {
        if (itemList == null) {
            return null;
        }

        List<${classInfo.className}PO> ${classInfo.lcHeadClassName}POList = new ArrayList<${classInfo.className}PO>(itemList.size());
        for (${classInfo.className}DTO ${classInfo.lcHeadClassName}DTO : itemList) {
            ${classInfo.lcHeadClassName}POList.add(dto2do(${classInfo.lcHeadClassName}DTO));
        }

        return ${classInfo.lcHeadClassName}POList;
    }

}