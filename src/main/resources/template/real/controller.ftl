package ${createInfo.modulePath};

import com.aiseeding.ase.common.domain.Page;
import com.aiseeding.ase.common.domain.ResponseWrapper;
import com.aiseeding.ase.main.controller.common.BaseController;

import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import javax.validation.Valid;
import java.util.List;

import com.aiseeding.ase.main.entity.req.${data.className}Req;
import com.aiseeding.ase.main.entity.resp.${data.className}Resp;
import com.aiseeding.ase.main.entity.query.${data.className}QO;
import com.aiseeding.ase.main.service.${common.business}.${data.className}Service;

/**
* ${data.tableRemark}(${data.tableName})
*
* @author ${common.username}
* @since ${common.now}
*/
@RestController
@RequestMapping("/${common.business}/${data.objectNameWithOutPrefix}")
@Validated
public class ${data.className}Controller extends BaseController {

    @Resource private ${data.className}Service ${data.objectName}Service;

    /**
    * ${data.tableRemark}分页
    *
    * @param page 分页查询对象
    * @return 分页
    */
    @PostMapping("selectPage")
    public ResponseWrapper<Page<${data.className}Resp>> selectPage(@RequestBody Page<${data.className}QO> page) {
        return ResponseWrapper.markPage(${data.objectName}Service.select${data.classNameWithOutPrefix}Page(page.toPage(),page.getData()));
    }

    /**
    * ${data.tableRemark}列表
    *
    * @param ${data.objectName}QO 查询对象
    * @return 列表
    */
    @PostMapping("list")
    public ResponseWrapper<List<${data.className}Resp>> list(@RequestBody ${data.className}QO ${data.objectName}QO) {
        return ResponseWrapper.markSuccess(${data.objectName}Service.select${data.classNameWithOutPrefix}List(${data.objectName}QO));
    }

    /**
    * 新增${data.tableRemark}
    *
    * @param ${data.objectName}Req 新增对象
    * @return 新增结果
    */
    @PostMapping("insert")
    public ResponseWrapper<Void> insert(@RequestBody ${data.className}Req ${data.objectName}Req) {
        ${data.objectName}Service.insert${data.classNameWithOutPrefix}(${data.objectName}Req);
        return ResponseWrapper.markSuccess();
    }

    /**
    * 编辑${data.tableRemark}
    *
    * @param ${data.objectName}Req 修改对象
    * @return 编辑结果
    */
    @PostMapping("update")
    public ResponseWrapper<Void> update(@RequestBody ${data.className}Req ${data.objectName}Req) {
        ${data.objectName}Service.update${data.classNameWithOutPrefix}(${data.objectName}Req);
        return ResponseWrapper.markSuccess();
    }
    
    /**
    * 删除${data.tableRemark}
    *
    * @param id 主键
    * @return 删除结果
    */
    @GetMapping("delete")
    public ResponseWrapper<Void> deleteById(Integer id) {
        ${data.objectName}Service.removeById(id);
        return ResponseWrapper.markSuccess();
    }

    /**
    * 导出
    *
    * @param page 分页查询对象
    */
    @PostMapping("/export")
    public void export(@RequestBody @Valid Page<${data.className}QO> page, HttpServletResponse response) throws Exception {
        ${data.objectName}Service.export(page, response);
    }
}