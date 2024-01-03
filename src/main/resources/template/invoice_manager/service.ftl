package com.shdy.project.worksheet.service;

import com.shdy.project.worksheet.domain.${data.className};

import java.util.List;

/**
* ${data.tableRemark}Service接口
*
* @author shdy
* @date 2022-09-22
*/
public interface I${data.className}Service {
    /**
    * 查询${data.tableRemark}
    *
    * @param id ${data.tableRemark}ID
    * @return ${data.tableRemark}
    */
    ${data.className} select${data.className}ById(Long id);
    
    /**
    * 查询${data.tableRemark}列表
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return ${data.tableRemark}集合
    */
    List<${data.className}> select${data.className}List(${data.className} ${data.objectName});

    /**
    * 新增${data.tableRemark}
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return 结果
    */
    int insert${data.className}(${data.className} ${data.objectName});

    /**
    * 修改${data.tableRemark}
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return 结果
    */
    int update${data.className}(${data.className} ${data.objectName});

    /**
    * 批量删除${data.tableRemark}
    *
    * @param ids 需要删除的数据ID
    * @return 结果
    */
    int delete${data.className}ByIds(String ids);

}
