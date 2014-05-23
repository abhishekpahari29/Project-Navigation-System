package com.fiftyhertz.pns.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findClassDetailsesByPackageId" })
public class ClassDetails {

    /**
     */
    private String className;

    /**
     */
    private String classVisibility;

    /**
     */
    @ManyToOne
    private Project projectId;

    /**
     */
    @ManyToOne
    private PackageDetails packageId;
}
