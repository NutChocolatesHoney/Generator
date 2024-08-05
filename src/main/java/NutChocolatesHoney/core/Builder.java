package NutChocolatesHoney.core;

import NutChocolatesHoney.core.definition.ColumnDefinition;
import NutChocolatesHoney.core.definition.TableDefinition;
import NutChocolatesHoney.core.enumeration.TableType;
import cn.hutool.core.collection.CollectionUtil;
import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.io.Writer;
import java.sql.*;
import java.util.*;
import lombok.extern.slf4j.Slf4j;

@Slf4j
public class Builder {
  private final Config config;
  private Connection connection;
  private final List<TableDefinition> createTableList = new ArrayList<>();
  private final Configuration configuration = new Configuration(Configuration.getVersion());

  public Builder(Config config) {
    this.config = config;
  }

  public void build() {
    init();
    createDbConnect();
    loadCreateTable();
    createTableList.parallelStream().forEach(this::createFile);
  }

  private void createDbConnect() {
    Config.DbInfo dbInfo = config.getDbInfo();

    try {
      Class.forName("com.mysql.cj.jdbc.Driver");
    } catch (ClassNotFoundException e) {
      log.error("---数据库驱动加载失败---", e);
      return;
    }

    Properties props = new Properties();
    props.put("user", dbInfo.getUser());
    props.put("password", dbInfo.getPassword());
    // Oracle数据库获取注释需要此配置
    props.put("remarksReporting", "true");
    // Mysql数据库获取注释需要此配置
    props.put("useInformationSchema", "true");
    log.info("---数据库连接中---");
    try {
      connection = DriverManager.getConnection(dbInfo.getUrl(), props);
      log.info("---数据库连接成功---");
    } catch (SQLException e) {
      log.error("---数据库连接失败---", e);
    }
  }

  private void loadCreateTable() {

    Config.DbInfo dbInfo = config.getDbInfo();
    List<String> includeTable = dbInfo.getIncludeTable();
    List<String> excludeTable = dbInfo.getExcludeTable();

    try {
      DatabaseMetaData metaData = connection.getMetaData();
      ResultSet tableSet =
          metaData.getTables(
              connection.getCatalog(), connection.getSchema(), "%", new String[] {"TABLE", "VIEW"});

      while (tableSet.next()) {
        String tableName = tableSet.getString("TABLE_NAME");
        if (excludeTable.contains(tableName)
            || (!includeTable.isEmpty() && !includeTable.contains(tableName))) {
          continue;
        }
        // 表类型
        String tableType = tableSet.getString("TABLE_TYPE");
        // 表注释信息
        String tableRemarks = tableSet.getString("REMARKS");

        // 创建表定义
        TableDefinition table = new TableDefinition(config);
        if (StrUtil.isNotBlank(connection.getSchema())) {
          table.setSchema(connection.getSchema().trim());
        }
        if (StrUtil.isNotEmpty(dbInfo.getTablePrefix()))
          table.setTablePrefix(dbInfo.getTablePrefix());
        table.setTableName(tableName.trim());
        table.setTableType(
            StrUtil.equals(TableType.TABLE.getValue(), tableType)
                ? TableType.TABLE
                : TableType.VIEW);
        if (StrUtil.isNotEmpty(tableRemarks)) {
          table.setTableRemark(tableRemarks.trim());
        }

        // 注册字段
        loadAllColumn(metaData, table);

        createTableList.add(table);
        log.info("[{}]-[{}]已注册成功", tableType, tableName);
      }
    } catch (Exception e) {
      log.error("---表注册异常---", e);
    }
  }

  public void loadAllColumn(DatabaseMetaData metaData, TableDefinition table) {
    try {
      // 主键
      ResultSet primaryKeySet =
          metaData.getPrimaryKeys(
              connection.getCatalog(), connection.getSchema(), table.getTableName());
      List<String> primaryKeyList = new ArrayList<>();
      while (primaryKeySet.next()) {
        String primaryKey = primaryKeySet.getString("COLUMN_NAME");
        if (StrUtil.isNotEmpty(primaryKey)) {
          primaryKeyList.add(primaryKey);
        }
      }

      // 非主键
      ResultSet columnSet =
          metaData.getColumns(
              connection.getCatalog(), connection.getSchema(), table.getTableName(), "%");
      while (columnSet.next()) {
        // 字段名
        String colName = columnSet.getString("COLUMN_NAME");
        ColumnDefinition column = new ColumnDefinition();
        column.setColumnName(colName);
        // 是否自动递增
        String isAutoincrement = columnSet.getString("IS_AUTOINCREMENT");
        column.setAutoIncrement(Objects.equals(isAutoincrement, "YES"));
        // 类型
        String columnType = columnSet.getString("TYPE_NAME");
        column.setDbType(columnType);
        // 字段注释
        String remarks = columnSet.getString("REMARKS");
        column.setColumnRemark(remarks);
        // 字段长度
        String columnSize = columnSet.getString("COLUMN_SIZE");
        column.setColumnSize(columnSize);
        if (primaryKeyList.contains(colName)) {
          column.setIsPk(true);
          table.getPrimaryKeyList().add(column);
        } else {
          column.setIsPk(false);
          table.getColumnList().add(column);
        }
      }
      log.info("---表[{}]字段注册成功---", table.getTableName());
    } catch (SQLException e) {
      log.info("---表[{}]字段注册失败---", table.getTableName(), e);
    }
  }

  private void init() {
    if (config.getCreateInfoList() == null || config.getCreateInfoList().isEmpty()) {
      log.info("---未配置生成信息---");
      return;
    }

    config
        .getCreateInfoList()
        .forEach(
            it -> {
              if (StrUtil.isEmpty(it.getTemplateName()) || StrUtil.isEmpty(it.getOutNameSuffix())) {
                log.info("---缺少必须生成信息--");
              }
            });

    if (config.getDbInfo() == null) {
      log.info("---未配置数据库信息---");
      return;
    }

    try {
      configuration.setDefaultEncoding("utf-8");
      configuration.setDirectoryForTemplateLoading(new File(config.getTemplateDir()));
    } catch (IOException e) {
      log.error("---模板初始化失败---", e);
    }
  }

  private void createFile(TableDefinition table) {
    List<Config.CreateInfo> createInfoList = config.getCreateInfoList();

    for (Config.CreateInfo it : createInfoList) {

      if (Objects.equals(it.getTemplateName(), "enum.ftl")
          && CollectionUtil.isEmpty(table.getEnumColumn())) {
        continue;
      }

      Template modelTemplate;
      try {
        modelTemplate = configuration.getTemplate(it.getTemplateName());
      } catch (Exception e) {
        e.printStackTrace();
        continue;
      }
      String fileName = it.getOutNameSuffix();
      if (it.isRemoveTablePrefix()) {
        fileName = it.getOutNamePrefix() + table.getClassNameWithOutPrefix() + fileName;
      } else {
        fileName = it.getOutNamePrefix() + table.getClassName() + fileName;
      }
      it.setModulePath(StrUtil.format(it.getModulePath(), config.getCommonParams()));
      String outPath =
          StrUtil.format(
              (StrUtil.isNotEmpty(it.getOutPath())) ? it.getOutPath() : config.getOutPath(),
              config.getCommonParams());

      File file =
          new File(
              String.format(
                      "%s/%s/%s", outPath, it.getModulePath().replaceAll("\\.", "/"), fileName)
                  .replaceAll("//", "/"));
      doExecute(table, modelTemplate, file, it);
    }
  }

  private void doExecute(
      TableDefinition table, Template template, File file, Config.CreateInfo createInfo) {
    if (!file.getParentFile().exists()) {
      file.getParentFile().mkdirs();
    }

    Writer out = null;
    try {
      if (!file.exists()) {
        file.createNewFile();
      }
      Map<String, Object> commonParams = config.getCommonParams();
      commonParams.put("now", DateUtil.now());

      out = new FileWriter(file);
      Map<String, Object> data = new HashMap<>();
      data.put("data", table);
      data.put("createInfo", createInfo);
      data.put("common", commonParams);
      data.put("params", createInfo.getParams());
      template.process(data, out);
      log.info("---文件[{}]创建成功---", file.getName());
    } catch (Exception e) {
      log.error("---文件[{}]创建失败---", file.getName(), e);
    } finally {
      try {
        Objects.requireNonNull(out).close();
      } catch (IOException e) {
        log.error(e.getMessage(), e);
      }
    }
  }
}
