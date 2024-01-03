package com.tr.app.controller;

import com.tr.app.service.App${data.className}Service;
import io.swagger.annotations.Api;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/app/${data.objectName}")
@Api("${data.tableRemark}接口")
@RequiredArgsConstructor
public class App${data.className}Controller {

    private final App${data.className}Service app${data.objectName}Service;

}