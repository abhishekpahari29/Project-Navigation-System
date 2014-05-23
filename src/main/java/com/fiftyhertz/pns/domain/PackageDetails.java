package com.fiftyhertz.pns.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findPackageDetailsesByProjectId" })
public class PackageDetails {

    /**
     */
    private String packageName;

    /**
     */
    @ManyToOne
    private Project projectId;
}
