package ${createInfo.modulePath};

import com.edreaminfo.project.orm.dao.${data.className}Mapper;
import com.edreaminfo.project.orm.model.${data.className};
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
* ${data.tableRemark}(${data.tableName})服务接口
*
* @author ${common.username}
* @since ${common.now}
*/
@Service
public class ${data.className}Service {

    @Resource
    private ${data.className}Mapper ${data.objectName}Mapper;

}
