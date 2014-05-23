package com.fiftyhertz.pns.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJson
@RooJpaActiveRecord(finders = { "findMethodDetailsByClassId", "findMethodDetailsById" })
public class MethodDetail {

    /**
     */
    private String methodName;

    /**
     */
    private String returnType;

    /**
     */
    @ManyToOne
    private ClassDetails classId;
}
