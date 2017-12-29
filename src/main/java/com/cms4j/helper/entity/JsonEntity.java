package com.cms4j.helper.entity;

import com.alibaba.fastjson.JSON;

public abstract class JsonEntity extends Entity {

    @Override
    public String toString() {
        return toJsonString();
    }
}
