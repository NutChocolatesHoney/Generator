package com.xsh.manage.service.plus;

import com.baomidou.mybatisplus.core.metadata.IPage;
import com.github.yulichang.base.MPJBaseServiceImpl;
import com.github.yulichang.toolkit.MPJWrappers;
import com.github.yulichang.wrapper.MPJLambdaWrapper;
import com.xsh.mapper.plus.Plus${data.className}Mapper;
import com.xsh.models.plus.Plus${data.className};
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.Map;
import java.util.Objects;

@Service
@Transactional(rollbackFor = Exception.class)
public class Plus${data.className}Service extends MPJBaseServiceImpl<Plus${data.className}Mapper, Plus${data.className}> {

    public MPJLambdaWrapper<Object> baseMPJQuery(Map<String, ?> params) {
        return MPJWrappers.lambdaJoin()
<#list data.allColumn as column>
                .eq(Objects.nonNull(params.get("${column.javaFieldName}")), Plus${data.className}::get${column.javaFieldNameTitleCase}, params.get("${column.javaFieldName}"))<#if !column_has_next>;</#if>
</#list>
    }

    public IPage<Plus${data.className}> selectPageByParams(IPage<Plus${data.className}> iPage, Map<String, ?> params) {
            return selectJoinListPage(iPage, Plus${data.className}.class, baseMPJQuery(params).selectAll(Plus${data.className}.class));
    }
}
