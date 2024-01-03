package com.tr.manage.controller;

import com.base.service.Base${data.className}Service;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/${data.objectName}")
@Api("${data.tableRemark}接口")
@RequiredArgsConstructor
public class ${data.className}Controller {

    private final Base${data.className}Service base${data.objectName}Service;

}