// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.domain;

import com.fiftyhertz.pns.domain.MethodDetail;
import flexjson.JSONDeserializer;
import flexjson.JSONSerializer;
import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

privileged aspect MethodDetail_Roo_Json {
    
    public String MethodDetail.toJson() {
        return new JSONSerializer().exclude("*.class").serialize(this);
    }
    
    public String MethodDetail.toJson(String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(this);
    }
    
    public static MethodDetail MethodDetail.fromJsonToMethodDetail(String json) {
        return new JSONDeserializer<MethodDetail>().use(null, MethodDetail.class).deserialize(json);
    }
    
    public static String MethodDetail.toJsonArray(Collection<MethodDetail> collection) {
        return new JSONSerializer().exclude("*.class").serialize(collection);
    }
    
    public static String MethodDetail.toJsonArray(Collection<MethodDetail> collection, String[] fields) {
        return new JSONSerializer().include(fields).exclude("*.class").serialize(collection);
    }
    
    public static Collection<MethodDetail> MethodDetail.fromJsonArrayToMethodDetails(String json) {
        return new JSONDeserializer<List<MethodDetail>>().use(null, ArrayList.class).use("values", MethodDetail.class).deserialize(json);
    }
    
}