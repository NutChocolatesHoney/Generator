package com.boshang.base.services;

import com.boshang.base.commons.ApiException;
import com.boshang.base.mappers.${data.className}Mapper;
import com.boshang.base.models.${data.className};
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
