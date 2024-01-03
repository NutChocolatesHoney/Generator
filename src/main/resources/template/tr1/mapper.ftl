package com.base.mapper;

import com.github.yulichang.base.MPJBaseMapper
import com.base.models.${data.className}
import groovy.transform.CompileStatic
import groovy.transform.TypeChecked

/**
* ${data.tableRemark}Mapper
*/
@CompileStatic
@TypeChecked
interface Base${data.className}Mapper extends MPJBaseMapper<${data.className}> {

}