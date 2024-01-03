package NutChocolatesHoney.core;

import cn.hutool.core.util.StrUtil;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.yaml.YAMLFactory;

import lombok.extern.slf4j.Slf4j;
import java.io.IOException;

@Slf4j
public class BuilderFactory {
    private static final ObjectMapper objectMapper = new ObjectMapper(new YAMLFactory());

    public static Builder createBuilder(String alias) throws IOException {
        if (StrUtil.isEmpty(alias)) {
            throw new IllegalArgumentException("ALIAS IS NULL");
        }
        Config config = readConfig(alias);
        return new Builder(config);
    }

    private static Config readConfig(String alias) throws IOException {
        return objectMapper.readValue(BuilderFactory.class.getClassLoader().getResource(StrUtil.format("template/{}/config.yml", alias)), Config.class);
    }
}
