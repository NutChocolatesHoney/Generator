package ${configs.servicePackage};

import com.baomidou.mybatisplus.extension.service.IService;
import ${configs.entityPackage}.${data.className};

/**
 * ${data.tableRemark}${configs.serviceSuffix}
 *
<#if configs.author??>
 * @author ${configs.author}
</#if>
<#if configs.author??>
 * @version ${configs.version}
</#if>
 * @date ${configs.createTime?string('yyyy-MM-dd hh:mm:ss')}
 */
public interface ${data.className}${configs.serviceSuffix} extends IService<${data.className}> {

}