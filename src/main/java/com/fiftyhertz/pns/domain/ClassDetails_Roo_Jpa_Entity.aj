// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.domain;

import com.fiftyhertz.pns.domain.ClassDetails;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect ClassDetails_Roo_Jpa_Entity {
    
    declare @type: ClassDetails: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long ClassDetails.id;
    
    @Version
    @Column(name = "version")
    private Integer ClassDetails.version;
    
    public Long ClassDetails.getId() {
        return this.id;
    }
    
    public void ClassDetails.setId(Long id) {
        this.id = id;
    }
    
    public Integer ClassDetails.getVersion() {
        return this.version;
    }
    
    public void ClassDetails.setVersion(Integer version) {
        this.version = version;
    }
    
}
