package com.webuy.whale.defend.admin.manager.impl;

<#if isAutoImport?exists && isAutoImport==true>
import com.webuy.whale.defend.admin.query.${classInfo.className}Query;
import com.webuy.whale.defend.admin.dao.mapper.${classInfo.className}Mapper;
import com.webuy.whale.defend.admin.entity.${classInfo.className}PO;
import com.webuy.whale.defend.admin.convert.${classInfo.className}Convert;
import com.webuy.whale.defend.admin.manager.${classInfo.className}Manager;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
import com.webuy.whale.defend.admin.common.exception.ErrorEnum;
import com.webuy.whale.defend.admin.common.exception.WdAdminException;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Service
public class ${classInfo.className}ManagerImpl implements ${classInfo.className}Manager {

    @Resource
    private ${classInfo.className}Mapper ${classInfo.lcHeadClassName}Mapper;

    @Override
    public int deleteByPrimaryKey(Long id) {
        if (id == null) {
            throw new WdAdminException(ErrorEnum.PARAMS_ERROR);
        }
        return ${classInfo.lcHeadClassName}Mapper.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(${classInfo.className}DTO record) {
        ${classInfo.className}PO ${classInfo.lcHeadClassName}PO = ${classInfo.className}Convert.dto2do(record);
        int n =  ${classInfo.lcHeadClassName}Mapper.insertSelective(${classInfo.lcHeadClassName}PO);
        record.setId(${classInfo.lcHeadClassName}PO.getId());
        return n;
    }

    @Override
    public ${classInfo.className}DTO selectByPrimaryKey(Long id) {
        if (id == null) {
            throw new WdAdminException(ErrorEnum.PARAMS_ERROR);
        }
        return ${classInfo.className}Convert.do2dto(${classInfo.lcHeadClassName}Mapper.selectByPrimaryKey(id));
    }

    @Override
    public int updateByPrimaryKeySelective(${classInfo.className}DTO record) {
        if (record.getId() == null) {
            throw new WdAdminException(ErrorEnum.PARAMS_ERROR);
        }
        return ${classInfo.lcHeadClassName}Mapper.updateByPrimaryKeySelective(${classInfo.className}Convert.dto2do(record));
    }

    @Override
    public int queryCount(${classInfo.className}Query query) {
        return ${classInfo.lcHeadClassName}Mapper.queryCount(query);
    }

    @Override
    public List<${classInfo.className}DTO> queryList(${classInfo.className}Query query) {
        return ${classInfo.className}Convert.dos2dtos(${classInfo.lcHeadClassName}Mapper.queryList(query));
    }

}