package ${configs.mapperPackage};

import com.baomidou.mybatisplus.core.mapper.BaseMapper;
import ${configs.entityPackage}.${data.className}${configs.entitySuffix};

/**
 * ${data.tableRemark}${configs.mapperSuffix}
 *
<#if configs.author??>
 * @author ${configs.author}
</#if>
<#if configs.author??>
 * @version ${configs.version}
</#if>
 * @date ${configs.createTime?string('yyyy-MM-dd hh:mm:ss')}
 */
public interface ${data.className}${configs.mapperSuffix} extends BaseMapper<${data.className}${configs.entitySuffix}> {

}