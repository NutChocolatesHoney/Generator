package ${createInfo.modulePath}.${createInfo.packageName};

import ${common.modulePath}.dao.${data.className}Mapper;
import ${common.modulePath}.po.${data.className};
import ${common.modulePath}.service.${data.className}Service;
import ${common.modulePath}.qo.${data.className}QO;
import com.github.pagehelper.PageInfo;
import com.ceair.gsm.common.page.PageDTO;
import com.github.pagehelper.PageHelper;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
* ${data.tableRemark}(${data.tableName})服务实现类
*
* @author ${common.username}
* @since ${common.now}
*/
@Service("${data.objectName}Service")
@Transactional(rollbackFor = Exception.class)
public class ${data.className}ServiceImpl implements ${data.className}Service {

    @Resource private ${data.className}Mapper ${data.objectName}Mapper;

    /**
    * 通过ID查询单条数据
    *
    * @param id 主键
    * @return 实例对象
    */
    @Override
    public ${data.className} queryById(Long id) {
    return ${data.objectName}Mapper.selectByPrimaryKey(id);
    }
    
    /**
    * 新增数据
    *
    * @param ${data.objectName} 实例对象
    * @return 实例对象
    */
    @Override
    public ${data.className} insert(${data.className} ${data.objectName}) {
    ${data.objectName}Mapper.insert(${data.objectName});
    return ${data.objectName};
    }
    
    /**
    * 修改数据
    *
    * @param ${data.objectName} 实例对象
    * @return 实例对象
    */
    @Override
    public ${data.className} update(${data.className} ${data.objectName}) {
    ${data.objectName}Mapper.update(${data.objectName});
    return queryById(${data.objectName}.getId());
    }
    
    /**
    * 通过主键删除数据
    *
    * @param id 主键
    * @return 是否成功
    */
    @Override
    public boolean deleteById(Long id) {
    return ${data.objectName}Mapper.deleteByPrimaryKey(id) > 0;
    }

    /**
    * 分页
    *
    * @param ${data.objectName}QO 查询对象
    * @return 实例对象分页
    */
    @Override
    public PageInfo<${data.className}> page(${data.className}QO ${data.objectName}QO, PageDTO page) {
        return null;
    }

    /**
    * 列表
    *
    * @param ${data.objectName}QO 查询对象
    * @return 实例对象列表
    */
    @Override
    public List<${data.className}> list(${data.className}QO ${data.objectName}QO) {
        return null;
    }

}
