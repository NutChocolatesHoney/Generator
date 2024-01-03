package com.shdy.project.worksheet.service;

import com.shdy.common.utils.DateUtils;
import com.shdy.common.utils.text.Convert;
import com.shdy.common.annotation.CreateInfo;
import com.shdy.common.annotation.UpdateInfo;
import com.shdy.project.worksheet.domain.${data.className};
import com.shdy.project.worksheet.mapper.${data.className}Mapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
* ${data.tableRemark}Service业务层处理
*
* @author shdy
* @date 2022-09-22
*/
@Service
public class ${data.className}ServiceImpl implements I${data.className}Service {
    @Autowired
    private ${data.className}Mapper ${data.objectName}Mapper;
    
    /**
    * 查询${data.tableRemark}
    *
    * @param id ${data.tableRemark}ID
    * @return ${data.tableRemark}
    */
    @Override
    public ${data.className} select${data.className}ById(Long id) {
    return ${data.objectName}Mapper.select${data.className}ById(id);
    }
    
    /**
    * 查询${data.tableRemark}列表
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return ${data.tableRemark}
    */
    @Override
    public List<${data.className}> select${data.className}List(${data.className} ${data.objectName}) {
        return ${data.objectName}Mapper.select${data.className}List(${data.objectName});
    }

    /**
    * 新增${data.tableRemark}
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return 结果
    */
    @Override
    @CreateInfo
    public int insert${data.className}(${data.className} ${data.objectName}) {
    return ${data.objectName}Mapper.insert${data.className}(${data.objectName});
    }

    /**
    * 修改${data.tableRemark}
    *
    * @param ${data.objectName} ${data.tableRemark}
    * @return 结果
    */
    @Override
    @UpdateInfo
    public int update${data.className}(${data.className} ${data.objectName}) {
    return ${data.objectName}Mapper.update${data.className}(${data.objectName});
    }

    /**
    * 删除${data.tableRemark}对象
    *
    * @param ids 需要删除的数据ID
    * @return 结果
    */
    @Override
    public int delete${data.className}ByIds(String ids) {
    return ${data.objectName}Mapper.delete${data.className}ByIds(Convert.toStrArray(ids));
    }
}