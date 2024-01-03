package ${common.modulePath}.${createInfo.packageName};

import ${common.modulePath}.qo.${data.className}QO;
import ${common.modulePath}.po.${data.className};
import com.github.pagehelper.PageInfo;
import com.ceair.gsm.common.page.PageDTO;

import java.util.List;

/**
* ${data.tableRemark}(${data.tableName})服务接口
*
* @author ${common.username}
* @since ${common.now}
*/
public interface ${data.className}Service {

    /**
    * 通过ID查询单条数据
    *
    * @param id 主键
    * @return 实例对象
    */
    ${data.className} queryById(Long id);

    /**
    * 新增数据
    *
    * @param ${data.objectName} 实例对象
    * @return 实例对象
    */
    ${data.className} insert(${data.className} ${data.objectName});

    /**
    * 修改数据
    *
    * @param ${data.objectName} 实例对象
    * @return 实例对象
    */
    ${data.className} update(${data.className} ${data.objectName});

    /**
    * 通过主键删除数据
    *
    * @param id 主键
    * @return 是否成功
    */
    boolean deleteById(Long id);

    /**
    * 分页
    *
    * @param ${data.objectName}QO 查询对象
    * @return 实例对象分页
    */
    PageInfo<${data.className}> page(${data.className}QO ${data.objectName}QO, PageDTO page);

    /**
    * 列表
    *
    * @param ${data.objectName}QO 查询对象
    * @return 实例对象列表
    */
    List<${data.className}> list(${data.className}QO ${data.objectName}QO);
}
