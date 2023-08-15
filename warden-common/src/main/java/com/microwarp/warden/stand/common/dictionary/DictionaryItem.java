package com.microwarp.warden.stand.common.dictionary;

/**
 * vo - 字典项
 */
public class DictionaryItem {
    private String dataKey;
    private String dataValue;
    private String dataAlias;
    public String getDataKey() {
        return dataKey;
    }

    public void setDataKey(String dataKey) {
        this.dataKey = dataKey;
    }

    public String getDataValue() {
        return dataValue;
    }

    public void setDataValue(String dataValue) {
        this.dataValue = dataValue;
    }

    public String getDataAlias() {
        return dataAlias;
    }

    public void setDataAlias(String dataAlias) {
        this.dataAlias = dataAlias;
    }
}
