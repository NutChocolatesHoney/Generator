package NutChocolatesHoney.core;

import java.io.File;
import java.util.*;
import lombok.Data;

@Data
public class Config {
  private static final String CLASS_PATH =
      Objects.requireNonNull(Config.class.getClassLoader().getResource("")).getPath();
  private static final String DEFAULT_OUT_PATH = CLASS_PATH + "/out/";
  private static final String DEFAULT_TEMPLATE_PATH = CLASS_PATH + "/template/";

  private String alias;

  private String outPath;

  private DbInfo dbInfo;

  private String modulePath;

  private List<CreateInfo> createInfoList;

  private Map<String, Object> commonParams;

  public String getTemplateDir() {
    return DEFAULT_TEMPLATE_PATH + File.separator + alias + File.separator;
  }

  public Map<String, Object> getCommonParams() {
    return Optional.ofNullable(commonParams).orElse(new HashMap<>());
  }

  public List<CreateInfo> getCreateInfoList() {
    return Optional.ofNullable(createInfoList).orElse(new ArrayList<>());
  }

  @Data
  public static class DbInfo {
    private String user;
    private String password;
    private String url;
    private List<String> includeTable = new ArrayList<>();
    private List<String> excludeTable = new ArrayList<>();
    private String tablePrefix;

    public List<String> getIncludeTable() {
      return Optional.ofNullable(includeTable).orElse(new ArrayList<>());
    }

    public List<String> getExcludeTable() {
      return Optional.ofNullable(excludeTable).orElse(new ArrayList<>());
    }
  }

  @Data
  public static class CreateInfo {
    private String templateName;
    private String packageName;
    private String outNamePrefix;
    private String outNameSuffix;
    private boolean removeTablePrefix;
    private String modulePath;
    private Map<String, String> params;
    public String getOutNamePrefix() {
      return Optional.ofNullable(outNamePrefix).orElse("");
    }
  }
}
