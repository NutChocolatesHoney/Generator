package NutChocolatesHoney.core.enumeration;


import lombok.Getter;

@Getter
public enum TableType {
    /**
     * 表
     */
    TABLE("TABLE"),
    /**
     * 视图
     */
    VIEW("VIEW");
    /**
     * 中文描述
     * -- GETTER --
     *  定义方法,返回值

     */
    private final String value;

    /**
     * 私有构造
     *
     * @param value 值
     */
    TableType(String value) {
        this.value = value;
    }

}
