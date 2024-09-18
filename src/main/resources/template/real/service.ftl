package ${createInfo.modulePath};

import cn.hutool.core.bean.BeanUtil;
import cn.hutool.poi.excel.ExcelUtil;
import com.aiseeding.ase.common.domain.Page;
import com.aiseeding.ase.main.entity.query.${data.className}QO;
import com.aiseeding.ase.main.entity.req.${data.className}Req;
import com.aiseeding.ase.main.entity.resp.${data.className}Resp;
import com.aiseeding.ase.main.orm.dao.${data.className}Mapper;
import com.aiseeding.ase.main.orm.model.${data.className};
import com.alibaba.excel.EasyExcel;
import com.baomidou.mybatisplus.core.metadata.IPage;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;
import java.util.List;

/**
* ${data.tableRemark}(${data.tableName})服务接口
*
* @author ${common.username}
* @since ${common.now}
*/
@Service
public class ${data.className}Service extends ServiceImpl<${data.className}Mapper, ${data.className}>{

    @Resource
    private ${data.className}Mapper ${data.objectName}Mapper;

    public IPage<${data.className}Resp> select${data.classNameWithOutPrefix}Page(IPage<${data.className}QO> page,${data.className}QO ${data.objectName}QO) {
        return ${data.objectName}Mapper.select${data.classNameWithOutPrefix}Page(page,${data.objectName}QO);
    }

    public List<${data.className}Resp> select${data.classNameWithOutPrefix}List(${data.className}QO ${data.objectName}QO) {
        return ${data.objectName}Mapper.select${data.classNameWithOutPrefix}List(${data.objectName}QO); 
    }
            
    public void export(Page<${data.className}QO> page, HttpServletResponse response) throws Exception {
        String fileName = "${data.tableRemark}.xlsx";
        response.setContentType(ExcelUtil.XLSX_CONTENT_TYPE);
        response.setCharacterEncoding("utf-8");
        response.setHeader("Content-Disposition", "attachment;filename=" + URLEncoder.encode(fileName, "UTF-8"));
        EasyExcel.write(response.getOutputStream())
        .sheet("${data.tableRemark}")
        .doWrite(select${data.classNameWithOutPrefix}List(page.getData()));
    }

    public void update${data.classNameWithOutPrefix}(${data.className}Req ${data.objectName}Req) {
        updateById(BeanUtil.toBean(${data.objectName}Req, ${data.className}.class));
    }

    public void insert${data.classNameWithOutPrefix}(${data.className}Req ${data.objectName}Req) {
        save(BeanUtil.toBean(${data.objectName}Req, ${data.className}.class));
    }
}
