package NutChocolatesHoney.core.definition;

import NutChocolatesHoney.core.common.CoreUtils;
import NutChocolatesHoney.core.common.TypeConversion;
import java.io.IOException;
import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import cn.hutool.core.util.NumberUtil;
import lombok.Data;
import org.apache.commons.lang3.ArrayUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.math.NumberUtils;

@Data
public class ColumnDefinition implements Serializable {
  private static final long serialVersionUID = 3211805164021901088L;

  /** 字段名 */
  private String columnName;

  /** 字段描述 */
  private String columnRemark;

  /** 是否是主键 */
  private Boolean isPk;

  /** 字段数据库类型 */
  private String dbType;

  /** 是否自动递增 */
  private Boolean autoIncrement;

  /** 字段长度 */
  private String columnSize;

  private String enumNameType = "String";

  private String enumValueType = "Integer";

  private List<Map> enumData;

  /** 返回java字段名 默认小写 */
  public String getJavaFieldName() {
    return getJavaFieldName(null, null, false);
  }

  public String getJavaFieldNameTitleCase() {
    return getJavaFieldName(null, null, true);
  }

  /**
   * 返回java字段名
   *
   * @param titleCase 首字母是否大写
   */
  public String getJavaFieldName(boolean titleCase) {
    return getJavaFieldName(null, null, titleCase);
  }

  /**
   * 返回java字段名
   *
   * @param prefix 前缀
   * @param suffix 后缀
   */
  public String getJavaFieldName(String prefix, String suffix, boolean titleCase) {
    String returnName = columnName.toLowerCase();
    // 首字母小写驼峰命名
    returnName = CoreUtils.getLowerCaseFirstName(returnName);
    if (StringUtils.isNotEmpty(prefix)) {
      returnName = prefix + "_" + returnName;
    }
    if (StringUtils.isNotEmpty(suffix)) {
      returnName = returnName + "_" + suffix;
    }
    if (titleCase) {
      return CoreUtils.toUpperFirstCase(returnName);
    }
    return returnName;
  }

  /** 返回java字段类型 */
  public Class<?> getJavaFieldClass() {
    return TypeConversion.getInstance().getJavaClass(this);
  }

  public String getDbTypeName() {
    if (getJavaFieldClass() == Integer.class) {
      return "INTEGER";
    }
    if (getJavaFieldClass() == String.class) {
      return "VARCHAR";
    }
    if (getJavaFieldClass() == Long.class) {
      return "BIGINT";
    }
    if (getJavaFieldClass() == BigDecimal.class) {
      return "DECIMAL";
    }
    return dbType;
  }

  public boolean getIsEnum() {
    return columnRemark.contains("[")
        && columnRemark.contains("]");
  }

  public String getEnumName() {
    String fieldName = getJavaFieldName();
      return fieldName.substring(0, 1).toUpperCase() + fieldName.substring(1);
  }

  public void setEnumData() {
    String s = columnRemark.substring(columnRemark.indexOf("[") + 1, columnRemark.lastIndexOf("]"));
    String[] sData = s.split(",");
    if (ArrayUtils.isNotEmpty(sData)) {
      List<Map> res = new ArrayList<>();
      for (String x : sData) {
        String[] v = x.split(":");
        if (v.length != 2) continue;
        Map<String, Object> map = new HashMap<>();
        map.put("name", v[0]);
        enumNameType = NumberUtil.isNumber(v[0]) ? "Integer" : "String";
        map.put("value", v[1]);
        enumValueType = NumberUtil.isNumber(v[1]) ? "Integer" : "String";
        res.add(map);
      }
      enumData = res;
    }
  }

  public String getColumnRemark() {
    return columnRemark
        .replaceAll("\r", "")
        .replaceAll("\n", "")
        .replaceAll("\"", "")
        .replaceAll("“", "")
        .replaceAll("”", "");
  }
}
