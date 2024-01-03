package NutChocolatesHoney.core.common;

import NutChocolatesHoney.core.definition.ColumnDefinition;
import lombok.Getter;

import java.math.BigDecimal;
import java.sql.Blob;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.util.Date;
import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

public class TypeConversion {
  @Getter
  private static TypeConversion instance = new TypeConversion();
  private final Map<String, Class<?>> dbTypeMappingMap = new ConcurrentHashMap<>(256);

  private TypeConversion() {
    initMysqlDbType();
//    initOracleDbType();
//    initSqlServer();
  }

  /** 初始化mysql数据库字段类型对应的java类型 */
  private void initMysqlDbType() {
    // mysql数据库字段类型
    dbTypeMappingMap.put("TINYINT", Boolean.class);
    dbTypeMappingMap.put("TINYINT UNSIGNED", Boolean.class);
    dbTypeMappingMap.put("SMALLINT", Integer.class);
    dbTypeMappingMap.put("MEDIUMINT", Integer.class);
    dbTypeMappingMap.put("INT", Integer.class);
    dbTypeMappingMap.put("INT UNSIGNED", Integer.class);
    dbTypeMappingMap.put("BIGINT", Long.class);
    dbTypeMappingMap.put("BIGINT UNSIGNED", Long.class);
    dbTypeMappingMap.put("BIT", Boolean.class);
    dbTypeMappingMap.put("DOUBLE", Double.class);
    dbTypeMappingMap.put("FLOAT", Float.class);
    dbTypeMappingMap.put("DECIMAL", BigDecimal.class);
    dbTypeMappingMap.put("CHAR", String.class);
    dbTypeMappingMap.put("VARCHAR", String.class);
    dbTypeMappingMap.put("DATE", Date.class);
    dbTypeMappingMap.put("TIME", LocalTime.class);
    dbTypeMappingMap.put("YEAR", Date.class);
    dbTypeMappingMap.put("TIMESTAMP", Date.class);
    dbTypeMappingMap.put("DATETIME", Date.class);
    dbTypeMappingMap.put("TINYBLOB", Byte.class);
    dbTypeMappingMap.put("BLOB", Blob.class);
    dbTypeMappingMap.put("MEDIUMBLOB", Byte.class);
    dbTypeMappingMap.put("LONGBLOB", Byte.class);
    dbTypeMappingMap.put("TINYTEXT", String.class);
    dbTypeMappingMap.put("TEXT", String.class);
    dbTypeMappingMap.put("MEDIUMTEXT", String.class);
    dbTypeMappingMap.put("LONGTEXT", String.class);
    dbTypeMappingMap.put("ENUM", String.class);
    dbTypeMappingMap.put("SET", String.class);
    dbTypeMappingMap.put("BINARY", Byte.class);
    dbTypeMappingMap.put("VARBINARY", Byte.class);
    dbTypeMappingMap.put("GEOMETRY", String.class);
    dbTypeMappingMap.put("JSON", String.class);
  }

  /** 初始化oracle数据库字段类型对应的java类型 */
  private void initOracleDbType() {
    // Oracle字段属性
    dbTypeMappingMap.put("TIMESTAMP(6)", Date.class);
    dbTypeMappingMap.put("NCHAR", String.class);
    dbTypeMappingMap.put("INTERVAL DAY(2) TO SECOND(6)", Date.class);
    dbTypeMappingMap.put("BINARY_DOUBLE", Double.class);
    dbTypeMappingMap.put("BINARY_FLOAT", Float.class);
    dbTypeMappingMap.put("FLOAT", Float.class);
    dbTypeMappingMap.put("LONG", Long.class);
    dbTypeMappingMap.put("NUMBER", Long.class);
    dbTypeMappingMap.put("TIMESTAMP(6) WITH LOCAL TIME ZONE", Date.class);
    dbTypeMappingMap.put("VARCHAR2", String.class);
    dbTypeMappingMap.put("CHAR", String.class);
    dbTypeMappingMap.put("INTERVAL YEAR(2) TO MONTH", Date.class);
    dbTypeMappingMap.put("TIMESTAMP(6) WITH TIME ZONE", Date.class);
    dbTypeMappingMap.put("DATE", LocalDateTime.class);
    dbTypeMappingMap.put("CLOB", String.class);
    dbTypeMappingMap.put("NVARCHAR2", String.class);
  }

  /** sqlserver */
  private void initSqlServer() {
    dbTypeMappingMap.put("int", Integer.class);
    dbTypeMappingMap.put("bigint identity", Long.class);
    dbTypeMappingMap.put("bigint", Long.class);
    dbTypeMappingMap.put("char", String.class);
    dbTypeMappingMap.put("date", LocalDate.class);
    dbTypeMappingMap.put("datetime", LocalDateTime.class);
    dbTypeMappingMap.put("datetime2", Date.class);
    dbTypeMappingMap.put("float", Float.class);
    dbTypeMappingMap.put("nchar", String.class);
    dbTypeMappingMap.put("ntext", String.class);
    dbTypeMappingMap.put("numeric", Double.class);
    dbTypeMappingMap.put("nvarchar", String.class);
    dbTypeMappingMap.put("text", String.class);
    dbTypeMappingMap.put("time", LocalTime.class);
    dbTypeMappingMap.put("timestamp", Date.class);
    dbTypeMappingMap.put("tinyint", Boolean.class);
    dbTypeMappingMap.put("varchar", String.class);
  }

  /**
   * 返回java类型
   *
   * @param column 字段定义
   * @return java类型
   */
  public Class<?> getJavaClass(ColumnDefinition column) {
    for (Map.Entry<String, Class<?>> x : dbTypeMappingMap.entrySet()) {
      if (column.getDbType().equals(x.getKey())) {
        return x.getValue();
      }
    }
    // 没有对应的类型就返回Objects.class
    return Object.class;
  }

  /**
   * 追加类型
   *
   * @param key key
   * @param value value
   */
  public void put(String key, Class<?> value) {
    dbTypeMappingMap.put(key, value);
  }
}
