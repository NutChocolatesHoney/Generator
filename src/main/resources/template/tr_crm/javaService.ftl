package com.crm.base.services;

import com.crm.base.commons.ApiException;
import com.crm.base.mappers.${data.className}Mapper;
import com.crm.base.models.${data.className};
import com.github.yulichang.base.MPJBaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ${data.className}Service extends MPJBaseServiceImpl<${data.className}Mapper, ${data.className}> {

    /**
     *
     * @param id 主键
     * @return 实体类
     */
    @SuppressWarnings("unused")
    public ${data.className} get${data.className}(Integer id){
        return Optional.ofNullable(getById(id)).orElseThrow(ApiException::paramsError);
    }
}
