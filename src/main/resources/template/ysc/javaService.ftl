package com.retail.common.v2.services;

import com.retail.common.v2.mappers.${data.className}Mapper;
import com.retail.common.v2.models.${data.className};
import com.github.yulichang.base.MPJBaseServiceImpl;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.Optional;

@Service
@Transactional(rollbackFor = Exception.class)
public class ${data.className}Service extends MPJBaseServiceImpl<${data.className}Mapper, ${data.className}> {

}
