package com.fiftyhertz.pns.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson
public class VariableDetails {

    /**
     */
    private String variableName;

    /**
     */
    private String datatype;

    /**
     */
    private String accessModifier;

    /**
     */
    @ManyToOne
    private ClassDetails classId;

    /**
     */
    @ManyToOne
    private MethodDetail methodId;
}
