// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.fiftyhertz.pns.domain;

import com.fiftyhertz.pns.domain.ClassDetails;
import java.util.List;
import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import org.springframework.transaction.annotation.Transactional;

privileged aspect ClassDetails_Roo_Jpa_ActiveRecord {
    
    @PersistenceContext
    transient EntityManager ClassDetails.entityManager;
    
    public static final EntityManager ClassDetails.entityManager() {
        EntityManager em = new ClassDetails().entityManager;
        if (em == null) throw new IllegalStateException("Entity manager has not been injected (is the Spring Aspects JAR configured as an AJC/AJDT aspects library?)");
        return em;
    }
    
    public static long ClassDetails.countClassDetailses() {
        return entityManager().createQuery("SELECT COUNT(o) FROM ClassDetails o", Long.class).getSingleResult();
    }
    
    public static List<ClassDetails> ClassDetails.findAllClassDetailses() {
        return entityManager().createQuery("SELECT o FROM ClassDetails o", ClassDetails.class).getResultList();
    }
    
    public static ClassDetails ClassDetails.findClassDetails(Long id) {
        if (id == null) return null;
        return entityManager().find(ClassDetails.class, id);
    }
    
    public static List<ClassDetails> ClassDetails.findClassDetailsEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM ClassDetails o", ClassDetails.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public void ClassDetails.persist() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.persist(this);
    }
    
    @Transactional
    public void ClassDetails.remove() {
        if (this.entityManager == null) this.entityManager = entityManager();
        if (this.entityManager.contains(this)) {
            this.entityManager.remove(this);
        } else {
            ClassDetails attached = ClassDetails.findClassDetails(this.id);
            this.entityManager.remove(attached);
        }
    }
    
    @Transactional
    public void ClassDetails.flush() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.flush();
    }
    
    @Transactional
    public void ClassDetails.clear() {
        if (this.entityManager == null) this.entityManager = entityManager();
        this.entityManager.clear();
    }
    
    @Transactional
    public ClassDetails ClassDetails.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        ClassDetails merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
