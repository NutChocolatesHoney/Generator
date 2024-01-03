package ${configs.serviceImplPackage};

import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import ${configs.entityPackage}.${data.className}${configs.entitySuffix};
import ${configs.mapperPackage}.${data.className}${configs.mapperSuffix};
import ${configs.servicePackage}.${data.className}${configs.serviceSuffix};
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Service;

/**
 * ${data.tableRemark}${configs.serviceImplSuffix}
 *
 * @author Zhenfeng Li
 * @version 0.0.1
 * @date 2020-04-01 08:04:05
 */
@Service
@Slf4j
public class ${data.className}${configs.serviceImplSuffix} extends ServiceImpl<${data.className}${configs.mapperSuffix},${data.className}${configs.entitySuffix}> implements  ${data.className}${configs.serviceSuffix} {

    private final ${data.className}${configs.mapperSuffix} ${data.objectName}${configs.mapperSuffix};

    public ${data.className}${configs.serviceImplSuffix}(${data.className}${configs.mapperSuffix} ${data.objectName}${configs.mapperSuffix}) {
        this.${data.objectName}${configs.mapperSuffix} = ${data.objectName}${configs.mapperSuffix};
    }

}