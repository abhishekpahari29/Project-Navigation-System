// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.domain;

import com.fiftyhertz.pns.domain.VariableDetails;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect VariableDetails_Roo_Jpa_Entity {
    
    declare @type: VariableDetails: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long VariableDetails.id;
    
    @Version
    @Column(name = "version")
    private Integer VariableDetails.version;
    
    public Long VariableDetails.getId() {
        return this.id;
    }
    
    public void VariableDetails.setId(Long id) {
        this.id = id;
    }
    
    public Integer VariableDetails.getVersion() {
        return this.version;
    }
    
    public void VariableDetails.setVersion(Integer version) {
        this.version = version;
    }
    
}