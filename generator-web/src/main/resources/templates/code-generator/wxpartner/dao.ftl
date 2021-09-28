package ${packageName}.core.dao;

import ${packageName}.core.dao.po.${classInfo.className}PO;
import ${packageName}.core.dao.query.${classInfo.className}Query;

/**
* @description ${classInfo.classComment}
* @author ${authorName}
* @date ${.now?string('yyyy-MM-dd')}
*/
public interface ${classInfo.className}DAO extends BaseInterfaceDao<${classInfo.className}PO, ${classInfo.className}Query> {

}
