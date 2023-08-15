package com.microwarp.warden.stand.common.dictionary;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * vo - 字典
 */
public class WardenDictionary {
    public static Map<String,WardenDictionary> DictMap = new HashMap<>();
    private String name;
    private String description;
    private List<DictionaryItem> items = new ArrayList<>();

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public List<DictionaryItem> getItems() {
        return items;
    }

    public void setItems(List<DictionaryItem> items) {
        this.items = items;
    }
}
