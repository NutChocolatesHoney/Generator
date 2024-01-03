package com.base.service;

import com.github.yulichang.base.MPJBaseServiceImpl;
import com.base.mapper.Base${data.className}Mapper;
import com.base.models.${data.className};
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class Base${data.className}Service extends MPJBaseServiceImpl<Base${data.className}Mapper, ${data.className}> {

}
