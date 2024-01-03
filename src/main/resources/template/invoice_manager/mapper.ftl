package com.shdy.project.worksheet.mapper;

import com.shdy.project.worksheet.domain.${data.className};

import java.util.List;

/**
* ${data.tableRemark}Mapper接口
*
* @author shdy
* @date 2022-09-22
*/
public interface ${data.className}Mapper
{
    /**
    * 查询${data.tableRemark}
    *
    * @param id ${data.tableRemark}ID
    * @return ${data.tableRemark}
    */
    public ${data.className} select${data.className}ById(Long id);

    /**
    * 查询${data.tableRemark}列表
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return ${data.tableRemark}集合
    */
    public List<${data.className}> select${data.className}List(${data.className} ${data.objectName});

    /**
    * 新增${data.tableRemark}
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return 结果
    */
    public int insert${data.className}(${data.className} ${data.objectName});

    /**
    * 修改${data.tableRemark}
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return 结果
    */
    public int update${data.className}(${data.className} ${data.objectName});

    /**
    * 删除${data.tableRemark}
    *
    * @param id ${data.tableRemark}ID
    * @return 结果
    */
    public int delete${data.className}ById(Long id);

    /**
    * 批量删除${data.tableRemark}
    *
    * @param ids 需要删除的数据ID
    * @return 结果
    */
    public int delete${data.className}ByIds(String[] ids);
}
