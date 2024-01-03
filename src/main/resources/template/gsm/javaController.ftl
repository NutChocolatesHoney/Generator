package ${common.modulePath}.${createInfo.packageName};

import com.ceair.gsm.common.page.PageDTO;
import com.ceair.gsm.common.response.Response;
import com.ceair.gsm.common.response.ResponseHelper;
import ${common.modulePath}.po.${data.className};
import ${common.modulePath}.service.${data.className}Service;
import ${common.modulePath}.qo.${data.className}QO;
import com.github.pagehelper.PageInfo;
import java.util.List;
import javax.annotation.Resource;
import org.springframework.web.bind.annotation.*;
import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import org.springframework.validation.annotation.Validated;
import com.ceair.gsm.common.BaseController;

/**
* ${data.tableRemark}(${data.tableName})控制层
*
* @author ${common.username}
* @since ${common.now}
*/
@RestController
@RequestMapping("${data.objectName}")
@Api(tags = "${data.tableRemark}")
@Validated
public class ${data.className}Controller extends BaseController {
    /** 服务对象 */
    @Resource private ${data.className}Service ${data.objectName}Service;

    /**
    * 分页
    *
    * @param ${data.objectName}QO 查询对象
    * @return 分页
    */
    @GetMapping("page")
    @ApiOperation(value = "分页")
    public Response<PageInfo<${data.className}>> page(${data.className}QO ${data.objectName}QO, PageDTO page) {
        return ResponseHelper.makeOKRsp(${data.objectName}Service.page(${data.objectName}QO, page));
    }

    /**
    * 列表
    *
    * @param ${data.objectName}QO 查询对象
    * @return 列表
    */
    @GetMapping("list")
    @ApiOperation(value = "列表")
    public Response<List<${data.className}>> list(${data.className}QO ${data.objectName}QO) {
        return ResponseHelper.makeOKRsp(${data.objectName}Service.list(${data.objectName}QO));
    }

    /**
    * 新增数据
    *
    * @param ${data.objectName} 实体
    * @return 新增结果
    */
    @PostMapping
    @ApiOperation(value = "新增")
    public Response<${data.className}> add(@RequestBody ${data.className} ${data.objectName}) {
        return ResponseHelper.makeOKRsp(${data.objectName}Service.insert(${data.objectName}));
    }

    /**
    * 编辑数据
    *
    * @param ${data.objectName} 实体
    * @return 编辑结果
    */
    @PutMapping
    @ApiOperation(value = "编辑")
    public Response<${data.className}> edit(@RequestBody ${data.className} ${data.objectName}) {
        return ResponseHelper.makeOKRsp(${data.objectName}Service.update(${data.objectName}));
    }
    
    /**
    * 删除数据
    *
    * @param id 主键
    * @return 删除是否成功
    */
    @DeleteMapping("{id}")
    @ApiOperation(value = "删除")
    public Response<Boolean> deleteById(@PathVariable Long id) {
        return ResponseHelper.makeOKRsp(${data.objectName}Service.deleteById(id));
    } 
}
