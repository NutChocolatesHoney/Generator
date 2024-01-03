package com.shdy.project.worksheet.controller;

import com.shdy.common.utils.poi.ExcelUtil;
import com.shdy.framework.aspectj.lang.annotation.Log;
import com.shdy.framework.aspectj.lang.enums.BusinessType;
import com.shdy.framework.web.controller.BaseController;
import com.shdy.framework.web.domain.AjaxResult;
import com.shdy.framework.web.page.TableDataInfo;
import com.shdy.project.worksheet.domain.${data.className};
import com.shdy.project.worksheet.service.I${data.className}Service;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import java.util.List;

/**
* ${data.tableRemark}Controller
*
* @author shdy
* @date 2022-09-22
*/
@Controller
@RequestMapping("/system/${data.objectNameWithOutPrefix}")
public class ${data.className}Controller extends BaseController {

    private static final String PREFIX = "system/${data.objectNameWithOutPrefix}";
    
    @Autowired
    private I${data.className}Service ${data.objectName}Service;
    
    @RequiresPermissions("system:${data.objectNameWithOutPrefix}:view")
    @GetMapping
    public String ${data.objectNameWithOutPrefix}() {
    return PREFIX + "/${data.objectNameWithOutPrefix}";
    }
    
    /**
    * 查询${data.tableRemark}列表
    */
    @RequiresPermissions("system:${data.objectNameWithOutPrefix}:list")
    @PostMapping("/list")
    @ResponseBody
    public TableDataInfo list(${data.className} ${data.objectName}) {
        startPage();
        List<${data.className}> list = ${data.objectName}Service.select${data.className}List(${data.objectName});
        return getDataTable(list);
    }

    /**
    * 导出${data.tableRemark}列表
    */
    @RequiresPermissions("system:${data.objectNameWithOutPrefix}:export")
    @PostMapping("/export")
    @ResponseBody
    public AjaxResult export(${data.className} ${data.objectName}) {
        List<${data.className}> list = ${data.objectName}Service.select${data.className}List(${data.objectName});
        ExcelUtil<${data.className}> util = new ExcelUtil<>(${data.className}.class);
        return util.exportExcel(list, "${data.objectNameWithOutPrefix}");
    }

    /**
    * 新增${data.tableRemark}
    */
    @GetMapping("/add")
    public String add() {
        return PREFIX + "/add";
    }

    /**
    * 新增保存${data.tableRemark}
    */
    @RequiresPermissions("system:${data.objectNameWithOutPrefix}:add")
    @Log(title = "${data.tableRemark}", businessType = BusinessType.INSERT)
    @PostMapping("/add")
    @ResponseBody
    public AjaxResult addSave(${data.className} ${data.objectName}) {
        return toAjax(${data.objectName}Service.insert${data.className}(${data.objectName}));
    }

    /**
    * 修改${data.tableRemark}
    */
    @GetMapping("/edit/{id}")
    public String edit(@PathVariable("id") Long id, ModelMap model) {
        ${data.className} ${data.objectName} = ${data.objectName}Service.select${data.className}ById(id);
        model.put("${data.objectName}", ${data.objectName});
        return PREFIX + "/edit";
    }

    /**
    * 修改保存${data.tableRemark}
    */
    @RequiresPermissions("system:${data.objectNameWithOutPrefix}:edit")
    @Log(title = "${data.tableRemark}", businessType = BusinessType.UPDATE)
    @PostMapping("/edit")
    @ResponseBody
    public AjaxResult editSave(${data.className} ${data.objectName}) {
        return toAjax(${data.objectName}Service.update${data.className}(${data.objectName}));
    }

    /**
    * 删除${data.tableRemark}
    */
    @RequiresPermissions("system:${data.objectNameWithOutPrefix}:remove")
    @Log(title = "${data.tableRemark}", businessType = BusinessType.DELETE)
    @PostMapping("/remove")
    @ResponseBody
    public AjaxResult remove(String ids) {
        return toAjax(${data.objectName}Service.delete${data.className}ByIds(ids));
    }
}