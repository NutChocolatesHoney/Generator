package ${common.modulePath}.${createInfo.packageName};

<#if common.autoFill>
import com.ceair.gsm.common.annotation.AutoFill;
import com.ceair.gsm.common.enums.FillTypeEnum;
</#if>
import ${common.modulePath}.po.${data.className};
import ${common.modulePath}.qo.${data.className}QO;
import java.util.List;
import org.apache.ibatis.annotations.Param;

/**
* ${data.tableRemark}(${data.tableName})数据库访问层
*
* @author ${common.username}
* @since ${common.now}
*/
public interface ${data.className}Mapper {

    /**
    * 通过ID查询单条数据
    *
    * @param id 主键
    * @return 实例对象
    */
    ${data.className} selectByPrimaryKey(Long id);

    /**
    * 统计总行数
    *
    * @param ${data.objectName} 查询条件
    * @return 总行数
    */
    long count(${data.className} ${data.objectName});

    /**
    * 新增数据
    *
    * @param ${data.objectName} 实例对象
    * @return 影响行数
    */
<#if common.autoFill>
    @AutoFill(FillTypeEnum.CREATE)
</#if>
    int insert(${data.className} ${data.objectName});

    /**
    * 批量新增数据
    *
    * @param entities List<${data.className}> 实例对象列表
    * @return 影响行数
    */
    int insertBatch(@Param("entities") List<${data.className}> entities);

    /**
    * 修改数据
    *
    * @param ${data.objectName} 实例对象
    * @return 影响行数
    */
<#if common.autoFill>
    @AutoFill(FillTypeEnum.MODIFY)
</#if>
    int update(${data.className} ${data.objectName});

    /**
    * 通过主键删除数据
    *
    * @param id 主键
    * @return 影响行数
    */
    int deleteByPrimaryKey(Long id);

    /**
    * 条件查询
    *
    * @param ${data.objectName} 查询条件
    * @return List<${data.className}> 列表
    */
    List<${data.className}> findByAll(${data.className} ${data.objectName});
}