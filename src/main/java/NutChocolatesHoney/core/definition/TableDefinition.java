package NutChocolatesHoney.core.definition;

import NutChocolatesHoney.core.common.CoreUtils;
import NutChocolatesHoney.core.enumeration.TableType;
import java.io.IOException;
import java.io.Serializable;
import java.util.*;
import java.util.stream.Collectors;
import lombok.Data;
import org.apache.commons.lang3.StringUtils;

@Data
public class TableDefinition {

  private static final String DEL_FLAG = "active";

  /** Schema */
  private String schema;

  private String tablePrefix;

  /** 表名 */
  private String tableName;

  private String tableMappingName;

  /** 表描述 */
  private String tableRemark = "";

  /** 类型[表/视图] */
  private TableType tableType;

  /** java类名 */
  private String javaName;

  /** java类名 */
  private String objectName;

  private Set<String> imports;

  /** 非主键字段集合 */
  private List<ColumnDefinition> primaryKeyList = new ArrayList<>();

  /** 非主键字段集合 */
  private List<ColumnDefinition> columnList = new ArrayList<>();

  /**
   * 返回java类名
   *
   * @param titleCase 首字母是否大写
   */
  public String getJavaClassName(boolean titleCase) {
    String returnName = Objects.isNull(javaName) ? tableName : javaName;
    // 首字母小写驼峰命名
    returnName = CoreUtils.getLowerCaseFirstName(returnName);
    if (titleCase) {
      // 首字母大写
      returnName = CoreUtils.toUpperFirstCase(returnName);
    }
    return returnName;
  }

  /**
   * 返回java类名
   *
   * @param titleCase 首字母是否大写
   */
  public String getJavaClassNameWithOutPrefix(boolean titleCase) {
    if (StringUtils.isEmpty(tablePrefix)) return getJavaClassName(titleCase);
    String returnName = tableName;

    if (returnName.indexOf(tablePrefix) == 0) {
      returnName = returnName.replaceFirst(tablePrefix, "");
    }
    // 首字母小写驼峰命名
    returnName = CoreUtils.getLowerCaseFirstName(returnName);
    if (titleCase) {
      // 首字母大写
      returnName = CoreUtils.toUpperFirstCase(returnName);
    }
    return returnName;
  }

  public String getClassName() {
    return getJavaClassName(true);
  }

  public String getObjectName() {
    return getJavaClassName(false);
  }

  public String getClassNameWithOutPrefix() {
    return getJavaClassNameWithOutPrefix(true);
  }

  public String getObjectNameWithOutPrefix() {
    return getJavaClassNameWithOutPrefix(false);
  }

  /** 返回所有字段 */
  public List<ColumnDefinition> getAllColumn() {
    List<ColumnDefinition> allColumn = new ArrayList<>();
    allColumn.addAll(primaryKeyList);
    allColumn.addAll(columnList);
    return allColumn;
  }

  /** 字段中需要导入的类型 */
  public Set<String> getImports() {
    Set<String> imports = new HashSet<>();
    getAllColumn().parallelStream()
        .forEach(
            x -> {
              String name = x.getJavaFieldClass().getName();
              if (!name.startsWith("java.lang.")) {
                imports.add(name);
              }
            });
    return imports;
  }

  public boolean getHasEnum() throws IOException {
    List<ColumnDefinition> list = getEnumColumn();
    return list != null && !list.isEmpty();
  }

  public List<ColumnDefinition> getEnumColumn() throws IOException {
    List<ColumnDefinition> res =
        getAllColumn().stream().filter(ColumnDefinition::getIsEnum).collect(Collectors.toList());
    for (ColumnDefinition x : res) {
      x.setEnumData();
    }
    return res;
  }

  public boolean getIsLogicalDel() {
    return getAllColumn().stream().anyMatch(it-> Objects.equals(it.getColumnName(), DEL_FLAG));
  }
}
