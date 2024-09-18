package ${createInfo.modulePath};

import com.aiseeding.ase.main.orm.model.${data.className};
import com.aiseeding.ase.main.entity.query.${data.className}QO;
import com.aiseeding.ase.main.entity.resp.${data.className}Resp;

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import com.baomidou.mybatisplus.core.metadata.IPage;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
* ${data.tableRemark}(${data.tableName})数据库访问层
*
* @author ${common.username}
* @since ${common.now}
*/
public interface ${data.className}Mapper extends BaseMapper<${data.className}> {

    IPage<${data.className}Resp> select${data.classNameWithOutPrefix}Page(IPage<${data.className}QO> page,@Param("qo") ${data.className}QO ${data.objectName}QO);

    List<${data.className}Resp> select${data.classNameWithOutPrefix}List(${data.className}QO ${data.objectName}QO);

}