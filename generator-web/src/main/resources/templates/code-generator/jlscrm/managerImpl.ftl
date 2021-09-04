package ${packageName}.manager.impl;

<#if isAutoImport?exists && isAutoImport==true>
import ${packageName}.domain.dto.${classInfo.className}DTO;
import ${packageName}.domain.query.${classInfo.className}Query;
import ${packageName}.dao.${classInfo.className}DAO;
import ${packageName}.dao.DO.${classInfo.className}DO;
import ${packageName}.convert.${classInfo.className}Convert;
import ${packageName}.manager.${classInfo.className}Manager;

import com.aifocus.base.common.result.ErrorEnum;
import com.webuy.jlscrm.common.exception.JlscrmException;
import org.springframework.stereotype.Service;
import javax.annotation.Resource;
import java.util.List;
</#if>

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
@Service
public class ${classInfo.className}ManagerImpl implements ${classInfo.className}Manager {

    @Resource
    private ${classInfo.className}DAO ${classInfo.lcHeadClassName}DAO;

    @Override
    public int deleteByPrimaryKey(Long id) {
        if (id == null) {
            throw new JlscrmException(ErrorEnum.PARAMS_ERROR);
        }
        return ${classInfo.lcHeadClassName}DAO.deleteByPrimaryKey(id);
    }

    @Override
    public int insertSelective(${classInfo.className}DTO record) {
        return ${classInfo.lcHeadClassName}DAO.insertSelective(${classInfo.className}Convert.dto2do(record));
    }

    @Override
    public ${classInfo.className}DTO selectByPrimaryKey(Long id) {
        if (id == null) {
            throw new JlscrmException(ErrorEnum.PARAMS_ERROR);
        }
        return ${classInfo.className}Convert.do2dto(${classInfo.lcHeadClassName}DAO.selectByPrimaryKey(id));
    }

    @Override
    public int updateByPrimaryKeySelective(${classInfo.className}DTO record) {
        if (record.getId() == null) {
            throw new JlscrmException(ErrorEnum.PARAMS_ERROR);
        }
        return ${classInfo.lcHeadClassName}DAO.updateByPrimaryKeySelective(${classInfo.className}Convert.dto2do(record));
    }

    @Override
    public int queryCount(${classInfo.className}Query query) {
        return ${classInfo.lcHeadClassName}DAO.queryCount(query);
    }

    @Override
    public List<${classInfo.className}DTO> queryList(${classInfo.className}Query query) {
        return ${classInfo.className}Convert.dos2dtos(${classInfo.lcHeadClassName}DAO.queryList(query));
    }

}