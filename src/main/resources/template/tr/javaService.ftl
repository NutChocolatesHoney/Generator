package com.tr.app.service;

import com.github.yulichang.base.MPJBaseServiceImpl;
import com.tr.exceptions.ApiException;
import com.tr.mapper.app.App${data.className}Mapper;
import com.tr.models.${data.className};
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import java.util.Optional;

@Service
@RequiredArgsConstructor
public class App${data.className}Service extends MPJBaseServiceImpl<App${data.className}Mapper, ${data.className}> {

    /**
    *
    * @param id 主键
    * @return 根据主键查询 查询不到抛出异常
    */
    public ${data.className} get${data.className}(Integer id){
        return Optional.ofNullable(getById(id)).orElseThrow(()->new ApiException("9400"));
    }
}
