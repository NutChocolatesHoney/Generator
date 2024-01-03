package com.tr.app.service

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl
import com.tr.mapper.${data.className}Mapper
import com.tr.models.${data.className}
import groovy.transform.CompileStatic
import groovy.transform.TypeChecked
import org.springframework.stereotype.Service

@CompileStatic
@TypeChecked
@Service
class App${data.className}Service extends ServiceImpl<${data.className}Mapper, ${data.className}> {

}
