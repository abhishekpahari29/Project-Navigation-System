// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.domain;

import com.fiftyhertz.pns.domain.ClassDetails;
import com.fiftyhertz.pns.domain.MethodDetail;

privileged aspect MethodDetail_Roo_JavaBean {
    
    public String MethodDetail.getMethodName() {
        return this.methodName;
    }
    
    public void MethodDetail.setMethodName(String methodName) {
        this.methodName = methodName;
    }
    
    public String MethodDetail.getReturnType() {
        return this.returnType;
    }
    
    public void MethodDetail.setReturnType(String returnType) {
        this.returnType = returnType;
    }
    
    public ClassDetails MethodDetail.getClassId() {
        return this.classId;
    }
    
    public void MethodDetail.setClassId(ClassDetails classId) {
        this.classId = classId;
    }
    
}
