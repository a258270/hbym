package com.cms4j.helper.entity;

import java.lang.reflect.Field;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.util.Map;

public abstract class UrlEntity extends Entity {

    @Override
    public String toString() {
        return toUrlString();
    }
}
