// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.domain;

import com.fiftyhertz.pns.domain.ClassDetails;
import com.fiftyhertz.pns.domain.MethodDetail;
import com.fiftyhertz.pns.domain.VariableDetails;

privileged aspect VariableDetails_Roo_JavaBean {
    
    public String VariableDetails.getVariableName() {
        return this.variableName;
    }
    
    public void VariableDetails.setVariableName(String variableName) {
        this.variableName = variableName;
    }
    
    public String VariableDetails.getDatatype() {
        return this.datatype;
    }
    
    public void VariableDetails.setDatatype(String datatype) {
        this.datatype = datatype;
    }
    
    public String VariableDetails.getAccessModifier() {
        return this.accessModifier;
    }
    
    public void VariableDetails.setAccessModifier(String accessModifier) {
        this.accessModifier = accessModifier;
    }
    
    public ClassDetails VariableDetails.getClassId() {
        return this.classId;
    }
    
    public void VariableDetails.setClassId(ClassDetails classId) {
        this.classId = classId;
    }
    
    public MethodDetail VariableDetails.getMethodId() {
        return this.methodId;
    }
    
    public void VariableDetails.setMethodId(MethodDetail methodId) {
        this.methodId = methodId;
    }
    
}
